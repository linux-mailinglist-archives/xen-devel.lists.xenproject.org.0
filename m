Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B97A4CCF41
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 08:50:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283995.483118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ2h9-0003Zo-1g; Fri, 04 Mar 2022 07:49:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283995.483118; Fri, 04 Mar 2022 07:49:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ2h8-0003XX-Tg; Fri, 04 Mar 2022 07:49:46 +0000
Received: by outflank-mailman (input) for mailman id 283995;
 Fri, 04 Mar 2022 07:49:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LpR9=TP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nQ2h7-0003XR-Co
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 07:49:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7c787b5-9b8f-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 08:49:44 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2052.outbound.protection.outlook.com [104.47.8.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-2YBc3VmMOt2715J0Ij5VWA-1; Fri, 04 Mar 2022 08:49:42 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB6PR0402MB2757.eurprd04.prod.outlook.com (2603:10a6:4:94::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 07:49:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.017; Fri, 4 Mar 2022
 07:49:40 +0000
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
X-Inumbo-ID: a7c787b5-9b8f-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646380183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/O8NOBCkJHew4SJp04VnA85nUKzZ6JUynilejL0ZA9A=;
	b=XurWj9UgkYHdyCYRvfAWc9JrGrS4+v2ce6ywWdWgyBvD5geXxZsbuHPF//WBT2SX6OvawN
	ZPusg/kyuNQb03AMMzdYyzlbhtjqQ2/7swPvlAtGkSUTZOKU+Q0DyqZI3YdZIheusNCvus
	5p1Tt4fGWL97U1bFFOtid2aBG9xvo/s=
X-MC-Unique: 2YBc3VmMOt2715J0Ij5VWA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KugFAC3AwLdPnEccBvBKsb4d//57mNq0Img9gt8LrLGLSTZrCh3hU7bkCLtYyt3MwBTVFUTVpRUmSBjx05FOzRLbEkz2J+eTEAxjwMReMlZoywnFvPucyD39qzTj8OmOmZh8XDVPZxioxuC4720ztmMttou06qQSI2dgSHsbfRCn6lWwmlykTeLcziPa6zBMMbaExLWXjAzwghVj2LXIC5zcPbIDLIwqPQC6RCcnUNBKsFNbk87To9hE5whmysz3fnTkNG3MZSgIGJyAPuGAX/dTzaFbptGZ6KLfA1KWnSiRx5Sx6MtqMlPkZRPEaHEiurranJbh1BwaXJsczqVAuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/O8NOBCkJHew4SJp04VnA85nUKzZ6JUynilejL0ZA9A=;
 b=Ckn1znu9dlrsVWga27fejWJXEbjrd3FjIcwsPwArkP6/bf7jBB6LsaXFYrAfy8QM9HBGsK27FC42wpeRSYJyyYeUogjaehrkGm5qfWVKygUlFNXhQWJ3JPwsJuFyz9ZZ9tGr+mszIloYMDPR/mdhe+Y/qO3AToqxjN0KonXWHjFR0buYGQF46fgzbgDEVvMsogFxnnShrKxmOrdxu2HQouIRLhc5Pm4BtuvH2bdQ4W9KE70tLnjU2gb98WLwUfrKu5pIUUn+/umKEEe73JATsWzK9zagSs/P3LzxExw+S8HRiSc4i716eTPVqvMDCJhgWj+Js6ECKWVGQ4Li5CGbEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2a9061de-3d68-20f7-75b9-b1b9491342f8@suse.com>
Date: Fri, 4 Mar 2022 08:49:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: also discard .fini_array in linker script
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: def1f291-5c06-4dcc-6f1c-08d9fdb38a04
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2757:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0402MB275721F5219A0DFC60EF3E0CB3059@DB6PR0402MB2757.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XM7APSdUAJmQ/EREdJGKmT204eSfIoJfRv2ZSl4LHU52G5387zz5A3yZ0YB9g8XwYZhMc2dCrsGyiV2HJoNqYbmEkmHUDDImrtgGaPa+XsW/qiMXaqbFwoud6ScdyNfQ18os5VAQMaj8DlAT7Ce+mCN+k+L3jDefYzTmR5TQ5FUVwWuSSInyzowmySSm4c1haR/9PCwo1zsTg2Lybp0zPFsKqkwYxMkzhqmi5n5BFPdeVTUqLwQBgyup7rHPuHVWbNKZGMAWyJcHaAi+UDiFmbN09rYY1i76RUuf++utTJTCBm+Zts9Q02ydb1ScY79LKM+HJZZgdzlwuUjYt/sDsQV31b+P9Xy0NdTYKMag1dmnAj1c1JRns4uVhqohPvecFmyRDAsrIVtLQb1K/QjdLyNLAmsdCfSQR23xBf3OyBtTHXv/Xdrm6cYZ8hw/T/h4Nx4EzO12RUjrUs6Wv6tRzvjDDxjpGS5+1lv3k69UVrz1iHh3Q8oTPcv4M0jaKxM5v8MaJZ/8isLkDYTIEXyzgxATYLaPo2Bp2Q7Y6Js9brKZN8JmnBtUzuRVHOZD8BGn6cbEpTp7nmVBNSAl1KlmjS1zsQkrhl+sq2d2WshjApfWAhnQsDjFVht9ajT3QTL4KZTo4mPfY5ftJHGqcMoPjl/mExcWCFUfCoWFGm5G4omBuYl6Y3ask5I4t371cnFti6HiwId5OHcACwiWsHr1imamkjqfefi4SMzhka8N1HltzKQizPX3B/G0egvFvjsYfIcOu7inq0BZ6Qy8xKG3Og==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(6916009)(86362001)(316002)(6506007)(6486002)(31696002)(6512007)(508600001)(2616005)(8936002)(4744005)(5660300002)(2906002)(66476007)(66556008)(66946007)(26005)(38100700002)(186003)(31686004)(36756003)(8676002)(4326008)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFBEVzU2a2o1WU00ZjhiZjRTUUljMTNiQ0pkSHp6aWVrT3B2Vm14OG9BT2oz?=
 =?utf-8?B?Z283ZjNjVFFWa3dIZ1pJdEdTejhtRy9vN1NhMFNNWEZ4ZDdHcVRiU2Q1Wi9V?=
 =?utf-8?B?cnJvczlISWlRSjhiYmt4QTlMSmI2Q0M1dDBxWU5WMUZvUHUwYkFIWXdiVG82?=
 =?utf-8?B?V1BWWHVuM29Edlg1ZzN4V2RHWDc0em5WUktRUXBpY2ZISnFvVFhNSGFBVjQ1?=
 =?utf-8?B?aUpQVklJVmxyYkJ1TEVleVlYUytYeVFqNVhrdlI2TzlBUHpOTlJPVUZDRGRJ?=
 =?utf-8?B?RlZITmh2ekVzczJ2RVltTExaVys4Uy9ia2hYL20ydkt4S1o3RGJFNTJTY1hR?=
 =?utf-8?B?MDdrNHlDN3BzMVhoQVVGajBOTHA1UTZBck8yNVJQM0laWFAycGhTRnhLWmFP?=
 =?utf-8?B?TFhqVTY5am1rL2Qrc1Mxa2tua09nb3dycC9HZXJzQ2lMcjZzS1p0b3ZleGdN?=
 =?utf-8?B?VjZWTllXWEhyRHJnNVVpaGFvSXJGYUNuUTA3RTB4dlR0ckJDWmFzWCt0R054?=
 =?utf-8?B?YVdtNHdNeWNBbTdLTlZETWd3enJVSUVNajIzaERBaVhzLzhhRkluZFlUSGdQ?=
 =?utf-8?B?UzdGYkFyTm9LY0F2c3Z0ZTVTR0dxanlBYzI2bjhZWklaaXhJNFpUd2c0dzFH?=
 =?utf-8?B?aHA2NXBGN0JWdXVhWk9tTkNYM0hwcVN2cUN1UG5XYjdONUFKdlVRT1lid3NB?=
 =?utf-8?B?R2MwWm90Q3V2RmQ5UU0yS3B0YXlWTmJhcVNVTzZIbWxCajJaTUNOVFRwbnRE?=
 =?utf-8?B?T1dCUjRNVmNIc3lJVUNVOGZtYlVMSjVjczNhOTVMRCt1eVFMdVRIVlc3Z3Nq?=
 =?utf-8?B?dEtZNU0xUnQyZmcyRktSWHpocUNhSW9ZWW1ZTklaOUlIckV5U1ZlVkhJNHBM?=
 =?utf-8?B?ZVpQWkJSaWVURVg1L1o2TnVad1ZsQkpQRUwxL2Y1T2w0d0YwcFZaZU9ReVBG?=
 =?utf-8?B?V20zbG10YmYrNDMrVGQxek5Bd0NaOGIyb2w5MXc2NnA2c2t4dVRlbGIrVHVz?=
 =?utf-8?B?NzdKdmxySTZWL1FQTkQwSGRGNk9ha0t0V1Z1VVNwQVhmUE5WSHg4VXlUWGZ3?=
 =?utf-8?B?M3haYXlZYVBuNkNDUXB4a1o4aGhGUkt3QjVpNExvdG9nSFNuOFJJUEcwS29U?=
 =?utf-8?B?dURyTHVJNXVUbEh3b1Q0VmxBUzhmcnF4Q1BWZTFOQ1RiRjFmS2hoUC9UbnZx?=
 =?utf-8?B?cURSb0h3K2JFQk02akVzYzBLL1FVYkk2Rklocmc2Wkh6RTN6MTQ0dDdibStR?=
 =?utf-8?B?SzRYRnRPZmJPOWRVbjIyVHpBVE0zUWJCczk1YitZNGoyY3RzYXBFMEs2ajIr?=
 =?utf-8?B?b1lqTWlEbnFQMkxJSURzeTQ2L3F3THkxMEdsVXMrckszRTFNTXRjU0JWVUdm?=
 =?utf-8?B?NWF6Nno0K2I4aHFnazZQcks0OHRvSTNqekhrWW9wcloySk1oSVFqU2lnU1Ru?=
 =?utf-8?B?Y051eEd5TWdFcnQ4Y21ULy9CTE05MVg5WXR5UHI1ckhXRXZManJiSndLUDdB?=
 =?utf-8?B?N0Z0aHFQcDBGYlV3NFZ3K0Zoa2FxQllsd0dIV29MY3Zkbjh0K3hGVno4c1BF?=
 =?utf-8?B?SDk2UE1JTUtUaS9UZUdUdTl2NEU3OFpJeElwY1huWHFjRHpmVy9sZ2orMlNz?=
 =?utf-8?B?RkJ2dHN2U1RzNjBMdUxGblo5OGxKMnhSU2lPYVNFN3BtcFFQaGxUR3hLdlhC?=
 =?utf-8?B?a041aVQ2NDJSNXo2R3JRdHh1bFc3NWs2S28wVUNPa21sbjBwK1Fha1h5YnBu?=
 =?utf-8?B?R1BhM1ZvQXUvY0owL0VNak14SUlDMGNDbjZDc1lZTktZUThneU1RdUtybndT?=
 =?utf-8?B?YmQ2MlZlK09hYUxRQ0tmVDF6SmRPaHhWb2tkVkh0bDRJMWdQeStncC9kMXg2?=
 =?utf-8?B?V0dDK2h3NG1qODczTmpGaFcremphek92RGZDUDZQaS9FajBEUFBIRFRHYTIx?=
 =?utf-8?B?SkQ1Z2FROXR4RlU2TjA3ZTBvWHUwNnVLNFV6NnRsd1BUeG1WRm4xRUtUS3k3?=
 =?utf-8?B?OVRjVEp0WXo3enVYeGJxd09COEdqbUk5SFJkSmp5MSt2NXlURkN5dmZ3NXVr?=
 =?utf-8?B?QUlSOXFPRGd6ZFg2Z01MTkh3UXJXa0txN0t1TC9xMWpIZkdIcHRYeFIrTENB?=
 =?utf-8?B?VnN4T3htRnNmUVFtdjI4UzFtNzI4MVZjZkFrVTdIUk4vTEVIZXJYTFM2WWM1?=
 =?utf-8?Q?1VJDHfAJjAxjtoxiDZJvzlc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: def1f291-5c06-4dcc-6f1c-08d9fdb38a04
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 07:49:40.7092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BUkOO6xnn/NQ1JEGLc6Ztn+dJ+yL3umX8WV2rxz1lfBeTpQ3G0lcm+t4txcuTOBq8iJOxmPWbkXYOPq3KVtxiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2757

This simply parallels .dtors. Both section types can reference
.text.exit, which requires them to be discarded together with that one.
Compilers, depending on their findings during the configure phase, may
elect to use either model. While .{init,fini}_array look to be
preferred, cross compilers apparently have this guessed, likely
resulting in a fallback to .{c,d}tors. Hence we need to support both
sets.

Fixes: 4b7fd8153ddf ("x86: fold sections in final binaries")
Reported-by: Andrew Cooper <Andrew.Cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
As mentioned elsewhere, I don't think init_constructors() is correct
for the .ctors variant. But that's a separate issue.

--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -415,6 +415,8 @@ SECTIONS
        *(.eh_frame)
        *(.dtors)
        *(.dtors.*)
+       *(.fini_array)
+       *(.fini_array.*)
 #ifdef EFI
        *(.comment)
        *(.comment.*)


