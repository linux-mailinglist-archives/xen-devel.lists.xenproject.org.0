Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8914CC346
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 17:52:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283598.482671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPoh0-0006mF-3X; Thu, 03 Mar 2022 16:52:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283598.482671; Thu, 03 Mar 2022 16:52:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPoh0-0006je-0Q; Thu, 03 Mar 2022 16:52:42 +0000
Received: by outflank-mailman (input) for mailman id 283598;
 Thu, 03 Mar 2022 16:52:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPogy-0006jB-A8
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 16:52:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55ac203b-9b12-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 17:52:39 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-sLipJf1UMlqP9gvV00RszQ-1; Thu, 03 Mar 2022 17:52:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8301.eurprd04.prod.outlook.com (2603:10a6:102:1c5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 16:52:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 16:52:35 +0000
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
X-Inumbo-ID: 55ac203b-9b12-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646326359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4OzSYrdp3fBqB1KoY5uzmlBQiqHpklP3VyB2FmZXpoU=;
	b=T3uSlpe9SA+vD1DH4nIWNILlz1oza7LbUHJp7AKTV/8qtq0oT3Lc9DOKUscZDKEbQ9uULt
	IfOqmV2mgDMZ9y1ciFce8aJFmKiQ6rkoTIwMTLkZA4dOcF4hDVReoBw03LfMQmpKvFnwDE
	XnX0RTqKA/QHhEwRo+ynisLGzlxKiyM=
X-MC-Unique: sLipJf1UMlqP9gvV00RszQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRtG01uG31vONhKzAYaQxpVNhJtH8xE37lpLE7zT7q1wjpB6Rszd5FiwAqSjBGU76vD+U2je/HzzEyc1GZ/ypdKxzkhhzG/0rRGiDEHoKRi4OaHBp00/6PDkaHgCVcv3iaak7V0sCjALPxCHCAe5svoZxlRXpNa/Iulz45ppHHlYqPdKg7E1JwBqXYsfeAemSr5Th+YXaYA92IpvNtilmq1fyX1pwHJMPLvOR1veEiJ6nHU/BbwpV4amfHBOrJ5nyYs8kNy8mAnlGeQWM/oDWYlIzlQ4hQ6kWclmSlKripVoVwZpXSkRNpUt/d2zAPtU7N2+tEPGepHNuD062FhapA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OzSYrdp3fBqB1KoY5uzmlBQiqHpklP3VyB2FmZXpoU=;
 b=DZ2yN69J7YnmuzkiIlbSyLaxgRevlu/1dW/Xva+X/9auOPAn7Ox0lLXKV3NfriNNYeXLmbVv2gt9mMxvy1ck9k0eUD+iXC9LvXM6cRfEIYZbZ468W6xkOhu9xUGxb30eDM2RPIU/SpKDdmz8ZWGLbzyny29Jff2VVEwObY/F59xfD3ADdhgkmRFZEJg+JLFPFA5wgAKl0kI8cdPJzI+So6vbtMFrRU1sqIBrL58Q6jCHjI6vQsq/OP3J3gpiT95ohQ3BTN6treW52TfBURp4204tnO1gGYO2ATb4gZQS9/ZczjZVGuaABYT79oZ64ePcSnPozQ2R+57xKBNnWGDDCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <33562be6-3ebc-1d97-10e3-f0066daa4a53@suse.com>
Date: Thu, 3 Mar 2022 17:52:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: correct a few scalar insn comments
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0044.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe8493bc-95ae-45d2-718f-08d9fd3637d7
X-MS-TrafficTypeDiagnostic: PAXPR04MB8301:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB8301F22BE70F96B8B02EAB45B3049@PAXPR04MB8301.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RaMUJ1XVy0v43+5d7li31DK+TMGF1Jaq0xV8UpCTkQqy/Xgy7l1dtmanqC34++0W9TFJLS94Sr91WFFq8ggZpLructg8iH2kW5DUCzVVVmBuT0UDxuKAR7iSweIXEoWETGX5BsvK1CapkBgfBktI0XMNXPWdxXx+CAHBBcbuOXsAo4PDe/IieXzLOR2uOJetGlKa7LqEEbyeSPADeQhP3vQ2V2CnlC/Z6cAcQcJG1O6/gcurWYXQk5Sa1FZc/+TIlTkRSRmwnpzB86T9sN9AU+PvNRB/LXJw8uHUas8fT/s4p9Q2PM0Q5Z6SRJR9Qbhj1KCgvyhcimE0UemvNgTqjaZazK623E+EmOiPY0Py6sBSXnxcFNxWhY0bR05u/vcaDOB8QGb6lmUDbj56KlqtikURgtDZBKfOybnQThx228D4nSNVvGVWDvBOzeb2FBhMP/T20NsBxZN2aW14SudpZfW4DJf6si3uXO5YGIENRXKkCPdNMMNccIHdeHJ02c8qb62FWzi00QIxUBEpsCRsitVUNmwbYG9B1PCo3lrmtl1Bp3lruvrBpQUf63Aq+PGv7X5QtO57tUtvZjP3nV2A9sVd+MUS/Z+DgHIm6+dgToA/9/FJhAPQvt+CUyoePJdwwxdbJgrS913Yh+6BRwvZQgjcj9Ruy46pimThCw7h+ToDk0mrSrZbPeKwfBqBf2gUDAEFe9BJttXi/fZkZghaDAdVyNvp4D5VYsSmwfNRSimVu/HgxbUgUscHBb5JNZ+y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(2906002)(2616005)(36756003)(316002)(8936002)(86362001)(5660300002)(54906003)(186003)(38100700002)(26005)(31696002)(66946007)(66476007)(508600001)(66556008)(4326008)(8676002)(6486002)(6506007)(6512007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y095ZFoyUU5zV0U1QmlQVm12K2ZnbjNYNEtsbDVyQTVQR3p4bHYrRWxlaDJC?=
 =?utf-8?B?QW5GaVlCdDBLOFJPcElYWDNRdXdMUUlseTZOdWNjQ1psRGpaWWFib1NiYVp0?=
 =?utf-8?B?S1V5aGo4ZTRISnJQampwRWtIcjRXWVc1QUV5Y01RR3dUQmYxUHA0MmIwSFdH?=
 =?utf-8?B?M2psMmRxOE9SN1VKVWhEY3B4b2l1cDlYQy8ySkNpdWVHVHNQVnp0dmZ1d2VP?=
 =?utf-8?B?TXZpNXdPNmd0SFhEMDlZM0pNN0ozdjhIVXhFZzMxbElONFMwNjRrWGJtQlp0?=
 =?utf-8?B?ZVp6a0dJTmlibWloL05KR3pkTEZLakJGRnBseS9tc2R4ckg1SjMwa3NnZXhv?=
 =?utf-8?B?dzZwdnpXUEZXSitXZnJQeFRtVFV6RHQyakxCTDdleEtvQjNqRkhYeUNzWi9M?=
 =?utf-8?B?WmNFNkpSTzVqUHZTSEMrWmFGeXIzbFVwTk84YVp5RGU4NTNNa3pGSXVNcmdV?=
 =?utf-8?B?dDFmVUp2UWl1d0NnMExRT0grVkd0dzJRNGRXai9mTTJrbXNabklFbDBXWGRB?=
 =?utf-8?B?UU5FTzhMWnM4NE11NUlwUjdHV29TaksvVWF5dDdHeTMySUh5VmlmV2V5Sktv?=
 =?utf-8?B?aUFlU2RSY3BJNWtXRGJuOGdnWU5wTkIrbFZwN1FNZGZlWC9OQ2J6Z1hYSmdk?=
 =?utf-8?B?QUZjNFJSR25VRDlkWlBidmhFbXZFRjZ3NXY4dVFiSXJQK1UwZGRjb0xEeHMr?=
 =?utf-8?B?Y0ZxU2VWbGlibnRXY2FpSDdncDBXajc4Tkpuby93SWhObTZ3K05hYkFSZzd6?=
 =?utf-8?B?V243Y2Rad0U1aGNyUkl5cndmS2c5SEZrL0xLQmVabk55UlhUNVdJQjRVS09K?=
 =?utf-8?B?K1ZWVHc5K0JxWW5IMHhTUFg1TGRsQ0JqbTh5RzZ2MFZIM1RrL2J3RWE5Z3dz?=
 =?utf-8?B?Uy9Kd2Jhenh4Zk16ZDZWMDJoTjZhOVdsdjROSWlncmZEN2NpRkl3a09tZXlE?=
 =?utf-8?B?R1E3dGloVXZMd3UweDZWOVg4c2k4bUdGaFRpS0hQNWh5WkFPa1NSaXRyVlRB?=
 =?utf-8?B?NXZvaVFKQzJqVW9NRml6dFM1SzZYdjdWRmhEazRwd3VRamo0K3JtazBKYWNB?=
 =?utf-8?B?RytQZURVL3FldVFGZ0NYc2FEUU5GVnlwV2F6YWxyekM3TUJ1YndqQXhFdnRD?=
 =?utf-8?B?OUJoWkhMdktpRmNEUUtFaSs5cjEvTXY0V1VpZ3hrc0FRbjFFbWErVTgzK016?=
 =?utf-8?B?V1Q4RG95UWxNU0ttRTBIK1YvMnZZWXcwcHVrTGJkelJTTGN2cXhKUVI2clpJ?=
 =?utf-8?B?VW5ma3ZWNUNGSFVZeDdpcWo2RjQzcFRSam1IM0djSDB2d09aY3MvdmdSaUVv?=
 =?utf-8?B?T203b01mLzBpTUR5dUhVV0ZkYkhydlJCRm1WRW9HTURMZmJiaHBoYWhHZW1M?=
 =?utf-8?B?b3hBWkwrdWU3OTVnT1dWKzlITmtWTGtSSkdOeW5sWjZTYjM0QVVxRitHNllG?=
 =?utf-8?B?NTJ3QVg5NXMvVVJTY1M4emRubmpWM0xGWHJaU2pDNHFwMUNyaVFpOS9qTy9W?=
 =?utf-8?B?MHpTSkVMNWVRdm9JUmFObVlrcnhMWWhZa3dnYTV1K3NyYkE5OHVMdXlsSnFF?=
 =?utf-8?B?Q0YwdnllU0l2Nit2dFhzYnVRSUpoUWhZMkRJY3gyd3RQcjQxQ1MvUGtqNzdK?=
 =?utf-8?B?ekJkN0ZKbCtJS0lud1NNWUE0RTFVYXRKUTg0aUJWSm1ETTFsb1VCeDhiQU5N?=
 =?utf-8?B?bjJlRDdMampSTnV1UDQ3bHJZS0ZHK3lFZW4zaDd4eFhZNDc3cWt3Vm15ZEdk?=
 =?utf-8?B?VXJLenl6WktiMVh6SVlob2Z4aExmb3pkTU9la3U5Z0cwWjNQNTJwdHloSmwv?=
 =?utf-8?B?emRrMmhjY0JvYS85c0F1VCtmVVd0dnhCcmEyMWVHZXBaMGcyVmNNL3NRcFFG?=
 =?utf-8?B?OGRaTVFqZ0dnbjdRVSs5dmkrdUpRbXFnbGdOQkhvcGRDMk1nVzF4a1hyT3Ay?=
 =?utf-8?B?RGNXUFNta1FxSXp2KzdQVEZGaFl5MHdvR3VIWHpjaU5UNG9hZ3A5UVRvQ29Y?=
 =?utf-8?B?WjJwSndFWVI0eWRmYlNJeUZTNFAvQ093VUtRNlBFUlB6ZngreGxuSWVxZjE5?=
 =?utf-8?B?VEVWQnNjSHh0T0NBS1I4Ulc2Z3d2RjVPSTY4NGpENngzc09EWWVUd1ZiMUxp?=
 =?utf-8?B?MGJocCs4TGlzNlU2TE93ZEVUdjlHanAxbmlROE1oNGVPblZlZjlrVzk5a3Nk?=
 =?utf-8?Q?+aHHYtlkh8hA1M8/KNxxPpQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8493bc-95ae-45d2-718f-08d9fd3637d7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 16:52:35.7813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xiyDKxFajNdakwJfvdpob72ULV6cSE/7oqUOv/rp6DQRpbAD7FV8cenK3cC/Ap78wdEJUQZHqLxIK19aEvT82w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8301

Truly scalar insns (i.e. not VBROADCASTS{S,D}) only every act on
%xmm<N>. Adjust comments accordingly.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7608,8 +7608,8 @@ x86_emulate(
 #ifndef X86EMUL_NO_SIMD
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x08): /* vroundps $imm8,{x,y}mm/mem,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x09): /* vroundpd $imm8,{x,y}mm/mem,{x,y}mm */
-    case X86EMUL_OPC_VEX_66(0x0f3a, 0x0a): /* vroundss $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
-    case X86EMUL_OPC_VEX_66(0x0f3a, 0x0b): /* vroundsd $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
+    case X86EMUL_OPC_VEX_66(0x0f3a, 0x0a): /* vroundss $imm8,xmm/mem,xmm,xmm */
+    case X86EMUL_OPC_VEX_66(0x0f3a, 0x0b): /* vroundsd $imm8,xmm/mem,xmm,xmm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x0c): /* vblendps $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x0d): /* vblendpd $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x40): /* vdpps $imm8,{x,y}mm/mem,{x,y}mm,{x,y}mm */
@@ -10576,8 +10576,8 @@ x86_emulate(
         host_and_vcpu_must_have(sse4_1);
         goto simd_0f3a_common;
 
-    case X86EMUL_OPC_EVEX_66(0x0f3a, 0x0a): /* vrndscaless $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
-    case X86EMUL_OPC_EVEX_66(0x0f3a, 0x0b): /* vrndscalesd $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(0x0f3a, 0x0a): /* vrndscaless $imm8,xmm/mem,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX_66(0x0f3a, 0x0b): /* vrndscalesd $imm8,xmm/mem,xmm,xmm{k} */
         generate_exception_if(ea.type != OP_REG && evex.brs, EXC_UD);
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x08): /* vrndscaleps $imm8,[xyz]mm/mem,[xyz]mm{k} */
@@ -11063,7 +11063,7 @@ x86_emulate(
         break;
 
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x66): /* vfpclassp{s,d} $imm8,[xyz]mm/mem,k{k} */
-    case X86EMUL_OPC_EVEX_66(0x0f3a, 0x67): /* vfpclasss{s,d} $imm8,[xyz]mm/mem,k{k} */
+    case X86EMUL_OPC_EVEX_66(0x0f3a, 0x67): /* vfpclasss{s,d} $imm8,xmm/mem,k{k} */
         host_and_vcpu_must_have(avx512dq);
         generate_exception_if(!evex.r || !evex.R || evex.z, EXC_UD);
         if ( !(b & 1) )


