Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5226A469A
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 17:01:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502784.774776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfvW-0002v7-2f; Mon, 27 Feb 2023 16:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502784.774776; Mon, 27 Feb 2023 16:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfvV-0002s9-V6; Mon, 27 Feb 2023 16:00:33 +0000
Received: by outflank-mailman (input) for mailman id 502784;
 Mon, 27 Feb 2023 16:00:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWfvU-0002rP-JV
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 16:00:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc863254-b6b7-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 17:00:31 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8384.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 16:00:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 16:00:30 +0000
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
X-Inumbo-ID: dc863254-b6b7-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TD8AyEayYP/RevqFmyOkFBe+GB/+zG94o9TTiotgr56t6a2h6CQ92sfxnPJaONcZJ9tDAPHySXOoOYDAeLstdKohadaFkOMsdblLxSp7xR2uXOQrgZbrzs4VU/mg7qpUCuPfp4o43D0ZOU4iZUFDeuZLnKOEnQlZgABEU9se9PNuxYXxpXx9sZW/PTos17VI8N800NEhGUSkeun0/ryDuKtzcnZylU7JwJmVnGiF72EVhZfORXP3uX7o7A0syTBLAu2wFVuSvHpGXZl9Fl/1W7BUuxLHnYGPew8WgQB7ZmqCRnHLu+NhELAKiH6zaYYXDC60dOGeZx3ph6scqgqpQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E23m5Vmg+4oyUe+vKWdNsLUd01dKxYwmE6iWbQ5p+rA=;
 b=XX49h2YlkDL5p/VNr6Pte3Fq1nEUjE0zrw2fExmws/6+QVHJxOqA742lE83LZ8P/DzAOQOW1+CYHsT1LC/CvstLBSOHRn029PfeCMnNGhvT5sIV2VWQmcyq98x7QgSGSKfDJB0X3P4J4vvbtvui8Dljm1Y4+fIWkzRJrwP+TJOvjWNon1UYkoIAWCYWjUYLXqTVvekvF5oFMDLdj5T+l6d7e5uDSLqwJTBtjIN0GJy4KaZkaGPxZp4Oyl8V02A+lOqxuY9VK2jRIb2Vol8bab0Sjvfz5ptmEZxO9LYjBRR0yQ563ocf/fvbu1TxtQSU1l4MJZPhkoKgHgivyYNbD5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E23m5Vmg+4oyUe+vKWdNsLUd01dKxYwmE6iWbQ5p+rA=;
 b=SsEIcaO2FYvoTiVmspl2+9JJFCMSlrKaAmUzc6MDRO362NGwcqnpqveS/01QO1odTV9gSUW7AAG5JB+GIGWbhN7pn1pqZmM0o9qKwUOpal+gr7xlUx+OxJPm/kru4A5khluR4ksdEJ48rhoj1wCEzVxxfxL+mxDEddWhqXZz8oKU0xL4ht2q4Zk6Pau0L+3Gm2SOaIGRDujvTqAh9LCgrRxCsvM4fZ/lTUBluI4nnjp1viXcyZ5KmxZi18qkgNRO5s8xL3I6qUCYoYyY0gCDU5w4vRIKQ+2mwDmRrpid2uf8K+kb+8SwktZdTxyI0zrnmfNTphFaYSSxZRpqAyjJaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <770b5faa-dec6-f531-7bbb-ec125366f6ca@suse.com>
Date: Mon, 27 Feb 2023 17:00:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] build: add crypto/ to SUBDIRS
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230227095315.6483-1-michal.orzel@amd.com>
 <c16cbd72-9a5d-cea7-dd17-c9521328fffa@suse.com>
 <113d8d74-19a6-85da-8b89-1a21bf95960e@amd.com>
 <bbf3edac-d992-28b0-91b2-ca97159fbce2@suse.com>
 <c38e0913-e588-712f-6e0f-698f9dbf51ba@amd.com>
 <8bb1d032-639b-d6f4-28f7-2f5e5fbcbf4e@suse.com>
 <bb354282-3236-c7d0-edc2-c7d18d2afde2@amd.com>
 <23af7286-fc1a-d495-d5af-a137dbc66898@suse.com>
In-Reply-To: <23af7286-fc1a-d495-d5af-a137dbc66898@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8384:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aa4543a-bfc4-4b54-9de9-08db18dbc000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D+t3bqGkLNmk+gqGUTWGiOxEDYpcMTPyy4mcGFSPqQsqiMMVCUb8kjL+ZLCFAaZtl+WlyiNt2CipwY1HVYvZyCCTGnN6komcBI7EErkjFxNtOOrkbnBu4+0AzVRV/BG45DsGx0iAiu5a/EDhksx5xi5PomU5HwuiDPip4JFVhKjzJCIKhYam+ReUkAPk2gc7WdhLHp8hZtZIXBefifhfc6i8oL1JKOZr4uHBPexw89/PKlCOd+4lN3+oOB4Y34VmEngwv5kntWBAJByNy9Q3rt01cHg9MoJKvkFQQCTafVZuFh6qJetEqqae7bjGNSFnqXu02t7op1hzzPY3+BvLlnXT6tHdxzJXHYXpu5UnkQZcJVo9g/JrO6k2hgFVM6BagpaUD8I/1nv67nCAKbZK5TRmRoTP8aeby2yxQidQgJhggwfBBBnmRhFlbrlgl7f/WCKvjiQsX488ewywMw0Z/VXFMgw8WXD/ZiqkwsORHS5NtsA+HGzf30RlHz0dO8FT7erO/9WbbMXr2cPNjsDpixkeK3xWaGw7JAzyrpE720Vswhzw4wwIXkGJj6a5Bgctc0pGPPfD6nJpPm0wMv+7u3bg4gVM1YnvyASuJm0slrFVyEICWTMTTcABToEQT8OPom03NKCFkgtCoNxu6K2/FCCvD9PE4altbNpH2E5f3fK0rOS+/ZMgA28g/ZiAFKgQ+OrMQ7fXOHdKLmS7+lN/WDibIWG2CbW1KPbzVjgL7R0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199018)(2906002)(31686004)(8936002)(5660300002)(36756003)(4744005)(66476007)(6916009)(66946007)(54906003)(316002)(86362001)(41300700001)(6486002)(31696002)(4326008)(8676002)(66556008)(478600001)(6512007)(38100700002)(6506007)(53546011)(26005)(186003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXhENUZzQUQzYVN5bDZUZTZVbmdwdEFDM0V6V1NnMWd4dnZSMEZKTm9HbGU1?=
 =?utf-8?B?cVplUE1GalU2RTR2MnlrMk44aUV0YkJiTHBhUHBjSDZuMlVHMVVHOG9WRUJh?=
 =?utf-8?B?N1pESDlsNW10OGlqSnY4RjJuMlRMR0srbTBZWjlCVG9CdDd6S1hPR2tqMnpP?=
 =?utf-8?B?VERwN2g4bEpIaU5rZ2p0RjR6SktNaVhaQmE5dTlyUjk3WFhJU1dhZEJTMU9q?=
 =?utf-8?B?SzJMM0k0alZrSXdkUm92SVBCcFE1ZFkzMnJSZEZ0ZzlUZEVZL2NvdDFNL3Yx?=
 =?utf-8?B?bHAxMGRCUEpidGFFODdjeVlxZzRoTTFNVmQrRjFNRnNoeGdXbnZkYmZMdDNm?=
 =?utf-8?B?TFc3NGNRZXNjb3lvMmFDNndzZk0xYUNiZ2I4RVhnSEpFWDVtb1lrQTZWOUlr?=
 =?utf-8?B?WlVsaTJNekNwL29rUzZZS1NCSzVPU0QybVFEZ3I5M0g3YWpKTE5nVGxhck85?=
 =?utf-8?B?c3BhdTNQaHZKa0M3Ry8zKzE4cGV0SXFiUU5TWk9obHI3UkVJT1FrdnMyTmhU?=
 =?utf-8?B?Rm84eTUxR3I4OHJyNkNEc3dwQUdyeUZmemROTm1GV0tCVnZKcXJUcUczeEo0?=
 =?utf-8?B?dkZjVGJhQ2c0RDJhOE9rSFJxTmVlbmRPSlM1WTgrMGs5QlJzOEltZUM3a1NS?=
 =?utf-8?B?dU9NU0ZMTklQenJ0cW9QRWxBNTFnRm1WbHlUL2VIZ001aWNYZmh2cnN3RHpG?=
 =?utf-8?B?MFJGRHplWlhhUjU0NWg2NG8wSHY1U1FQMXhnUUg5cm84TVJlbHVkekljdU5N?=
 =?utf-8?B?NlJ2blJ0SmtKMU91TVlKTnhLcWFmY2M1RjF4dzFPeitFK1ZFTjhhODZFSUxu?=
 =?utf-8?B?cEsxM3hvUUZzaVg5U09lRTVGTU1GWC9QaG8yZzN5aC9jaFl3STR6V2M4d2Rr?=
 =?utf-8?B?TnFzL25vRWNFYkZSelhmcDhDLzFBYUtBSWdtajFQWldMRjlXbEg2K0RNcVlh?=
 =?utf-8?B?VFkwU0JZK2ErYkZ2eGN6dVE1RHAzdlBlMlM1UDlDRGtrR2s5U3J2QllVQVor?=
 =?utf-8?B?MTIybkVZbUs5dVY4RUg1K2k0OUxMQTdFSUVtTWJTZWJyTmYzVTdvdS9aWDBN?=
 =?utf-8?B?ZkdoMWJTVWI2M0ZTNjJ0eEJxSHJ6SGRKMC90dElrSGhrYVk5ZjFONktTUVRm?=
 =?utf-8?B?MTdENGoyN2RjTUtYeVh3enp2dkoxenprKzRGejlDenZTTkY4ZDNZbFZjTS9R?=
 =?utf-8?B?eGVJQXQzT1cyd1d0MFdiZk13OEQ1cXpDRE4wNlF5M3o1Q3d4MkZrcUdRSDgy?=
 =?utf-8?B?T0dBeDlSZnd1ZnIrTGt3c3dMZzhXc2FyRnpUTmRWc0MvR3BNMHNDZzBVeWRJ?=
 =?utf-8?B?cUFuVmxuR3A2S0VKQlFvN1FuK1ZzMlJCT0VIbG1rdW9VSVNEeVVEc3dNNWpi?=
 =?utf-8?B?RWc1MEhVRkFzTDU0OXk0UkVkWlBFV3JSRmNXcmRuQ2Nlb3NQNUJMTW5SdU01?=
 =?utf-8?B?RjI4TlBlQVRWa0l6V1BiNDlXVHVLeTJxeE1vR3dPbTRVT2lFRm1CY25xU0w0?=
 =?utf-8?B?OHJ4bkt2dUJwbHl5cENhL2M3RTQ5TGJEUXBMN3d3UnhPcG9oNWM5UWl5Y0x4?=
 =?utf-8?B?YWU0UHA5a3RHWXFneTdMQ1NKZ2RPK2E0dnBDZXNQRGF6MlUxYlFjU25SQXRy?=
 =?utf-8?B?blM0SHNyNE53MG9DUTBtTThnWlFjRC9WY1hYY3pMYjJMa0VFVU43Nkdsckg0?=
 =?utf-8?B?OFVrbUJEbEg5N2VtZngrZXBydnVRVEtCSXhtZ05zTVVQb2VwVTV0YXdWUUlr?=
 =?utf-8?B?U092aE1XdW5mZU8wZVdmMitKOXNWV29KRUppUG5yNkFHcGVYeENIUzZpa1Jv?=
 =?utf-8?B?Wmx3MVArZmFJTmxKYnJlQm9mdWkraFAyR1hwQmhabWVrODBKbDByZTF2b1lO?=
 =?utf-8?B?SDVLdGZCeXRDeUpkZlU0S1NRcTRQZ0djelZGMVhuOGhXWk9KOGQ4N01JVDFt?=
 =?utf-8?B?cXlGNlpnMTBPKzllRllqcGNiMzhHM2d5Z3ZBL084dUpMdEVGcC9kK3ZiSjNq?=
 =?utf-8?B?NEFzNjM4RHoyRUxEbzdVNW8rZkhEeEllSE1VQ2dOd081SU1UbnZ2RDFyaU5a?=
 =?utf-8?B?ZXdoc0t2UW9kRjJkZk9NQW9GdEhjbEZwd1U3dmdFTnpPN21tL2JuWUd2aGZa?=
 =?utf-8?Q?632ABewbiTmHUAbIK3z7ZtY/i?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aa4543a-bfc4-4b54-9de9-08db18dbc000
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 16:00:30.2789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mho7R2zZUwpzo9p8MdEnS2SZME9fQogUq4LKuS4vsZeUAekMg2gqm6YVaIUPUV+ncgqksl5pP9igJ31aFO2ZpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8384

On 27.02.2023 16:57, Jan Beulich wrote:
> Well, I'm not outright opposed. But I definitely want to hear another
> maintainer's view before deciding.

Oh, and I should have added: If to be taken, the description would need
extending to explain why the simple route is taken here, and why it is
deemed okay to consider crypto for as little or as much as is, in the
eventual final version, going to be covered in the final version (i.e.
in the version as submitted it would want clarifying why it is okay to
include for Arm despite being unused there).

Jan

