Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C515B34B0
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 11:57:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404098.646436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWalH-0003ic-Vi; Fri, 09 Sep 2022 09:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404098.646436; Fri, 09 Sep 2022 09:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWalH-0003fN-RX; Fri, 09 Sep 2022 09:57:23 +0000
Received: by outflank-mailman (input) for mailman id 404098;
 Fri, 09 Sep 2022 09:57:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oWalG-00038B-Bk
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 09:57:22 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50076.outbound.protection.outlook.com [40.107.5.76])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c304fce2-3025-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 11:57:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0401MB2607.eurprd04.prod.outlook.com (2603:10a6:800:58::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.18; Fri, 9 Sep
 2022 09:57:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.019; Fri, 9 Sep 2022
 09:57:17 +0000
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
X-Inumbo-ID: c304fce2-3025-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iq8kBr4gzShhlrGsMl8c8Lerp1DxGg+a+Cn/9trEnpMQ3ifjpDamvGx0KvQW6J6RYR14C0jK16uk3G+PF2Ra+HSz8KjY76uYaK/ZOzk4FsRFrDI2UCCJZld8fXZHQsr5weM8WKUcqQznzC1L5Kr7PHTnot5cqZo++oyDaiDVHBWiwbGyg1vk2j3Ks3/zCgrhBZkdWEFkcIQplodtxrCxjUemC9KH2+MPIA5ZrgGWbFWiqgHQ1aWcARIwbwGY6dJtg1OM2V5Bum2j2H2Ptj1TW66NBXWUo7K8A/OpvSgnjgcehS86fVuGrLHVLzm9i1nQZqjQ96eBFO+s4V6WY2RF6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=So4PRzAXFLsJNR+TgexVXhf5/h019GxN0tQJ6nu9+XI=;
 b=OJeYrslCCmhwKYuB3cFMEjHpPbFlG3fvDvbBmiMmi7wYHL93a9tAEAvhrvb5vB1daMUEjrYiiq3sAyxJ4uyEkGQ9pkmSdLYYFZAqfVex8g4kYHftsOS8wxuLH1Rm5k/zu4KZrfHVIloc+z0LSXrWUdWcZvWunrQmwQV2WFouZY9GmvOGwZFnrHgvbOUzZuSR9KHUdaDrkdinu8cBxBnpChiLohwjPKYafap54B6IfbA4r22uHjFAdsERnifW5EH9/J96OjM2IzhGRiBK+tJHDKsIK0jlX9OUWX0JKYGfC+HHztpKdPKGX+ZTHs5emcRCsZ2MneN1AQblTn78w98wEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=So4PRzAXFLsJNR+TgexVXhf5/h019GxN0tQJ6nu9+XI=;
 b=i8JgdxWvvgiHzABx3m+8qTvCMk/8tm09w6X7FoAYh6FvhdFqEgp5H4LgS7cmavWH++xx9r/sbo3X3bk5Tvy4o+0WXk+lWoFachKVVSKa+UNqz+blc6k9FItGXYlQMxYKhqp6wluo6daAD+fx50DIV3y5jycMaloI88A9w6VT6C4qqNZdvz6f2d5kvYzn/koYxaEFtE3A9s720Zi6KMAw+L+7NgZ1BcGcm7k0PvR54oAkGrCosWw8ZwDQ00Tpfc7J8nArQezBVC4HEOitTBc7F4btmi3PRhy3kwWT1zLiYdSERsnnyhix0St3LunNHA/E9YJBLTI7PUdNyMl0C1tP/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d63aff2d-8cc5-800c-66d5-9cfd4539e431@suse.com>
Date: Fri, 9 Sep 2022 11:57:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] xen/gnttab: fix gnttab_acquire_resource()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>
References: <20220909080944.28559-1-jgross@suse.com>
 <52ff1228-3092-c455-479d-315a16cfaaa6@suse.com>
 <77d2c3fa-7cee-6f86-215a-a95ce242a990@suse.com>
 <AS8PR08MB7991390DCD341CF688FDB0E892439@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB7991390DCD341CF688FDB0E892439@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR0401MB2607:EE_
X-MS-Office365-Filtering-Correlation-Id: 50f839e1-b97c-4331-b45b-08da9249ade7
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oOcBoayFn6Y94brtCjbdhY0X48i3ltBBsspfNUS/5Z0Bxt5gjsmgrOwCr0LuHcBlTl+I67+gVvpoN3fIDT1mYe674Oqh8LpxMQ6aWPYgW7sxRcWEJ5HX386ns7xff3s+2Zu9jDFe/niSyNwQTYiMdYjkoh7fAP3ZWZIVad2gLdt3Oxn2hoQ5cR/r312ldcIjlv9lATSoN7Zpr1FP8cn7fvY6q5o3PcnGOeF6jcLPKgS5CzxV3pjPautOhjKJ+yJJH3NoTEQcVoozk/JUP0F2vD1QZL1gAGimNUYJHYDBgVlOc9y/qqu/+Xcs1JfBbZ1NkQI3IX4cE7yrhzRPAxzFWEInwzEkmgqKuIBkhmU/VdBfg90YuvToIRo8iVndAvGi59ROjj22gSxwlZMHefUmstbHjbMO+OXgncw2dxHhmySWZYRJbmCsxrnhe3b0TltGrEfMLGn1ZbSkOi7hGAKbQvkRJbwxYdYBnE7wWtHx3BHQtf3LmkuCum6BCt0Bpb1gWgy4I70JBZl/h6bsQDb53OOBqyE17oDVLiBKsi1m3D2AP3FaKnBpk+qsSQx3fLrDUmy7hNOC9YzQwKeDLLjKXqBthWF3gD/jZu82dEqq/lMdfrWsJc8JpRJIzPB33/PTHy20C5iCFQM4FgzXvy6ytNcof/xdNoZyQO9PmyTBcKbrc3b99B4wQlOInZrCglkBTR+tnqf7ZdaBYcD3rOXDikRWr931CxGIFFW6hz/RbGqKDCMP4jdL0aYKJSLVBMcbjuOaUcsYYS20ndQW/IzTt4AH+KkS0+QL7MjLNvu+F50=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(136003)(39860400002)(346002)(376002)(8936002)(54906003)(2616005)(6916009)(6486002)(186003)(4326008)(66476007)(31686004)(5660300002)(8676002)(66556008)(6506007)(41300700001)(107886003)(2906002)(26005)(36756003)(6512007)(316002)(478600001)(66946007)(83380400001)(53546011)(38100700002)(86362001)(558084003)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGUvTm5uT1cxQlM1MVhqT0QrZVd3KzZVREJsSWJuV3NUeHVLd3pPa0pqT2Jn?=
 =?utf-8?B?dks5REpobkl6Y2ZrVTU0K3poQ0draVM3dVRGbFFDRHFSVVk2a0JUR05vQkZK?=
 =?utf-8?B?dHlnUkg0NVpHVFpaWEV0MllXVDVpdGtIcDZzVTlOWVJ4YUk1cEl4STROMWRO?=
 =?utf-8?B?YXA0bGdQdGRDRUJteGtKUWRCVWg2Z0FGV2hFNzROMDNScEJVYTE3aVhmS3BI?=
 =?utf-8?B?WkVISVUzOUtEVmd2c1VvUzQ2enoxWElsQy9veGFnRWxCditSZnFTcnh4ZkN2?=
 =?utf-8?B?QTJkUUFTQ243QjNnengzb1F0NG5LWnZLV1A4ckdNZ3Y3VGcrelF0YUU2MEJE?=
 =?utf-8?B?ZUZxWmRzT0U5MlRaZ3ZOemk1YU9oSDFrQnNBSndkelEwTW42RlhndURueGJl?=
 =?utf-8?B?M3NxY2pUbXlrK01jQmw1ekg3QjhwLzNubllSaHczTE8rWnJWRHQ1VkxNWTJM?=
 =?utf-8?B?bUtlNytyS0J5ZHhFSHRxbzNLUDUxM0R2SVdTT2U1SDk5R1g4TEpFKzFrc0JW?=
 =?utf-8?B?cndOQzBLekVicFlSMm9tVzdWbWZFbjQ2SHMxR2E3alZvQ1E1cUJ2Nm9LV29v?=
 =?utf-8?B?M25VQWpUcWgvU1JzQTA2dktnSDFmVFBJL1R0UEErb3czZ2F5Z09WZlY5TU11?=
 =?utf-8?B?WnZoWlBHZC9VOEtDVUZHQmlqMDFBbVl5dkwydVFiM1lLTE42bjRHNnptVVB5?=
 =?utf-8?B?RjNDNmZEaFhXL0hJRC9UWVRNNEN3cXdxYVFiVXljbDR0MDF2VEFjSGFYR09J?=
 =?utf-8?B?WmR1a1hhTEZkcEpEUitjSDdHT0RSdFlJR1djeHRXQVBsR1A5bzJkMkswUVBD?=
 =?utf-8?B?NjBVa3cwM1ozd1JDdDlqQnZtUmt2d2UyZnNVUlkxVHpOcjErVnFERUJ0Q05a?=
 =?utf-8?B?dTRqRUE3emcrN29sQVd1Skp4NUtLeWdzWS9SOXFIUGFsQlFSUkV1WHZVS1F5?=
 =?utf-8?B?T09YWktORFBLYm1VTndQQjhseEpxaEozYnRhMTk5d0hBTm1PVmNDcWxQSU1j?=
 =?utf-8?B?MjJ1V2tweXdObWl5VUhBbkcrY3IveWxpVXJrc0sxRWVQNWRxZ2xXcnNWQ3RW?=
 =?utf-8?B?emVCL2NDSmpRYXM4cVBwREx6aUpUWmJ1MENibDhSOU5kL2srNVV0VTA5OHFQ?=
 =?utf-8?B?R2Y3L3VrSXovV25HcWw1UnZ3YmdCbFVQYVAxbWwzS3JzTHJoSXJ5ejV2NENG?=
 =?utf-8?B?L3RtcHMrN1JlR1RvTUVrZk5rMVZLNURyZGJmU3ZKNnJwMjlKQTNVbGtLV0g0?=
 =?utf-8?B?K3p3MlBDS3pBKys0SkFUWGFvMy81QzlRVStoYU1xTkJXanVnYTI1THFraXQ5?=
 =?utf-8?B?alo1MTRzL1JudDFYeUFRelZSSUp4M1lja285Q3lJUG5Nd2RvckZQd2MvQlhX?=
 =?utf-8?B?ZW5WczM2TEV2QjRJK2lUS0Z6MEp5T25vRWJTS0NkSjhOWmtrRXhjTERPUEF3?=
 =?utf-8?B?OFZIb3o5QUtEaG1SeHl0QUgwN29wQXZwSzJTZmRQYnBsSStEdElFbWZJTVFF?=
 =?utf-8?B?djhWd3Y5dVRJSjg1Sk1IaVRoRzNFN0JKOUhCbXYyV3E0eWw4Y2l1M1NsaERw?=
 =?utf-8?B?bThKa0kxRWtRUUI2aWRCbVVwRVFVc1pyWmpCZDVWNzZyZHQxdG1GRlg2SElI?=
 =?utf-8?B?b2h0QzQ4UjgxSUhXdDhrUkxvcWhBMExyamd3Y1VKbHk3cXFWTlNOcXI1anB0?=
 =?utf-8?B?Y1BNcUtxV0xRZTY5VEJCKzdNcWRJUTVuZFcvL2VCYzQrUWx2NGpacThHZ25Q?=
 =?utf-8?B?YjRhNm5pZ0tVUGc2V1FZMjNWc2MrT3ArcFgwTk9XdWVnQWx2RDcreXpzaTNi?=
 =?utf-8?B?Vk9kdEJsd1QwbXVaZ1lrbm5WUE41SlR1bzdEMFN6cWg3UzMvWjMvcUMwaVR2?=
 =?utf-8?B?YkJ4U2xwUHlnTVNKbjlUZmtZNEhzWC90K0hzdnQ1VlZ3azFUMS8vSHF1cWZ3?=
 =?utf-8?B?aXdkVngzclBMRXpVdHV3MDlCbkk2MVc0YTRxZ0xFKy81TW9Nb1BIMFZwUXhO?=
 =?utf-8?B?dnB6VXFkb2hJeG9Bc3JvS3dVTHlNSDk2ajRCdUpTaEwvQW9wcWJKNW9iZE9H?=
 =?utf-8?B?a0ovNURYeXpBWnZ3WFdtZ3hJUkNwK3ZoMDkwazZjb3BJMGJFeHRlYm9kNXda?=
 =?utf-8?Q?rvC83vwc584D1RTi1iekngnCa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f839e1-b97c-4331-b45b-08da9249ade7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 09:57:17.5976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gQ6j60PBh2eZDnJ4hhPCM8c+mBvWJ0aJsKUDgEktawqmq95YdOpB881hiQuelYJOs4TusVWPlZB+kErSCz11ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2607

On 09.09.2022 11:28, Henry Wang wrote:
> 
> 
> Kind regards,
> Henry

Hmm, did you mean to actually add some text in your message?

Jan

