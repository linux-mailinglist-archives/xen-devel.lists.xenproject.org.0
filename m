Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDD56CB9FA
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 11:00:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515598.798631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph5BB-0001T8-Gp; Tue, 28 Mar 2023 08:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515598.798631; Tue, 28 Mar 2023 08:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph5BB-0001Q6-D8; Tue, 28 Mar 2023 08:59:45 +0000
Received: by outflank-mailman (input) for mailman id 515598;
 Tue, 28 Mar 2023 08:59:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ph5BA-0001Q0-9d
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 08:59:44 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20614.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e082a7f6-cd46-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 10:59:41 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by PAXPR04MB8672.eurprd04.prod.outlook.com (2603:10a6:102:21f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 08:59:39 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 08:59:39 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: e082a7f6-cd46-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2pWC0p7tmRGxLaVsmDk9T6fwtHkLetpli5qDGZKzKaHes6QoToNlhqpNtXM50YdB3ZO2XqqTdNJ/dY/W7HCqMh2y0/Fub0pGeHUZ+oG4+ViX6M6yqZoFSVR43ew3vqYKvZP70nCJNLfG8FRmbgF0/l+hGHvXnJm4+Y3qj4ETwG6W9HY2soDPHdVOx+S/16eoq6CWQgBI/PLWyheQ0LxStrLqYXtydgv0mxD9+GpOkJ9o113Ve5bjKfMAaQ/iPyOg8oPzmMU0Dff/qSO2ELroXMEwO3IDuJLkr8oVxpTPIiXfJq5WIPjVxCHX+ffH0CQB0m8Q9xE6/c5DZRZA4q8Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2l85hnaHm4kI8+50pDF47Gnua/qWJQoEMJDTN0bHoM=;
 b=XpRqk28AXQftNpOurt2PRgMoWXcIdFNJ68goNGkICMbeukZu4bXrKeirFAObg3FFAUQblXXag/LT9+48lggtNAXHcu/Mz599BRRZm+CGevPDiqqHFEBL34IXVTiVYv22WfPXChtEBMjSBWo6tzc/t15IWK++YS+yWo/zdkIzZMNgOW97NLwHlFEOlBhDKE3FCzbdTgSKbfaqMw5lPmdn9VBBjyx35x7vMqicyGmZvk2cX/wXvJSVI2xlYg19NY1UfeFVpnvKcVWPzAFeF+opCicCOfmgI6W/vi10G1wwwE3tMVbDnbzyF4jf2Fp/cwfEP+xqFWcWYG+FGiGhmFbaAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2l85hnaHm4kI8+50pDF47Gnua/qWJQoEMJDTN0bHoM=;
 b=AwIGP01LzoRrFgQHZ5ibefiofIEHPOU9lF5lqAch0EABwl5DhBEA0t2c0A+wrYG+DwS897pl+OFcqltZg1r+T0FG5W2EjvBm62T4dY3QJx8T/w4RlEny+mkwNkikB7b1a2tyHtJMac8jlkJH4fHrAAIa7GRu5NbTsmscT9XLVL4Qn/iGDbB+6G4FSUFJDy6aE123dGkvVCimfRzuLnAOsBUYmCLEVLoBtwYSZgVsH8+mPdUMoynW5XoLdvLARYUFY0hh1HRqYx5Hse9bxKpOs5L1Z13ZM39vq6mixDMbPoPG/xEpchqS8N+8KbVnuJhFoVPCbOjfIOWPZxbaiyEBog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <77245440-079f-50bd-7237-a44317642b3f@suse.com>
Date: Tue, 28 Mar 2023 10:59:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [XEN PATCH v5] x86/monitor: Add new monitor event to catch I/O
 instructions
Content-Language: en-US
To: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Anton Belousov <abelousov@ptsecurity.com>, xen-devel@lists.xenproject.org
References: <7bd5ec4ff75ea0157d782f8820db1d17b6ad1289.1679406554.git.isaikin-dmitry@yandex.ru>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7bd5ec4ff75ea0157d782f8820db1d17b6ad1289.1679406554.git.isaikin-dmitry@yandex.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::8) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|PAXPR04MB8672:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a763f8a-60f5-4fc7-5164-08db2f6ac330
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f8Q+GfJDsNHannAQ1ihfwKMnwo5uAahJ/N7bZXi094Fr/9GILnAr4HTdJPeEZ3XKzPMK5AnuvtUPkoRY7oFWSoClS4rx3o3NbjxxUPd4M4MYK0Z1ibyiQL/eomayaTDSSy8W2o8V4MbeMxGuxH0S2Wsido0CWBLRDA6gA17OAa1dhQ5aTJ6WtT42+uAzSV+mTL73yv+SZzj5ybMVh7EEXq2rlDl0KH1vH5R1DTBX7Lu711UY1BLhTx4DXlSvvT9gQfIOfa/IGor9zrzIfarNwX0kmHY9R/F42qFyUyR5RZCEP/4w6N8UHnzWDGxDtFRZKomEZmevoEkdUpY04BGweaYI/z7Z7rMS/GGkENYMRhWFAPyedAZZ5VObtXVvKn9S5kSehlwui8/kDhJ4XZOm8NGsPsEERkTAPkL8tnWp0skQmzDummmKLNFJL00/1NHNVVu4weKwAnnJF2rAX7nhTPz+T6y14mnnuA3GaEIEFKzxmwv9yT98zTkESrmpaKEklerV5f86xMt1/bSt4aSfsnpWJYOcJwiQsFA9n3HBrvwNaxUpR3SPy59GSnK7lmdWzIh8igGNiTK0E7U4+Xx5+4o2ZNYqNRiQtUUxrjvN5PYIW56MWYfXBa5nB4EmlT8Nka8vAulqKRMf/3pceYIyKnj9BJteSqQSPZaUYQFkK2qWxnI0VrvWsvTitRkaMsC8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199021)(31696002)(186003)(83380400001)(8936002)(86362001)(2616005)(6506007)(6512007)(26005)(53546011)(31686004)(2906002)(4744005)(38100700002)(5660300002)(478600001)(7416002)(66556008)(4326008)(66946007)(316002)(66476007)(41300700001)(8676002)(6486002)(36756003)(6916009)(54906003)(23180200003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGpveGpUdXkxYjFYbXVSb2NFK0FSWHdzMTZGUFJZQi9yR1p6ZHliR2gzbUZK?=
 =?utf-8?B?WFhubU5DRExiVmxiZUgwMDN3S2VnbC93Vk5GRExDM0JWdm80UjlZT2M5M2xs?=
 =?utf-8?B?ZkRLdTlqeGVVbjk1WFh3bDgwZGpGdjJ6aGcrNGg0b3JVdEgwWFArTkpmMGt1?=
 =?utf-8?B?WTJSY3dCRWRwdFdKWnQvVWdNZGZGcWhTVDlDbGEvbnVpSlN4VTVSNHpkRVVz?=
 =?utf-8?B?eG1INlhOVzR0UHRxNGRZVVcvSHAxajZ6ekZyT3JJbjBFT3NrREt1aWxqNDRH?=
 =?utf-8?B?MlJHT1VsemVXaXp4eGJIRXNoenhxZ3pmSFROM1lpNFlMZHljRmIxMmtrMDRp?=
 =?utf-8?B?MkVsbWdaUkVST0VjZTZrUWYvS3pqcVZHckpXVVZEV2JRWWtseTEzT2diYnB4?=
 =?utf-8?B?TEtZcjAxbVl4dC9keW9FclpvcWNvVHRKMmVlVWtvRU50ZDBIMmJJaFRxaVdr?=
 =?utf-8?B?TjVlZzY1TWxDd05zTnVUcGo5MUNQWDNwbDRyU1dKSzNoMnBzWlpOcDIyb0N0?=
 =?utf-8?B?eFdyY2JodXRISFpNL1ZyckQ4NzNORTlPNGVZNUNaZnhyOUk4SVU1ZjRWMVRN?=
 =?utf-8?B?YnNPQUU3cmFuMU8xUm1kOXByTlc2NTN0UXBUTGhGV1BWYVFLK1FGRXdNcDJn?=
 =?utf-8?B?TFNQREhzMWlNOVRlTVZ4TS9YYXVYMy9OcUgzZ3FIbzQxaE1zSWtDaVM0dzZF?=
 =?utf-8?B?ODhyTk80cWNyOXhqTjRiY3pad3NvWGVYSUZmYzBFc1FseTZvOVdFOStXb3hX?=
 =?utf-8?B?OU80MVk1TjBqZ3dzcG5YeUJ6bk5LWlloZzlyZkE0eFRKTDBialdDTWg3TXUy?=
 =?utf-8?B?dEhEdno0TXk1VUtZb2ZPQ0tiZjROVURkQ1ZkUTgwMExmbXVsd2E1VGJpaXBI?=
 =?utf-8?B?VHFlZVMzeFdwME5YWmNtMXF4eG1aaEVMYkhaV2dvS3BEdnZGY3RpTkRST1ZP?=
 =?utf-8?B?cGQ0amhMNHkwRUs3MXF3V3pXa1BDa1ZqeGhLY3d1Z3FKeFFRNk1WOTYrcXRV?=
 =?utf-8?B?ZDZMYVdOellxTkZ0b2tpcU9xalJOM3BsM3ZPaENDMmlYZmFoLzVnTHU3SGJO?=
 =?utf-8?B?QjBzUTlTMS85am1pR292Y09LaHQxNCtvOVV5aEFGY0JsMnBYVGtLSDZ3VDdx?=
 =?utf-8?B?WTBSZDB0Si80YmlaTVZkMm5WM1BSOFUxekRYSzZlV3F4V3lYNGtBdWxEK3dW?=
 =?utf-8?B?Yis4bDN3Q2hPNU1UcHA5TDJDOVBlTFV6QVljMGgwc1V0NThPTkp2U3Z5U3VL?=
 =?utf-8?B?M2FTYyswSjhnOWlrYzZMS2ZzQit3S3VZVC9FNE9IanRwcVhZTndGZGNLMTJF?=
 =?utf-8?B?STQ4Z2FMRTN0ZFBHTnFTSnp1SFVXK2IzNk4wSTRoRVBZOGUwS0xxOHYzci9S?=
 =?utf-8?B?d0lqOFVNNXFyT0w4M2Q4WFpNUjMvOXBEMU5yWVJhSVBhTUZVMWQ4VEVFVHNO?=
 =?utf-8?B?UGFhVjVjNnVYelJIUkJlazlyNHlMVmxCRlZqUjlyR2ZPY3JkUmpxWEVzQlRy?=
 =?utf-8?B?U2grczNCM1c4dXhnak9GbzVJaWNXWWg0ZnZqYnU2UzRFTmZCNG5kZFByVUx5?=
 =?utf-8?B?d1Y2Q08xYVdPcDVYNE96cit2Y2d3YWdYSjdRdlpsbFZPMzBMeTdEcFJMYkFw?=
 =?utf-8?B?dDJiK0hhTHZ3MjlkT01Sc3MzNlk3SFRkN0MvRUNNQUxyRlNJbDk3L0xCMkJi?=
 =?utf-8?B?WnZSb1hOSE5oTUNJRFlqVmJMcHpUTDdCMGtVbzlwZmEydlloMHdGTmppUkZE?=
 =?utf-8?B?TGR0a0MyRmJzV2lnajJPNFNQc1N1NkozUlV2clpsYzFlNEpNUU5XeUJidS9J?=
 =?utf-8?B?TW5VeXJ5VEI4c0ZTdjZTU3pLNFlBSU5MVHpQUWlxZ3p2cTZVOUFHTFo1ZUkx?=
 =?utf-8?B?bG5uSldGR2x0VTJmbDI0ai9MYmptRW9JUEdNeTRIMXkyMk1rYVVrbGw1Sy8r?=
 =?utf-8?B?MG5tOENXOHlkZEwwSVRTbmNzaDBTeEEwWmt4QStYRnJVbWlrTGtJU1g4b1BD?=
 =?utf-8?B?QnJ4b2FOMHdjTjVXZzV4Mmc5Mkg0QlB0SnF5M3RoMWdLTHZkQ0pkNGJhVnFk?=
 =?utf-8?B?SUYxYjhkVlFzSWlDVkVPbC81ck1KUFppWGN1REhuQVp0WERBVm1NSE1NSmpj?=
 =?utf-8?Q?3X4MDYfZWeFVr8gBPbfDKxeq4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a763f8a-60f5-4fc7-5164-08db2f6ac330
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 08:59:39.4244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5GMx5JMQOzl5TEZ4FBYAYLZB/HJamz25+hzgKhU/T6/BIupuiaH8vFRE1LY6E1q6ZTpRQ1UZ3OwoA8327uyKHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8672

On 21.03.2023 14:58, Dmitry Isaykin wrote:
> Adds monitor support for I/O instructions.
> 
> Signed-off-by: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
> Signed-off-by: Anton Belousov <abelousov@ptsecurity.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

On top of Kevin's R-b and besides Tamas'es (to-be-re-instated) ack this
also would preferably get one from Anthony.

Jan

