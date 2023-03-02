Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4C76A81E7
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 13:07:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504876.777303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXhi3-0003hC-Cs; Thu, 02 Mar 2023 12:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504876.777303; Thu, 02 Mar 2023 12:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXhi3-0003fU-8a; Thu, 02 Mar 2023 12:06:55 +0000
Received: by outflank-mailman (input) for mailman id 504876;
 Thu, 02 Mar 2023 12:06:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qSkR=62=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pXhi1-0003fO-K2
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 12:06:53 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7e04507-b8f2-11ed-96ad-2f268f93b82a;
 Thu, 02 Mar 2023 13:06:52 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8843.eurprd04.prod.outlook.com (2603:10a6:20b:40a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Thu, 2 Mar
 2023 12:06:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6156.019; Thu, 2 Mar 2023
 12:06:50 +0000
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
X-Inumbo-ID: b7e04507-b8f2-11ed-96ad-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgYKAZXJX4FJZ0sS3qwva0C8BARuWviUzp22OGQqFkfm1sYUC7WmQTuJOWrGMIekgbymPHjvz3+SenFZDl7xouowla/FKDNdsbcXEZEwyFianP6/vwYXahvtLL8MlPCMQI9dcS2YlmZOar2uTDbgkeYjEm06rIwSZWab1G2DgcMLQz3eeWPx17GmyjAfyUzC2A6IuZxfl5O1Ezf2kjBsKTyRJefzrOXqObPtDry2v38zCkeq15IvygPNrfMlVSK4oVyvAVtIGmu1njnIMeInthVEbn4IZNIxd/6vyHr0BtGOcwV5tRsMl7jg3GJG2iJqLTuzPLIPF5HGPbH2H5FLNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZMZMLXesqsPROcVtwa0a3bbNLvjOhi5q6DookAxN+/4=;
 b=EZ34QJccMIbL1BCOQcNcb7K1Jxv1U5NmkU/A8blpTI/ofIRl3ppfyZzZ286bkrfW7EqsU1fRxAkUXvV45qclz/ayn7a/mwLeO7V89YYkTBukYNwHVjHUjfbBVC9iqPvdmS0dmF7+4KlzA6p0OkVxEBBEiL+Bns14F23GuYBwLV7SPy0iZdPr1Hrjp98smE8SiZk4Uz7XE3Rm51DWHuAgc2/mDSBS+3qGttpYes61gLdbfxGXkdPb1dpEQQoXfreNAhZSH3oa5I/g8y+95fT7COY62l2sqlB8y1T/RfdkvpCd2IK7q/ILBZq8Ok0liFBcdH8oKj2MGpE+7yF5F0K6Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMZMLXesqsPROcVtwa0a3bbNLvjOhi5q6DookAxN+/4=;
 b=pjXnCOzoIZXzJMdR7tU5klL8yU9uipEyqMA3KpMldStleUmS6h+KOK/jFtcl1laL7/cFTJdD1TfLHwd6/kf6tKhcpYJZX1ENHHPDcxSb9avJ2W23qrUZOn/3wjPnU2abQ6umSvS1DNPOg0Hoxqe/Rbwazhce2KEr+n4mo4C98srWIH6JmEnzxmdOSUfu9OUwAFtyvHLIMCh8PNxwn3U+WnDwEJrxwlWhud86RPGM1LptO2S+GwWXeffqPqUW5lWDnUPT3dZbH2Qy8eVsZNEkwQXDEImlvbeR5mEUJV3bjszp1yet+rECmCAA1vA1QSYzSSgcU4dbbGser4uqyGNGSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4a33482a-fd89-c8e9-ad5f-1e72dd644d2b@suse.com>
Date: Thu, 2 Mar 2023 13:06:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM: purge dubious lastpage diagnostic
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8843:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d6f4480-9144-4f06-fbbc-08db1b169aa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GshVenhGerKceX/tMB8n1uDO6GZ0QIAJx69lumUwdNltZiInwdtHkjkYatTsKnVbFFLtkUPc5AJ4U2NEQtM+/Hnezww/n6pJCqn/89KeEvJ/Ygk7UHOpMRDWzivGistOAk81oQwlQFIAfFo9R2GBhpla38kKqUfkYdTQTQnqjZX8gpPEniknQso4FbrqihjXPZtfj4qHHQ3ZjRp67gDD2tDEOIgPhDnSL7/NKGDVgV++4M63ZODTG/ECzYVOzxjkUcPRx4Ok+OdQ4UKjW0YCl00DmZWFSRkB4NAC1hQZwoDIswa8Or5dTg2djxRD7abf0BjVwwbKgpqAsNORggxkazK+hBPzmSH3ncnm/ePZU/2yz42Nctb9ryglHW2PyEW1Own11+jBcrwkRShLcdgn3Q/KnEBOS1fHHPVx6Lk8aGtTXuv6/RiwGrctV2gJbMzD/7AvfwZ3tkHtELipJc1YPVUjFFumeOzkZ5BY7IuVcEKDuijMltZ2F8hzOTPWxLz+lrtLT2AUOfd+VPVsP7PVdcM4mrePgyLx1mekyShUj661jFy8+0C5uVILEn5tOFLz90B0vhNKFhEdmuCa6f4tucsGQmyZJdw9yuOUCUb5LjdBTCQ6eL5Bw2nMyFtQ8LDvTX82kK/chK2Y7yzRX9kuMNmNUaPKxPsIdPPZgQycfYvkwlAEYLQr/X7TlCTs9CFFeeChleNQIdKGpCWWTVKM071BYaaKQTgCk+2VeURzmB8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199018)(86362001)(26005)(6512007)(186003)(478600001)(6506007)(31696002)(6486002)(2616005)(316002)(54906003)(38100700002)(2906002)(36756003)(83380400001)(41300700001)(5660300002)(31686004)(8936002)(66946007)(66556008)(66476007)(4326008)(6916009)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YW1FYTYyaEZLR214YnFXNEFQdE1ZYURrZmtQL2JTRHpiOGs2UkV0bk9MMXN2?=
 =?utf-8?B?TWpsQW5NNk9qRFpnU2FIdW9uU0VDSGErOXpMTENUazBUSVpjZWdWU2JCTHZk?=
 =?utf-8?B?UWNUakFEMlVsL1hUdFlGUDRZNmoyV3RqRTJsanV1OEZ5ZWFIWXZsVjg4NU5K?=
 =?utf-8?B?YjIzaVpHcGF4Rlhaa0FEZnlBKzd2NnFBZ1NhcEVqbzlRNnJiUkROTFBFdlNs?=
 =?utf-8?B?NVkzRWJlbEVTbVR6TityaUZ3VDVMM2l5MUdNTmczeFJzVGdNeVlLV2pCd3pT?=
 =?utf-8?B?TUNrcStYOFAydnNQOXlWaFZTRXoyUGVjZWEzMmJFaERUeWwvOGNsV01TWjdN?=
 =?utf-8?B?eVVaOXh0Q2NnMXNtZE1QSkxDaTY1cHc3dTEwSkVvNUZJL2U4Q0dMNmI2MVU5?=
 =?utf-8?B?bmlRWkU5Qmk3anpBdzFmZWlMU3h0QjhMUFcrZC8rUERocWlzUjY1dkc2akM5?=
 =?utf-8?B?RG5kakFacWYwbWdJQnRxNXVvbUNhbU9CbzlqQXFWNWZRdllXMDRZeXkwUlV0?=
 =?utf-8?B?WHAyemh2dkFCQm5lOHVHbjRzb29sakVWdDNWbXR3MnVrN241SmRZa0IzVUp3?=
 =?utf-8?B?NTg4SGxTUEk0NUtrbDVydnJaQ0pIc3QrOGIxTmozcWZGaDV2YmdKMDdJTmV3?=
 =?utf-8?B?eGUveEtzMFRLV0NZemhnS0w5dlczWkRxSDF3bXdXNnJoT0tnN005Rnc4eFVB?=
 =?utf-8?B?ZDNwcnRNNHUwYWZ4Y25tUEkrSThnbEJJQmNDTC9sSGVOOFdBZkZIWUtZRnRE?=
 =?utf-8?B?ZkZ1VUZQU2lRSlBubUtwM2lBaTlHbVRlS3hOSkNwVHdmUUJLWFk3YVpBM2NC?=
 =?utf-8?B?ZmxZMlRGT2RmMCtXYVBONFNwelNkL2NZY2RVdEpDaE0venc0Q0cxWmVJTVpx?=
 =?utf-8?B?SFRpbjgya0RLaVVqd3Y3UDA5NVlLYitTMDJrQ2tCYjNxcjNMbjZPUmthWEpK?=
 =?utf-8?B?WnFiVWdhUmZnREJqVHNFYXBZWWh3OWlXRjhhQkJGeUVuUFJZbm95TTI5MGRt?=
 =?utf-8?B?OUpkNW1RSElZVE9EMU5xcVQwUFJUbzMzTnRQKzArN0E2M1FHRW8zQVRxNFV0?=
 =?utf-8?B?QlpBZGo0TnUrWXcrL3NoVXNjTEM1OVNmZWMzekIvNU5UWjdKRFNhdkRVcUpz?=
 =?utf-8?B?TU52djdyeHUzQjlPazFRcWQ0OGdsc29yMmt2MVlkeHg2d09qeFArV2t3RjF4?=
 =?utf-8?B?eThESkIyT0E5TFYwczlIaUYwc0R1MzNmeXo0VnlDSkNxMTEwTlN5Y1FDNERO?=
 =?utf-8?B?bzB5RXJ2dC9MRG5Lb1o5eTN4NUFmTWpGaXRWTExOTmNhaDJvS21uTkc2OWtW?=
 =?utf-8?B?dERlellzTzNHdE5ia0ZvVmFGQVg5VWw4ODdWWFIxYUM1VExYL1J6bU1iQnpq?=
 =?utf-8?B?OG00TjA3SW8weVhBaWRYWlV0bkp4RjZSVUFxL1R4R05ocXNYNlFIWFNyTzhC?=
 =?utf-8?B?aW95aUplZzhUTjVUN244QlIvL0piblQvMEEyTlk5VElSSk0yUkJnOE5nMHJp?=
 =?utf-8?B?eDhhTG0wOE55WGhwbWtVTjVoUFZDYkxLSDFrR002ejRDL0d3NEU3N29tV2p2?=
 =?utf-8?B?dFFFaTdwQjk3L0h6UjRlM09KY3l3WTRPNHl0cjF0ZnB2dkZtNGNaeWFuMWtn?=
 =?utf-8?B?TFoxM0JTc2NPYzJvSW5yaGx6dFBrWmFRNktDTHhMN2Rwb1dKYkJUSjRVVkUy?=
 =?utf-8?B?OUNENGV2QS91OXNRRGJPcVlQZHMrR2NFQVRENk5xQ2FTNVNoQXMxaXRzK242?=
 =?utf-8?B?aUhQeVBMa2ZVTHNwaWFMN1huUU1Pb1ZqU3Fubm5WaTJiNGZDajJHOW1PZTZR?=
 =?utf-8?B?cG0rbjJTNmFuZ01zRHJWVTJmN3Awc1lVVlpMOWorZzlZdkZrOFFKSVpNZHJC?=
 =?utf-8?B?LzVzQTRFRmtzV0Z0MU5MUHVob1k3NkE0WG8zYXdFeWdJUWRtVjJiOEpmL0dy?=
 =?utf-8?B?OExKZS90OTNRYWJwdC83Q0l2aUxDd0RJcW5GbVpHWDh5WlNsNmorVkY5bDRM?=
 =?utf-8?B?M0Z1aXhna1ZoOE9Bdy9KSmVhckVhVTMvdW9aYnQxR2Rwa1hJaWNFM0d2cHcr?=
 =?utf-8?B?aHIxM1dLQzBzcUU2ZEZYaTBmemROdWFzaGFBY3ptQWlIOUN4d25iWFRKNG4v?=
 =?utf-8?Q?oWKqk87B2VlZLhkjVMsauCu7N?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6f4480-9144-4f06-fbbc-08db1b169aa3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 12:06:50.1819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eCS4CP/iiTmVgjrjHq4K5yuYBxu68Lr5C5yqnaw2FCEqCcxptCemOgaiArZu8DQZqVmXPs0ZQEJw6xX1D6B6EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8843

Quoting b5d8b03db136 ("x86/shadow: Drop dubious lastpage diagnostic"):

"This is a global variable (actually 3, one per GUEST_PAGING_LEVEL), operated
 on using atomics only (with no regard to what else shares the same cacheline),
 which emits a diagnostic (in debug builds only) without changing any program
 behaviour.

 It is presumably left-over debugging, as it interlinks the behaviour of all
 vCPUs in chronological order.  Based on the read-only p2m types, this
 diagnostic can be tripped by entirely legitimate guest behaviour."

All the same applies here (it's only a single variable of course).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3354,16 +3354,7 @@ static enum hvm_translation_result __hvm
                 memcpy(buf, p, count);
                 hvmemul_write_cache(v, gfn_to_gaddr(gfn) | pgoff, buf, count);
             }
-            else if ( p2m_is_discard_write(p2mt) )
-            {
-                static unsigned long lastpage;
-
-                if ( xchg(&lastpage, gfn_x(gfn)) != gfn_x(gfn) )
-                    dprintk(XENLOG_G_DEBUG,
-                            "%pv attempted write to read-only gfn %#lx (mfn=%#"PRI_mfn")\n",
-                            v, gfn_x(gfn), mfn_x(page_to_mfn(page)));
-            }
-            else
+            else if ( !p2m_is_discard_write(p2mt) )
             {
                 if ( buf )
                     memcpy(p, buf, count);

