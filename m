Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D139B60A707
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 14:46:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429080.679880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omwpn-00074K-Kr; Mon, 24 Oct 2022 12:45:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429080.679880; Mon, 24 Oct 2022 12:45:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omwpn-00072U-H0; Mon, 24 Oct 2022 12:45:39 +0000
Received: by outflank-mailman (input) for mailman id 429080;
 Mon, 24 Oct 2022 12:45:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kmwR=2Z=citrix.com=prvs=289ef416b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1omwpl-00072O-Op
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 12:45:37 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c02521da-5399-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 14:45:35 +0200 (CEST)
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2022 08:45:32 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB5552.namprd03.prod.outlook.com (2603:10b6:a03:288::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Mon, 24 Oct
 2022 12:45:30 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5746.028; Mon, 24 Oct 2022
 12:45:30 +0000
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
X-Inumbo-ID: c02521da-5399-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666615535;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=khTCeKKg3igYrCwYZzMCfblErcIm6btX80pM2C+fKIk=;
  b=KJQgf70nz7l73SEWomdjvFhRHotZX31riXqqqk+dRvSBhVjxU3EG1lVd
   +Jji1yXNZMlb4oPKGOlIrsPvHVzlsEiRI/AXYdgXUSLKegzkTSmRbMFM/
   AgHkr0vLLrOWdpCCf3Yruforsp/nh5m/JbjoVaKCrr0JBaOuE8CJT0YZf
   o=;
X-IronPort-RemoteIP: 104.47.56.169
X-IronPort-MID: 83389069
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3Asmh7AK8oFmMhnYH0pnArDrVtTnXEyJsLBUUsX?=
 =?us-ascii?q?f1Ep+oz8vayuhV8yJ73PPB8VjkiIqRVR6oqiDZNU05uCsLcQJaoguFu7eu1O?=
 =?us-ascii?q?NQhlI7w+waK85O8q+NT/4WP7pEhYAjnV2bCfSXkiylgmDPm+2Y7KJM0r73KU?=
 =?us-ascii?q?i3KZJgNjtvuiXfYxy441lej3EJ15mIn16KO7VXj8+59pjM87V2gwJxGxF0lK?=
 =?us-ascii?q?AS5kVS794+w+eJc581nPipOJ5oK0+E0VEPUuhv+1ohrqcrXbVu0muLFT8xM3?=
 =?us-ascii?q?jGowWoT/kXwteLcmL+7zA/kY81UNyYc8lhEV0AYc6rOOWvjehqex6WhlISmm?=
 =?us-ascii?q?SwnffiXELOEl7ec3OM3pdIdEmVByxJNwnPrSIH6u4bvUYIY12eIrEoZHMCg4?=
 =?us-ascii?q?MoVfBQYct9W1aGL7geBEqr49F0awPuz8w96n9UlTnyAHHo04Q/q0Q5OyD7I7?=
 =?us-ascii?q?BrETpXFQWDSOZDzHFz2JLXFMHqIDV89Wuns79D7Ta+ZAVudmEHfslmZ4NfTe?=
 =?us-ascii?q?bDuvprJ79FPy+fjf0TEzWhqdKQ4UcTjZzED2Lq3YHHpIdnvHi/H4K9xFs/rg?=
 =?us-ascii?q?/DJLzhtjOBkBW3LPqhMMO3KjXrYwXGLz0T2SAuUFN7SteQ/RkLn62py9xS53?=
 =?us-ascii?q?i2Q2sIeMxvitATNNYVl0linTsYQYV3g1lePMxVtHEGuVFMTn3/ttXa0rcynI?=
 =?us-ascii?q?/F+dlX5Cuj86kwwe6dokI81BOCtc7ZP8QHJHeju/cWauJ6VIL11tpan9pBb0?=
 =?us-ascii?q?EsgDNGXgh9/p/kYY/QR11BRvvTO6ICyXSxGBel85Gh2S+wCWuOwpVw5BbEGj?=
 =?us-ascii?q?wXdGZ5BA/B3hkKiqoYvMw04Un1P9VrBKUxA9SDErGwrwl5J3y+jGrzyIW0TQ?=
 =?us-ascii?q?wLpSrgp+u5Quoj4fWMjWKvQ64P7wSd8hILRFCzcdZmsbImFdJbta6Sduok80?=
 =?us-ascii?q?Ia4WZlYD5o/z6v7alLg5phOiqqWwgYORbvh3g6hpZdbv6k9IHiglohFRzBOt?=
 =?us-ascii?q?t2TlPH/+s2p0mSGeiFu1yWIPwbFIiPMFIVRoA9EmctDWKWYvu5RjxZ2wX7MU?=
 =?us-ascii?q?wdMUjNhM3aMfLF8ZUG3G47JYpwFfcRaeEbf52vWhoGV+hW+AahmmXgauVX+l?=
 =?us-ascii?q?YBbBctCe+oG75CVDdTo9rl4t2hb/9ZNkQ46Wcgu4mJezTeeXOgHhZZG2vMjk?=
 =?us-ascii?q?OJu1F4Z8EkiFpZ2LiM3xbV0zI55Wo/6dDx+f2swND+IV2nSxZKz3h0C7uMx+?=
 =?us-ascii?q?RIEh6R+zJu0XMho8mX+XWWJ91d+iFSUn47cIzmRbhgfEqFQoIWikLQfV8Y3/?=
 =?us-ascii?q?ZS4NhWsNOjvaurnvuRAKPvbc6mdTgB9RjqM1XVovwD0nvcTfT+PWnHRHAGxq?=
 =?us-ascii?q?u7ZQBL+WwVmlAjC6/A158Ct5MJOJFFTCvk+Rt+uaMBUiumpad4IqLtgH/NTm?=
 =?us-ascii?q?TVXSKG92JAqq6/ggfvvafCaBJKNiYcsGJxwfqnPTobvzefTJAiIiciDWYpJP?=
 =?us-ascii?q?QpDGZddjIov113Yyk0snEqJc6tZ3xz1qC1h/P0V7vGtg1RUI/m98GUBFNFz/?=
 =?us-ascii?q?4VGl40POHJ7lyYXOYbUN6kCxPVPUValAZwAxogrBoY73uE2uOz3AlRHWH8eX?=
 =?us-ascii?q?6sGpkO2lOUdgqIcwCfRbv/ccQURmoUio7LQKts4clgJbfwbma070771Kq03b?=
 =?us-ascii?q?P94TDsKMv3ZS5fCk19Y/vL+IkWdcohUU5IzZSM8GdRVsT7gv/0fqMXHiibn2?=
 =?us-ascii?q?uASJIMMFr9zTf1zfBbkinseU824dTjGa16O+778K/HVGy2l9SYK+MaN5hLES?=
 =?us-ascii?q?aX7d8OqqySLRjW1e/RkT+PFiilDzHXW2BHr1dspK0cz91a6T3ZEx21mLi6Bo?=
 =?us-ascii?q?ngLjfzB9ljZa7Nh0rTkSfMjDTIIi7AClHnYHS99X2z5v+UT9Nddz21CmnMuY?=
 =?us-ascii?q?PVQ/qrDL0oaHnwqj1iXvK8cuphaUF3JaKfXsjXeBDIAiVeE1F8P2sn3+bteN?=
 =?us-ascii?q?C32yyBn/qawhOzLwF+8KG2xtfZoUvpWlC3phj0oIwVT8JWttsW3h2HkX5Qiy?=
 =?us-ascii?q?XTs9YGvxdMzoOevKD3PaQamKWSQpiQyLRW7xSRmrSWtQsIeANSLJbfW9YBWN?=
 =?us-ascii?q?vy6FejbkvXzD3wJEiz7u0DI5T0VetSSXkI4Sk1FsF6q/ppMu5oQiIAo8Zhh0?=
 =?us-ascii?q?kiQhNfuy0DzYcYnIDvqAldGNN52fScKs8KrnbXH8qorxUCIaqpI9qA1HTxoc?=
 =?us-ascii?q?jPpyO5/GzJ9YAMAbZWK8VHDw5wPW5lr2IHoS4iLr6HBCXfpitd1JlgorBBC4?=
 =?us-ascii?q?7d4Y+tRwurYkxijXKheejK3Hz1GzyFAQbTxClCqZkvZ00mEcfEbNZ+6PprRe?=
 =?us-ascii?q?TSQDo78b9qQfAwWYecp0F4nuIGF/64RpbooDYBlOzkLkGuy6l5mUK2DsFZrP?=
 =?us-ascii?q?3Xl09mcJPkO4oFY?=
X-IronPort-AV: E=Sophos;i="5.95,209,1661832000"; 
   d="scan'208";a="83389069"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NC97ugPIuJvhxIb6aGnp2HloaMCv2yIc39WVOwaZpEwsFocnWjDeXnRzaMdwTwBSbw+G6Yij2HOY8DZQ9CQhlfBpuAsAIeoOdxBhPh0XtJOHTiW05Q4ltMFH7ez2e4/aRo+2jccFd5BVwNgc5s/Bn4QRTvj44V+l3GnnhoTXxMyA1oWID7GyJJfcK228xYBgbTyIyonxqFSsnf9DfATahS/skxBFJ/80DywcG4wkcDvze2BERBTRmGkNZqBRvyVs8xfZVirBaqnFZPJClQImUalKF9iySBo7BqOzaXojv+cq63IrukTXrAYlxS40/bFY01WXOkKxBfj0W2+4pVXHyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYglnLr7u2WVkJnTDNyIpIYcFDZjiMFM9S28GAh3mTI=;
 b=AxliQlc85rkJNtQQTfDYVSwB81zzsrzgF/FexS3waWlwho0XhIDXGUMPIt1+yTZuIg+reEYu3oh+7QzWNQIwFbaImcHAx3rkV1GjctvJj4w5McSjrR5wQdprFHazPDFVYwPhcbZpf11oKFx5KTyehhm6AeXTiT63vmWMnnhF4nRpakkevhoGoA9272MbSWqhD2C+KeQv/I/I/2SvvvYVJitkY5KtpZ7ciL6I4ZmchKXwP74UX1pSkup5lGslMLNVBtIfUrj+FKdc45kjHzXx+aBHR7lUR5aitUqC672td1MIq7okeh0ogdR1UwY/4RXIrbMbMuJHNgUv1vByeSZ5vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYglnLr7u2WVkJnTDNyIpIYcFDZjiMFM9S28GAh3mTI=;
 b=Nzi8levRgUtFuqkQ0eunSXAZxC0rgpNtkonLoRA/UiNfner2wFf6N9ipNieoGUPsxlUIGRw1/aky6jvzb88Rs2D16wTgX4nhyHzDyfBEUgvXFP2ofnWNHTsGnTh209U36knveTVE/bM4gW2TLYxJCCuEMNUlrZ2CjLRIqNlxGsc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 24 Oct 2022 14:45:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH for-4.17 5/6] pci: do not disable memory decoding for
 devices
Message-ID: <Y1aI5Lbi3sysIZVv@Air-de-Roger>
References: <20221020094649.28667-1-roger.pau@citrix.com>
 <20221020094649.28667-6-roger.pau@citrix.com>
 <4c960f12-6561-d8e9-c1bf-8da18243ca6b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c960f12-6561-d8e9-c1bf-8da18243ca6b@suse.com>
X-ClientProxiedBy: LNXP265CA0073.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::13) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB5552:EE_
X-MS-Office365-Filtering-Correlation-Id: 26605783-f963-41ba-af9f-08dab5bda214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o3smJg+9ilzTLkMf7Bvrs2WHpca1CFIONYGJfs0JBuOI2me9Igo1yF8EEIRW13rXgokqKCTOl8Ql7tEwHl0FEEVukh8Xa/mj2QJRIdi/SWiBtgVzk1tQx4PwATQo2R2/IJ62ozO055P8FcKUqjXkynu81yXNlmqksKWuj9jVxF+ip+YExLyJcATHhTP69pbMhxJmqFeh65Fooj0OMvMhS2y+MoIXSSX7MWnmmcb1a9/PBnHkTEIMMSzlsgdUf7oLbcKGDleRPE6SFDeNEUtVITW0czkgB9JTY/A7ZE2rLyiYj6sxrO/VE/SFE2rZr2ipRTH+Ux466GAviY2c3rwDi6jykMOk69iyEFVsp2tzF9y33p7G2rVfyHAs6emcVQrWB4NkUB141nvxpyaWa6qGyKUqbSycO78bH4tJhjqB4+84zC0d0AV+neuUY2M0dTn/2bPu8y2uAkpFIvw0wrPiCk1sjkKpWHT7x1bH8q0ikc+0xnx2/N6QzUa1XYRQ9d+kOMuvWUfEYfXL84FYC7CtMd/FDYo2WNE/M1B8XztJSvf+zckvZsQ2jnLB9E0Em1G959FbpcirUJ3f6xgg7TKbSpasi3iJjaegUI48u4xuyx/A7sZ40PHUsc2rCxSJyq7tukMrDqnwkP1k9Wpi9F3JlkjtascrpMlj49CDsl4ZWs1vTn9QMVjWrl8TZxqSJmXTPQgwnEcrnEbObhPnFV0nVw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(39860400002)(136003)(366004)(346002)(376002)(396003)(451199015)(26005)(41300700001)(8936002)(6666004)(6916009)(5660300002)(9686003)(6512007)(66556008)(66946007)(66476007)(53546011)(85182001)(4326008)(8676002)(6506007)(2906002)(316002)(33716001)(82960400001)(38100700002)(186003)(86362001)(83380400001)(6486002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzhDb1IzMGl3bk5VTVVCZFNoUVdaZHlTeHpzak5Hd0RvcmJFcHBFTE5GaXdw?=
 =?utf-8?B?d3lDaGE4YWV4TVBIeFpVdGFpK2FWYUFkNm13N1dOdE5PNXdOWmpTQ3pGdUZT?=
 =?utf-8?B?Y3VweCtZRmo5K1M2VWFHREdvSndaSGtzTlVBdVZBMXl4dzhvUGxLenUyb0xw?=
 =?utf-8?B?cmQ0NHF2TSt4eWRCeGtURllQdzdCY0ZucmkrVUtwWDlkdHFvaGNMb1krck1G?=
 =?utf-8?B?VTE1YndIQ3Jac2w1emE4L2Z1SWUraWcvdmg4Q244cU5OdHdicTUydjZBbVE2?=
 =?utf-8?B?WlFqVEtuZzMyeEVDeWNOZDhYY2lFemF4RzZzbmhKaFZvTEN2NXZESlVHb0NH?=
 =?utf-8?B?cEh6RTQrb3QxbnY3alQ5c080WG4yNzJZSmZrbFZYZnpXN3dzMHFqVDRwY0VR?=
 =?utf-8?B?TFhGSGdBR3JKaEZhRUpHcGhWTEdqL3dCNkZjRlVVU1ZuNmNldFJGZzBsdk95?=
 =?utf-8?B?bnkxQWllaEtKOEkrYlY0dFRyaDFaTTVYb3hUVEhHVGNyTWUzeXhpbEF3c2lE?=
 =?utf-8?B?RG1rc0wyQkxCTC85c0lRaktpUXdMQ0M4SU54eFQ2WGRjdStva0ZIZFlONjgx?=
 =?utf-8?B?c1g3TVI4WGhvNkhwdnBSLzJ3d0NCQUxvQ2ZJUDZtMkhWS0E3dHF3NTE1WEpC?=
 =?utf-8?B?N2hkN0tjUmlqeFY3ODR4TksrejlLVEtUSDhXUFczSVZWczFnWE5uNkdEME4r?=
 =?utf-8?B?anR3Nkg4YnYrUVZIRkFJQUdzTkpGbWpJeGR5WEU0dndVbEdrRzVuRW5BbldZ?=
 =?utf-8?B?SG10Wmd4VFVUTlp2Tm15c3dFdzBaZlp5a09JMEtoakd2aUdCY0RYc090cmdk?=
 =?utf-8?B?azZhNzlpNnV6MTVvY1huOFk5Qy9UTzA3eS95N0hLV3pSYW5QVWNjYTlGTmE4?=
 =?utf-8?B?bG9Xd2hJVXZzaFEzV3Zvb01vSkZTck1SNVZFazRCWkE0aTh1aHNNaHRuM0RM?=
 =?utf-8?B?UC9zRWIxZFowUnBvblRJejE0Y2taMkdJYWxUVi8xWFhGK2VnMFlXK1dWa3Z5?=
 =?utf-8?B?RDRXZ2VYQ21kVlBkYVJNQ0RONFNid0ZWSFFTTnhCdFpRTzQzYi9DUjNGS0hI?=
 =?utf-8?B?TVp3eWx1cEdqa0tnRm1aRU1wUjNFdndXUzMwMXgveDdMb0QxK0Z2Tks3bDI1?=
 =?utf-8?B?RVZnZXB6ZDlRV0Mwb3RFeFRnTVNhMlRjd2FBNXVxeWl1VzlUNVY4OEljdmZY?=
 =?utf-8?B?dVVyVGI2MnErOVhNYjN3SEpkNUM0ZHlReTkxR0x2cVNZVVE5b2dDLzQvUjFM?=
 =?utf-8?B?QW80QjhKaExHUHFYUDhNeFMyUVJUWHhhT0xjdTJuR2V3YkVWRnA0c25LZ0p2?=
 =?utf-8?B?S0lGNzYxRkRNaEpibVpidlNjMVBudVRuS3FCcXRjRlAyTVRhQmoyaXJtR05S?=
 =?utf-8?B?SzlGZ2VxWTE1UEpRYThPcFQyd1NFdDYrQVNWZkwxWkp1aUNhaXEwR1Y0YzBO?=
 =?utf-8?B?TkdIUUVKZXlUN3g1dVQyTGxXdE5MTUQzRUFuN0paNGVVeGlmWmpuaGY0L1RY?=
 =?utf-8?B?elBzbU5mRzlLQmRSdjFmTU9lVnVoL2VUL3psZ25KSWFiRWxNSVhlM1pVa1lH?=
 =?utf-8?B?b1d1anVKMUJjNnc4QVNudWgydGFSK3QrMWVudEV4OHMvT0I4V0RXdHdmNy9H?=
 =?utf-8?B?UWZERDNsZDhZVXZvMGN2ZUlHVnQ1T1F3MXlTWWFQL2pUTW5nUXFJcXB0ZS9s?=
 =?utf-8?B?cDd4RXlhLzVtMGZvRmlQblhSbHVhcy9jWTZlVUxaaDVrNit1Y3B6SExEM2hH?=
 =?utf-8?B?T1IvRmpRekowMzkwOE4wUEFmeDQ2dEF4bE9jaVRGM3h0R0JqWU5SVVdSVXJa?=
 =?utf-8?B?YS95NnlENzJSbmlzeWRIWUt3aFhWNW04R3pOaFltcHJvcVZLU0svWG9Qc1E2?=
 =?utf-8?B?UUQxTnhsOWgwcmJmNDgwUkZ6N2xnK1ZzTWdCMjNlc3hkMXBTbng1aXh2c0Ja?=
 =?utf-8?B?RGFQSTdBcnluenhGVkc5RnVzL2kxRWREVzk0MmNmVHk2SkJjY1VtZUxBRW5v?=
 =?utf-8?B?NkZDOCtpWmhEakZMYWtaQTFVczQ0ZGxMU01XNmtZOTIvTHIzclVmZUtJcnVz?=
 =?utf-8?B?OGkyaWx4OG9qWGkyRDZWWElXVnFzRVZnREF0bEpJcEhKNHFxMFpsVXJXMnEr?=
 =?utf-8?Q?bljOjXeHKNEdi5MGXRgqj9m0c?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26605783-f963-41ba-af9f-08dab5bda214
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 12:45:30.1726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nWCotFrGyAc3uTWovyDcYdgYPUMdzdzMW8bunqT1NJm1vdIxnRjxrmUQ79ZP1SXwJHq039GlNLM1yhsSSG/0jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5552

On Mon, Oct 24, 2022 at 01:19:22PM +0200, Jan Beulich wrote:
> On 20.10.2022 11:46, Roger Pau Monne wrote:
> > Commit 75cc460a1b added checks to ensure the position of the BARs from
> > PCI devices don't overlap with regions defined on the memory map.
> > When there's a collision memory decoding is left disabled for the
> > device, assuming that dom0 will reposition the BAR if necessary and
> > enable memory decoding.
> > 
> > While this would be the case for devices being used by dom0, devices
> > being used by the firmware itself that have no driver would usually be
> > left with memory decoding disabled by dom0 if that's the state dom0
> > found them in, and thus firmware trying to make use of them will not
> > function correctly.
> > 
> > The initial intent of 75cc460a1b was to prevent vPCI from creating
> > MMIO mappings on the dom0 p2m over regions that would otherwise
> > already have mappings established.  It's my view now that we likely
> > went too far with 75cc460a1b, and Xen disabling memory decoding of
> > devices (as buggy as they might be) is harmful, and reduces the set of
> > hardware on which Xen works.
> > 
> > This commits reverts most of 75cc460a1b, and instead adds checks to
> > vPCI in order to prevent misplaced BARs from being added to the
> > hardware domain p2m.
> 
> Which makes me wonder: How do things work then? Dom0 then still can't
> access the BAR address range, can it?

It does allow access on some situations where the previous arrangement
didn't work because it wholesale disabled memory decoding for the
device.

So if it's only one BAR that's misplaced the rest will still get added
to the dom0 p2m and be accessible, because memory decoding won't be
turned off for the device.

> Plus with this adjustment, is
> ...
> 
> >  Signaling on whether BARs are mapped is tracked
> > in the vpci structure, so that misplaced BARs are not mapped, and thus
> > Xen won't attempt to unmap them when memory decoding is disabled.
> > 
> > This restores the behavior of Xen for PV dom0 to the state it was
> > previous to 75cc460a1b, while also introducing a more contained fix
> > for the vPCI BAR mapping issues.
> 
> ... this (in particular "restores the behavior") a valid description
> of this change?

Yes, it restores the previous behavior for PV dom0, as memory decoding
is no longer turned off for any devices regardless of where the BARs
are positioned.

> > Fixes: 75cc460a1b ('xen/pci: detect when BARs are not suitably positioned')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > AT Citrix we have a system with a device with the following BARs:
> > 
> > BAR [0xfe010, 0xfe010] -> in a EfiMemoryMappedIO region
> > BAR [0, 0x1fff] -> not positioned, outside host bridge window
> > 
> > And memory decoding enabled by the firmware.  With the current code
> > (or any of the previous fix proposals), Xen would still disable memory
> > decoding for the device, and the system will freeze when attempting to
> > set EFI vars.
> 
> Isn't the latter (BAR at address 0) yet another problem?

It's a BAR that hasn't been positioned by the firmware AFAICT.  Which
is a bug in the firmware but shouldn't prevent Xen from booting.

In the above system address 0 is outside of the PCI host bridge
window, so even if we mapped the BAR and memory decoding for the
device was enabled accessing such BAR wouldn't work.

> I have to admit
> that I'm uncertain in how far it is a good idea to try to make Xen look
> to work on such a system ...

PV dom0 works on a system like the above prior to c/s 75cc460a1b, so I
would consider 75cc460a1b to be a regression for PV dom0 setups.

Thanks, Roger.

