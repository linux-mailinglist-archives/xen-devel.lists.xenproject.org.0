Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7902037290E
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 12:28:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122079.230233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldsGu-0007f1-5d; Tue, 04 May 2021 10:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122079.230233; Tue, 04 May 2021 10:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldsGu-0007ef-2A; Tue, 04 May 2021 10:27:20 +0000
Received: by outflank-mailman (input) for mailman id 122079;
 Tue, 04 May 2021 10:27:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4Og=J7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ldsGt-0007ea-2D
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 10:27:19 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d642e090-c73b-4b09-88dc-ad84ada52c15;
 Tue, 04 May 2021 10:27:17 +0000 (UTC)
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
X-Inumbo-ID: d642e090-c73b-4b09-88dc-ad84ada52c15
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620124037;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=CMKq6+bwsHCfmJ6XKcTLGMWTHi26fPUtc48zVuzErx4=;
  b=c04NjM9A2iUHNd8/Q7QjEmlwO87vZyRZMFYMNoX9dZQ5U21RNu8Ukhoe
   KUT2bHPnW7M0E7eq+gX21wnzaw4+UilwR5B2p21OQ7q4+IW3/gaYoKpxw
   upEMjsBEbWbciMDuzQD2nDfaaL5gYchf/e2sysM4/al1sgt3QtDHeTflL
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: y42Gwvmg6SwfujHWV+n0DnwO6IuuNxfHPkg2Z2zv8dd1wOAwoa0gtQTOjibgUPPoDgIpAQiZqk
 L/fQiyfKIlm+E5HVMlAzAAR4I6A7Im70e1CeUXQuqHUtQjuQQdAqTva8/IcGOnMdYJv54oTV+9
 8yvOOjhZ3HM/sMe4NWlLW7DHqpy/RnCGh6lTe2/wL7mIqG0JCe/g+CuDSJdWqaJhb2bZ2sWQ/B
 vg5IoFLLizU6SOahDoHl6e1sQOzIZcfJ/vIbi7+ahJTIAmH5h8wwB3Ubbqariz05sfuPP4gRq1
 WWc=
X-SBRS: 5.1
X-MesageID: 43121103
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:t/huD6ilrcRieYtzMWBGIr09U3BQX2hw3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2+csFJ+Ydk3DtHGzJI9vqbHjzTrpBjHk+odmup
 tIW5NVTOf9BV0St6rHySGlDtctx8SG+qi0heHYi0xgVx1udrsI1WdEIyywe3cGIjVuL5w/CZ
 aa+45rpyC4f24Wc8S8ARA+LpX+jvfMk4/rZgNDOgUu7xOAgSjtxLnxFRWZ2Rl2aUIy/Z4J92
 /Znwvlopiyqv3T8G6n60b/zbRz3OHgxNxKGdCWhqEuSwnEpw60aO1aKti/lR8vpuXH0idPrP
 DtpFMaM913+zfteAiO0GTQ8i3B9Bpr1HP401+fhhLY0L/EbRY3EdBIi44cUjax0TtZgPhG3K
 hG332UuvNsZHuq9kmNhKmrJmRXv3G5rnY4nekYg2Y3a/pkVJZroZEC50QQKZ8cHUvBmfAaOd
 NzB8LR7us+SyLiU1nluABUsbuRd0V2NBKHTk8eg9eSwjhbkVtopnFotfA3rzMu8okwRIJD4P
 mBGqN0lKtWRstTVq5lAvwdKPHHRVDlcFbpCia/MF7nHKYINzbkrIP22qw84KWPdIYTxJU/tZ
 zdWDpjxCAPUnOrLffL8IxA8xjLTmn4dy/q0Nti659wvaC5bKb3MAWYIWpe0PeIkrE6OIn2Sv
 yzMJVZD7vINm31A7tE2AX4Rt17NWQeassIodw2Mmj+4v7jG8nPjKj2YfzTLL3iHXIPQWXkGE
 YOWzD1OYFu9UaudnjkgAXAen/kd0DllKgAVZTyzqw28swgJ4dMug8ahRCS/ceQMwBPtaQwYQ
 9fLdrc4+eGjFjz2VyNw3RiOxJbAEoQyq7nSWl2qQgDNF6xVb4Cvt6YaF1DxXfvHG45c+rmVC
 pk43hn86O+KJKdgQo4Dci8D26ch3wP4FWHUokbga/Gwcv+YJs3AtIHVcVKZET2Pi0wvTwvhH
 ZIaQcCSEOaPCjpk7+ZgJsdA/yaUcJ9jgetKct9smneqk2YmMEqShIgLnyTeP/SpTxraytfh1
 V3/aNaqqGHgyyTJWw2h/l9DEdBc12NALVNDB2MYaJdnryDQnA3cU66wRihzz0jcGvj8Esfwk
 jsNzedd/3wDl1BgXxAyarx/FRodmKSQlJoZhlBwP9APFWDnkw2/f6AZ6K13WfUUFcEz+0HGB
 zuYDcZIGpVtpqK/S/QvAzHOWQtx50oMOCYMa8qdKvL3GixbKeSk7sdIvNS9JF5Fdznv+MRS9
 iDcwuNID6QMZJx5yWl4lIefAVkongtlv3lnCD/5G+jxXglHL78Jk9lS7xzGaDU00HUA9KzlL
 N3gtI+sbHubiHfatuaxbrWaDAGABXJumKyR/wpr5cRna9ajsoFI7DrFR/zkFdA11ECCe2xsm
 U0aqFy+qrANY9iZNZ6QVMTwnMZ0PC0aHI2uQn3CNIkdV4jj3XnL8qEioC43YYHMwmknk/MIl
 GR/C1WwufdUwaC3bAcDbgsIW4+UjlL1F1SuMeDfZbXEgOkaqVq+0e7KGa0dNZmOeW4MIRVih
 Zx+NeTmeCLMwL+xQDLpDN+ZoZD6XyuT8/3IAWCH4dzgpCHEGXJpquh+8ioijjrDRO9dkQDnI
 VAMXUqUf4rsEhrsKQHlg6oSqL2pUo5k1xRpRFf/2SdpLSO0SP8BkFJMQrQn5NMeyJcW0L41f
 j4zQ==
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="43121103"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+kLTFSEK4mDkfOomMLrnhwT9ZPrg7YlRPK/6GjgnphGUasD2uEeUuO06JORbdo+V4uL+vYizIjV4xqfTfELde4//4dI74nz62ABlrY269iwVeQgWSzV0FILS+t4WBEV54gwNpcGkAIB//psRZ/X/ciXX3jITBn9RnwW0t3HnWAX9kk37LC/fPhhsyFuBRiSR4PayIRqN536oh4wkDwiWYPLD/2TiR3gb1dbBwyFlFLuRDafhnv8QVfEkc+18Y7ffcheHj5LL0zUQ6mwBkz/y30/fg4Yjh6WkUm2xv6uF20RnMP/3dHlqlTIZtgda4mBDl0rUquibkOrhtZ1gNN3Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMbsXZI1ILwSgYxitoIFgSUXxsw7I48Mp9yc+OCjGCA=;
 b=TVJcjPwuF4eUoEosVOAQjHj5/yGRYVvth36eVqoBM/pKImEGM5KDEcTieS34OvTgWVSG/Dub+GvTMX5INFuhiiHN2nb+2M7RSbi7kF1Dij28BjhPbK4jfrQP1jcI/onYYSHU1q/l/QpJXgKuZMTXNtC8v0WgRWSw2GBUXo7Bka58GfQntWlmShfJfd0NhUHVG8ziVDwWPvliJ17MryKvQfnK+zffWZpaioX46I7d0XaCpbh2y1+1y9TT0+BraSCOOlyHPhnWZKhl1uwj7ukzJY4UTlLBtO4Ho9wXue3qr0m7uBrQJegWwpbwhvf2y1cQF8AOTE+dxGQQNVE86NpG0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMbsXZI1ILwSgYxitoIFgSUXxsw7I48Mp9yc+OCjGCA=;
 b=WsaqyG00S8/QE6DdOLHxYg9qoMNiGdMr5bMr7nIUM/5pzrIov2YPjB26NCTw4JXkm+e6I6D9u8LN9KPl6vmaG9+Wcuizpif3K1QjS/h+tlW9moRHzdm2bpESM2W+bkrsSeztuXULX28ImLX0rvuiXzRj7CErl+gTz+V8wijCSao=
Date: Tue, 4 May 2021 12:27:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 05/12] x86/hvm: allowing registering EOI callbacks for
 GSIs
Message-ID: <YJEhfO0gSxFJQc8u@Air-de-Roger>
References: <20210420140723.65321-1-roger.pau@citrix.com>
 <20210420140723.65321-6-roger.pau@citrix.com>
 <19b0b30d-2fd6-4cc3-fd7a-4f4a3ce735f7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19b0b30d-2fd6-4cc3-fd7a-4f4a3ce735f7@suse.com>
X-ClientProxiedBy: MR2P264CA0066.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0221180a-e5de-4e2e-4241-08d90ee72ed7
X-MS-TrafficTypeDiagnostic: DM4PR03MB6062:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB6062619FEBA95CEC1FAB080B8F5A9@DM4PR03MB6062.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sjG/lnrroAGCYHcloqvhC7QSLRGdyocgv4w+wNvqU9R8drac1qnHIGYjoCh9RopcLcL6iLhcOr+WFbMNNvobx917vXhuLk3+5hVBKnL+P1SpOEETj94MVQ59ydtir+F9kWKnX/NLS1jQcClNKLagem1dW3AHUJyICW1M6eD8oXk3j0EI2GtLdvp7OeqlE7aRXtV0sPO0w0xANbjiMRIsp7teIf5VRfc0cu0A0QXNQ3vDHCWoHOiFGhcywmKGlhHE8CBhARTVZg6oiykXFUJ490zxq0e40QsGEucBjm2/MtiB7I1MaKf9FjT9Tn5RbTWScu1hOCjNkkEnbz41Lu9hxoDeUhPpJZII0+jA4FV3/ASP3rxOD2oPNoCq+KzB2L86NEeQhD+ftidOSZGJhynM03CU1/QyKTfq+YFZLi6a7dYqncSxb9TZvH4dmmDMhzA97WAiZdN4SLcn3fNH6GoABRunz7E7AzqGZN0maAtPBDxmfagx9enBdR+ZbV0XROjvlZR+Z+1kLGkyr43FkwcGfwU7DARckNEPv2htrfGDp0244/o1unsRGEtdYtxVYMtX3faL81whcTPO2t9EaaPdSXs2oo8B9K9zvJcflzfvxTY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(66556008)(53546011)(6666004)(66946007)(66476007)(5660300002)(83380400001)(2906002)(16526019)(85182001)(478600001)(33716001)(86362001)(4326008)(956004)(6496006)(186003)(6486002)(26005)(38100700002)(8676002)(54906003)(316002)(6916009)(8936002)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b0cvNGMrQ3RBeXdUVjZLZUFFa0pRWlB5YkE5WFQwRWdxQTZhbDJ0NEV4cWN6?=
 =?utf-8?B?R0VGK09DVmVndlc3UjUxMnBNZUltTlNOOTM2WE1iTmlLcTVCdzRHVmdCeU5D?=
 =?utf-8?B?dGVnQlBzNHhEemVoa0FGTnlYd1JYU2xrdUhkSWtkcUJ1aEFYbElDM2NjU2JL?=
 =?utf-8?B?TXlxNXJlSkd4UmdNTWNJejZxekxQZlB2WEFETmNUYTQ5aFp5c1M0U0lVM3c1?=
 =?utf-8?B?cmRieXkxbmlnWGM2dndKTjNtQTc1bzROOFZCUFVJcDhmSWdxVmVnQW94TjhX?=
 =?utf-8?B?ZmV2K3RqVi9idmFiYy9UdFNyNXlFbDNiRHh4MmszbGhEaTBBV1BnSUNCNzQ4?=
 =?utf-8?B?bzRzVkd2a3V1RHRsQ3FtTm1CTjZ6MTh4cktWS3hsQm92N1pSS2dGVGlLZXVH?=
 =?utf-8?B?dUJ5MmRScldzeXhiRVhJVm1WRFBjTGVRK0VzWnVSWHg3dVVYMG1GNmpLVGov?=
 =?utf-8?B?UGN2b1E4ZUI2ckVQNk94Tzd4UHN3RVRyNTVFWTU0eVVWVldSOVZYb0NWMnZY?=
 =?utf-8?B?QnFhY0FST1FERWFwc1luR2NiSTIvZUJSOVNyaVV2TFdCL2s0NXplbGNPbVZT?=
 =?utf-8?B?SmRqUjkxWHZoOUo4ZzhIL0VMQnBEdmNMR0xMelpIVEsySVBHOWZBa01DeFFJ?=
 =?utf-8?B?ZW1CREVLOU1Nc0pFdmpBUzd3MmJFT01NeGRrSUVNNlhjSEZwOUd3ZXNNR2pG?=
 =?utf-8?B?ZnhsMldVdCtrcUNvSnE4YzlWa3J5RDROVFZZQW1zNW1tT1ZGR3NtUjhBTUUr?=
 =?utf-8?B?cU5rNzJZa3pHUnBNR0M5dWU0eStvSlNSZDFHRGlkd3dlUjdnRU1qZkhHUkhY?=
 =?utf-8?B?SDVsTGlsd2x2RndNRG9aaVViQnZKNEdkSThEMTlJMXBJRDcrK0crdUxWNDFY?=
 =?utf-8?B?MFJFKzV1U3ltN1VDbUs4OUl4djlrc1FXb2VVZVVLQm1wbS8xZEpXc2V2THdk?=
 =?utf-8?B?cGxJS3NHT1Boby9zVFdjczNMU0IzYUFnZk0wUUV0WG5TMDQwdUdIdXNMMEcw?=
 =?utf-8?B?L2kvL2ZPWkZjM1RRTDhrY1k5cS92eC9KVWV1cGdZOUFNanBWUGJ3N3ExMUNN?=
 =?utf-8?B?NGhZZTQvU1NROXgremZwRHpQMzNQY0pPTDhqc1VQTFdjK2psMVFtMXByWEkv?=
 =?utf-8?B?NUVnemF3aFR5K0xVcmtpY0lpTEgyUitTbU9yNnduNnlZSWJJZzd1VlFOU0p2?=
 =?utf-8?B?VTBoVWVIUlEzSndRd3k0UTQ0a0xxSE1IV0pEM1RtUWUybGhBZkRRTlFKR3lD?=
 =?utf-8?B?bExNYlhsdlgxL3I1ZmxYN2tsQmdjVEQ0ZWJBU0R2NlJlQnNOU1RBbzJpdXF2?=
 =?utf-8?B?OUIxc29MSWtwbEpwV3ZZTTBnUU0ybXVmRkk0eDEwUGJBeXpHemZVSnMzV04r?=
 =?utf-8?B?OWlwUUlKT1J0YXRQUU0rVWFjYWxUbVU2N0FDS2JNK2IwaCs5U1N0U1hySWdl?=
 =?utf-8?B?RHFBZENjenBlRks3Wk0rV2JBVHdNdXpqVkVtK0hPUnZTdWVxKzNiWlRyVWYw?=
 =?utf-8?B?Wm50TGZKQVZ3K0J2alIrN1ZucXgvKzk4NHYvdUxaYmtySE01SWlhT2dpSGVs?=
 =?utf-8?B?eTdzcG9HWEdnWm9BalZYWktqVXU2UE1vdFJxSC9FWjhNQ2xEeFhJUStVZ1lT?=
 =?utf-8?B?bjlDakdmS0hSTnNnL1IxUy93MEFXNUFia2paaWRxSkpxNjJzUDhzUkRoM0RR?=
 =?utf-8?B?UDdXT2xmRVBPdnYvRXFXWklGUHd5ODAzdkNJNndKVWlXYzRIcmhYQXRmaXhl?=
 =?utf-8?Q?R4GFuUjN22xe2wwuavfyTFH3CLiMGMru1nXIYRk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0221180a-e5de-4e2e-4241-08d90ee72ed7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 10:27:13.6744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qx/ufi2V63PtrE4B8+OZTfMt+L3Gj+RFkFLvAHwnYnsPLbsyV8zNHF9GYPR32aDkkY7QVIoMiKJ1BYcoTKHJGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6062
X-OriginatorOrg: citrix.com

On Mon, May 03, 2021 at 05:50:39PM +0200, Jan Beulich wrote:
> On 20.04.2021 16:07, Roger Pau Monne wrote:
> > Such callbacks will be executed once a EOI is performed by the guest,
> > regardless of whether the interrupts are injected from the vIO-APIC or
> > the vPIC, as ISA IRQs are translated to GSIs and then the
> > corresponding callback is executed at EOI.
> > 
> > The vIO-APIC infrastructure for handling EOIs is build on top of the
> > existing vlapic EOI callback functionality, while the vPIC one is
> > handled when writing to the vPIC EOI register.
> > 
> > Note that such callbacks need to be registered and de-registered, and
> > that a single GSI can have multiple callbacks associated. That's
> > because GSIs can be level triggered and shared, as that's the case
> > with legacy PCI interrupts shared between several devices.
> > 
> > Strictly speaking this is a non-functional change, since there are no
> > users of this new interface introduced by this change.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> In principle, as everything looks functionally correct to me,
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Nevertheless, besides a few remarks further down, I have to admit I'm
> concerned of the direct-to-indirect calls conversion (not just here,
> but also covering earlier patches), which (considering we're talking
> of EOI) I expect may occur quite frequently for at least some guests.

I would expect the vmexit cost for each EOI would shadow any gain
between using direct vs indirect calls.

> There aren't that many different callback functions which get
> registered, are there? Hence I wonder whether enumerating them and
> picking the right one via, say, an enum wouldn't be more efficient
> and still allow elimination of (in the case here) unconditional calls
> to hvm_dpci_eoi() for every EOI.

So for the vlapic (vector) callbacks we have the current consumers:
 - MSI passthrough.
 - vPT.
 - IO-APIC.

For GSI callbacks we have:
 - GSI passthrough.
 - vPT.

I could see about implementing this.

This is also kind of blocked on the RTC stuff, since vPT cannot be
migrated to this new model unless we remove strict_mode or changfe the
logic here to allow GSI callbacks to de-register themselves.

> 
> > --- a/xen/arch/x86/hvm/irq.c
> > +++ b/xen/arch/x86/hvm/irq.c
> > @@ -595,6 +595,81 @@ int hvm_local_events_need_delivery(struct vcpu *v)
> >      return !hvm_interrupt_blocked(v, intack);
> >  }
> >  
> > +int hvm_gsi_register_callback(struct domain *d, unsigned int gsi,
> > +                              struct hvm_gsi_eoi_callback *cb)
> > +{
> > +    struct hvm_irq *hvm_irq = hvm_domain_irq(d);
> > +
> > +    if ( gsi >= hvm_irq->nr_gsis )
> > +    {
> > +        ASSERT_UNREACHABLE();
> > +        return -EINVAL;
> > +    }
> > +
> > +    write_lock(&hvm_irq->gsi_callbacks_lock);
> > +    list_add(&cb->list, &hvm_irq->gsi_callbacks[gsi]);
> > +    write_unlock(&hvm_irq->gsi_callbacks_lock);
> > +
> > +    return 0;
> > +}
> > +
> > +int hvm_gsi_unregister_callback(struct domain *d, unsigned int gsi,
> > +                                struct hvm_gsi_eoi_callback *cb)
> > +{
> > +    struct hvm_irq *hvm_irq = hvm_domain_irq(d);
> > +    const struct list_head *tmp;
> > +    bool found = false;
> > +
> > +    if ( gsi >= hvm_irq->nr_gsis )
> > +    {
> > +        ASSERT_UNREACHABLE();
> > +        return -EINVAL;
> > +    }
> > +
> > +    write_lock(&hvm_irq->gsi_callbacks_lock);
> > +    list_for_each ( tmp, &hvm_irq->gsi_callbacks[gsi] )
> > +        if ( tmp == &cb->list )
> > +        {
> > +            list_del(&cb->list);
> 
> Minor remark: Would passing "tmp" here lead to better generated
> code?

Maybe? I don't mind doing so.

> > @@ -419,13 +421,25 @@ static void eoi_callback(struct vcpu *v, unsigned int vector, void *data)
> >              if ( is_iommu_enabled(d) )
> >              {
> >                  spin_unlock(&d->arch.hvm.irq_lock);
> > -                hvm_dpci_eoi(d, vioapic->base_gsi + pin);
> > +                hvm_dpci_eoi(d, gsi);
> >                  spin_lock(&d->arch.hvm.irq_lock);
> >              }
> >  
> > +            /*
> > +             * Callbacks don't expect to be executed with any lock held, so
> > +             * drop the lock that protects the vIO-APIC fields from changing.
> > +             *
> > +             * Note that the redirection entry itself cannot go away, so upon
> > +             * retaking the lock we only need to avoid making assumptions on
> > +             * redirection entry field values (ie: recheck the IRR field).
> > +             */
> > +            spin_unlock(&d->arch.hvm.irq_lock);
> > +            hvm_gsi_execute_callbacks(d, gsi);
> > +            spin_lock(&d->arch.hvm.irq_lock);
> 
> While this may be transient in the series, as said before I'm not
> happy about this double unlock/relock sequence. I didn't really
> understand what would be wrong with
> 
>             spin_unlock(&d->arch.hvm.irq_lock);
>             if ( is_iommu_enabled(d) )
>                 hvm_dpci_eoi(d, gsi);
>             hvm_gsi_execute_callbacks(d, gsi);
>             spin_lock(&d->arch.hvm.irq_lock);
> 
> This in particular wouldn't grow but even shrink the later patch
> dropping the call to hvm_dpci_eoi().

Sure.

> > --- a/xen/arch/x86/hvm/vpic.c
> > +++ b/xen/arch/x86/hvm/vpic.c
> > @@ -235,6 +235,8 @@ static void vpic_ioport_write(
> >                  unsigned int pin = __scanbit(pending, 8);
> >  
> >                  ASSERT(pin < 8);
> > +                hvm_gsi_execute_callbacks(current->domain,
> > +                        hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
> >                  hvm_dpci_eoi(current->domain,
> >                               hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
> >                  __clear_bit(pin, &pending);
> > @@ -285,6 +287,8 @@ static void vpic_ioport_write(
> >                  /* Release lock and EOI the physical interrupt (if any). */
> >                  vpic_update_int_output(vpic);
> >                  vpic_unlock(vpic);
> > +                hvm_gsi_execute_callbacks(current->domain,
> > +                        hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
> >                  hvm_dpci_eoi(current->domain,
> >                               hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
> >                  return; /* bail immediately */
> 
> Another presumably minor remark: In the IO-APIC case you insert after
> the call to hvm_dpci_eoi(). I wonder if consistency wouldn't help
> avoid questions of archeologists in a couple of years time.

Hm, sorry, I remember trying to place them in the same order, but
likely messed up the order during some rebase.

Thanks, Roger.

