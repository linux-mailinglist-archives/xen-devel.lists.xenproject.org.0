Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38982771DBC
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 12:06:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577976.905133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSx84-0008TI-0F; Mon, 07 Aug 2023 10:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577976.905133; Mon, 07 Aug 2023 10:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSx83-0008Qf-Tj; Mon, 07 Aug 2023 10:06:23 +0000
Received: by outflank-mailman (input) for mailman id 577976;
 Mon, 07 Aug 2023 10:06:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ru+M=DY=citrix.com=prvs=57627f799=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qSx83-0008QZ-45
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 10:06:23 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0dbdab10-350a-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 12:06:20 +0200 (CEST)
Received: from mail-mw2nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Aug 2023 06:06:17 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5373.namprd03.prod.outlook.com (2603:10b6:208:19f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 10:06:15 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea%6]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 10:06:14 +0000
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
X-Inumbo-ID: 0dbdab10-350a-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691402780;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=W+DEUMy/+zVWnbBSCdxkpH06J8q7LflxKMggumUMdpM=;
  b=fKOMvQzmpr4GramjFpV6XuilObkgtzVeO1wQxLRhnR3p520Vh316ZqVv
   xQqtBenASs9msIx8p/kDKeJukkQ1n+6t3K1EPcLLY695vEN7w+75k8j4b
   rto9DXoRGH9bVUW7gGfnVpE94kXIv4LWlIan2CDqDXA0VFbydCBdcDp9L
   A=;
X-IronPort-RemoteIP: 104.47.55.105
X-IronPort-MID: 118584614
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:37v0EKoeosql6muRwoCsuGKZx1ReBmL6ZBIvgKrLsJaIsI4StFCzt
 garIBmPO6yKYmSmftkladmz9h9T7ZCDmNQ1TwU5rCxgRH9B9ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weOzydNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADEEaAGprP6k/IO+YNdT3vgBIvX3O6pK7xmMzRmBZRonabbqZvySoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeWraYKIEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhr6430AHNnzB75Bs+TEf4oKiVsVCCZddjD
 2ES+g90gI0p3Rn+JjX6d1jiyJKehTYHWt9XFcU77h+M0ave5wuFBmkCQSVFYdZgv8gzLRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBsZQkP7sTnoYozpgnSVdslG6mw5vXqHRngz
 jbMqzIx750WhNQO3r+2/njGhSytvZnDSgMp5gTRUXmh5wk/b4mgD7FE8nDe5PdEaYOGFF+Iu
 SFcn9DEtbhTS5aQiCaKXeMBWqmz4OqIOyHdhlgpGIQ98zOq+DioeoU4DCxCGXqF+/0sIVfBC
 HI/cysIjHOPFBNGtZNKXr8=
IronPort-HdrOrdr: A9a23:In3Xa6HGiWxckGW3pLqERceALOsnbusQ8zAXPo5KKCC9Ffbo8f
 xG/c5rsiMc7Qx6ZJhOo7290cW7LU80sKQFgrX409+ZLXXbUSiTXfxfBbKL+UyeJ8SGzJ8i6U
 4DSchD4azLfDxHZJ3BkXCF+r8bqbHtzEnrv5a9854Kd25XgspbnmJE42igfHGebTM2dKYRJd
 6z5tdnuzHlQngedMK9b0N1JdTrlpnklI/GfRVDPBIs6BCPgTS0gYSKaCSw71MxUy5v3bxnym
 TOkxX46qK/99m3xwTRzXW71eUkpPLRjvVCGe2RgYwuJjLghh3AXvUYZ5SOsCopoOam9VYtl8
 OkmWZRA/hO
X-Talos-CUID: =?us-ascii?q?9a23=3A2GQ49Gk9RHuuwvJX9G+CqxaEpk7XOXzUymb6CFO?=
 =?us-ascii?q?qNVdsYoOqEWOy9p94lOM7zg=3D=3D?=
X-Talos-MUID: 9a23:5ZqnpwTFHB8GMgOCRXT1mHJjZetT/ZiQDXwpvJMGnpOpEDdZbmI=
X-IronPort-AV: E=Sophos;i="6.01,261,1684814400"; 
   d="scan'208";a="118584614"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPCiNR8Tn0D0D+9WSXr3AmbBD0b2lMWf9aZwt3gBo5YcYSUV9I91eDNCS2Fo089eM+I2cJ4x9lyyGTebsERKEIVVjZPPDeVIzWp3GwErpMGFB1q9o2w0vhedNQmz+2CVCemKsIoGvIjY0EYP2IKbysJ8Ek8fhkZQXOxv3SDCF5gZT5PxbJylhaca/k8KRfGDjs3+ymEB+rbJYwUGc48I9qhthYoUcRSi7CiQUgBDcn1XKf1nq9rTpiwjOH5g3xR9v4WCePysPKHWJqHjNqWNFba0/YH66ptjozBLvVZnmS3Eclw82Xzv3NwX/26HcwKiaqgICIr9d+HprYbJg9swxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Y8nVWJdUc/lyHm/tgeOSEdjT7RtdH9eMDYPuqSa3rE=;
 b=kasr89fgBSzQyHpKIsQhLuqt1+6U9wvUQlXWKMhWudNyLwHYsfOdTwaInZzsKrtmakGuhgAEp8nedGwXQcOUskTCTNyJcQPlP8WHutakh7CGw3tjltYSy912hgwK+T+lUi5xsQOHQfVf2VStPeRjh5tTeC3AYpVs5pclS5uHzqLbfbSIafJh3ccFkaZHoSSOxYVH3Bh3HyUQ14mFIo8cRHQqFagh68SndpPCAX8861A3SSMzWnLTK/hfobQsA6y19KA2GbZtBlXkF7g8vg6+TKRKpJi3+RSGPvQpAjUd4DVo5iguoFC+B3SbmD5gMwVxcpRtgmDpF5LSyah1wUtmiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Y8nVWJdUc/lyHm/tgeOSEdjT7RtdH9eMDYPuqSa3rE=;
 b=pX9psLePvylfnLfxiOpsb9/O650Ev8UgJdCUA/FF0ynlACiL0LjdX7ZsPcQ01xgFhDfWdJL+j33FBDV1f2T5cOhBLYIvCGG9ZdoZOu7tW1sLm9YRof2TfNG49Tuh4TEFExXK+wJOLfhfh9WqUntS+s/mmOi0Kqo3iOMrYpeSugw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f6bf4dc4-5ec8-866c-3b54-c3584c407cc2@citrix.com>
Date: Mon, 7 Aug 2023 11:06:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Simon Gaiser <simon@invisiblethingslab.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <d5a99971-059b-022f-1b17-ca22431fad4f@citrix.com>
In-Reply-To: <d5a99971-059b-022f-1b17-ca22431fad4f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0048.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB5373:EE_
X-MS-Office365-Filtering-Correlation-Id: cc926c3a-9735-4992-4b1b-08db972def48
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Tmzru0sk305pZeRVnMtMXuZBXkgxf0nDh2lLSnFfPt54mIONBa8eikQr5xE+FzYEHBMt+X+gvlO7e8TfTdZgxF3xL2x3BIpfqthTmrseoOAwssuLJG/jX9dCoEh9MhjgA+eeEPAx0Ekfgy6+RxYBWnCKLEdYso5ciipSaXQo4xl3rdhaqvsOCcD5vkinFJ2+iM1o51ZIcyqRoqaOkrJlqG+YtSv5GGYcnq7GkEFooZQSZU79E9KeHPwre0N/dcBhRkXWmX5lwALCm7vgXmnkIqtu86xG/SZvK7VXCsCUagodzc0kpTwwt7+nR305WiWsdCqPPoiv7HFF9AWGW6Wwpwcy0pAzxcmq292mTlW3JY/NDWcWcJ40XIINGjXrSdqd4psTaT5nKM/sH8n4Q4Gip2EdXQnpWv8OjIt+aoPXRpvFEfr3y17AxUjPa9XJtTf/2RhkWg/gjGAvObpJmphEE1gjpO3lKdjNgIYRP2y8txJLJWAPbBx0CM6Htn4VnEwv4hKClma7R2cYQrDrE4r4YOZOHE+5eALIMYHpFYq264sTGZySrEL3Dt9MlTymSTK+gVkaCt4eSRthisoZmZHCH8DWjgnP/Ea6pur5UHDX0LlZmwBqd/BqlmbmPNq6z1k7uPGLjgq8Uz8YtCi1gl20sg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(451199021)(186006)(1800799003)(2616005)(36756003)(966005)(6512007)(4326008)(316002)(86362001)(478600001)(54906003)(38100700002)(6666004)(66946007)(6486002)(66556008)(66476007)(31696002)(53546011)(6506007)(82960400001)(41300700001)(26005)(8676002)(8936002)(2906002)(83380400001)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEJNUnowb3oyVk1BZDVIbFBuRGFHaWcrVjhSdWhickJsbHFCaEpLK1ZqOWhC?=
 =?utf-8?B?Tld5aWIyV211TVdnQ2R2NnlkUjNEOE1VZEFGSGdyVnJpcExPUlB2TEpmZ0hr?=
 =?utf-8?B?b2xUVmpTb2dURE9sUGozdVRXSFZGQTY4c2FpSmZXdUh0L3JCUjRsTFlZczR6?=
 =?utf-8?B?M3dHRUVnY1kwVXhYODNVMmNJdGJtajBBM1NPdHVFWXJ0eFlJQ0Z0NTlHZEhV?=
 =?utf-8?B?T0pDSnFkZzlvMzZPbUh2TUt2M1lkd21uUXJKZDVUTHVnMzQ1N3ZlM3JPclN6?=
 =?utf-8?B?L2ZZSXcxRXE1R3JYRmtHdDNlWlVUWTJCVnJsai9WM1dtWTd6S3NCSUtwbFJC?=
 =?utf-8?B?bFNOS0pnRGtKZEQwYnppR29McVJzMEpzVmh3UUMycDcwanNFUTZCRnFIL2Jt?=
 =?utf-8?B?NjFVY1pXYk9PayszR3U5WDhOV3djbllFbjlRb2RVb0N1U1N3MmpMVTZSa3BN?=
 =?utf-8?B?MmVrTXdrWUdNVStiaHdvWlVLSDZzSlJtbE9IejZiWlpXRStOSUp0bjJyZjFL?=
 =?utf-8?B?clBMckxrelNGOFRRc3RtVm1ScVZrZklzYkFKczdNSXk4bmQvY0ZVYUppUk42?=
 =?utf-8?B?cjRmRU9iQUJBeUpic0l4WEVsb1Z5YXJ4MEhpbGM0ZEtlV3RUYS9UWDVXZmY1?=
 =?utf-8?B?LzgreXY2S045NHpWTTNtNHpnL0ZkRGxwSW95NlhUc3VDMjEzT09tbWpGK01j?=
 =?utf-8?B?U25jNkxLZFR4MjJpTDFyZC92ZDcwTUp5cVhLbDBqS2FLVGc3aG90QlRPc0xi?=
 =?utf-8?B?NStwZ1Rtb0FIbjZoN21vWnEyempBV2JEUG1ZMnJsbkhxZjFlQzlPV0tMRWJG?=
 =?utf-8?B?djArS2tYVGFYNWlhVGN5dDhHQ096VmRkQmRoOHNiZ0pkMmVLeEY3dmdtbWUy?=
 =?utf-8?B?WGxBbWxsOEZCRDRSM3NxekVoVEYvU1NySWVUR2xCcy9xcEhhZE1DeHVEL0Rp?=
 =?utf-8?B?SFRQK2JGYlQxWEtuYVlkZDdpOUlBekVjL0xlN0xVNzhoR1l1U0dtMzdLVU5S?=
 =?utf-8?B?UHhLM0JqUmFKeVVnMkdNbGRPbUNvVWk4RUtmMHRMY0FjRndtek5EVEZoVDRB?=
 =?utf-8?B?di9SMERtQlcvdGtEemdJNzVlSlAvRE11T0VrSWNqcG1adjlFTW1ZUWhON211?=
 =?utf-8?B?aFloNzRnOGdBR3Y4Si96WDA1dzBnUElRQ0s3QWZEWk54TmNXU2tOQWVGc1Nh?=
 =?utf-8?B?bFlXZjREWFh4NFZobmYyenlPQmpMOERlektrTUtENitxdzgvOC9hZ0pVZHZw?=
 =?utf-8?B?YWJNaGhVL2JhQUU3cEpnVkpMSk4rZjAxREZKZVVobmhZd2lXd21xOE50TC9h?=
 =?utf-8?B?K2xObDRjZVBDOU4zbWx0ZncwVWJ5bUgwaXNILzdOcmhLMWoraDNaYWdzcEpK?=
 =?utf-8?B?OHBMR3VmcVVDT29hNWR2VGRiaEEybzcybzRFRzRKTi9YSFJKVGRMRi9xUWlF?=
 =?utf-8?B?aGxyTGcwL29BQVFRaHhuR1VjVUlTTzlEMzBUWjlNelNYaGNnQVFFczVyK0ho?=
 =?utf-8?B?UURBbUo4WS9pdnQ3bkFSMUtGWUtoMVVRb2x3QVNqZGU1aS90TVFSVFJwVkdZ?=
 =?utf-8?B?UnA0TEtFa1g3b2JFVU92WHFhcTJaSUlQalROTStNVW9YRlVSY0wycml5cUhl?=
 =?utf-8?B?Z1B2cHJzSWRidWhhY3dGZmFXdEt3MDBhWHMvdFUrbVMxQkNyMDRPb3JXWFkx?=
 =?utf-8?B?aTQ3OU9INGRQdzJRMkI0QmVwV2ZNMVk5OVVvVXZHbklYbmdUeWljc3l3R2M4?=
 =?utf-8?B?ZDQ5TCtONlRFOEhWSWZtZjN3WkpnYUF5ZFVHTVVybklVRDl3QjRQRTBHMXJp?=
 =?utf-8?B?bTlPQ1NlZkVBT1c0SmZWSy90UW9sQUZGc0J6R2JueFY2L0pSOXRhaDJSTE9V?=
 =?utf-8?B?c1JJYm5LOUxST0VBZjFQZGxuQ3VNNzg0WWdib2czVjlvKzB2YjlnMHNqNjFB?=
 =?utf-8?B?aEhMdlVKU2p2ZGI0TGFsWk54RXd4V0V3cmFGVlhhWXlJQ0NuNXNPdHVCUW9U?=
 =?utf-8?B?bGVPNXdobjRhNWIvUWNoSnl5WnlGY3ZjZzR4Z0xybGYra0pxd3JrTnJMdkR4?=
 =?utf-8?B?bXlFTnU2dVh1ZUFBeVViemN0NDRZZ1ZESlhqSTQ3RlJuYVYveXluSDlQTmZY?=
 =?utf-8?B?YVhtNkpiNy9JTzV6UytMNUFYMmIwQXR6d2pJSE03b29BM0lmQ2JHTGg3bXpE?=
 =?utf-8?B?N1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eCg877mIBYUfAJMsVLy2FBYSrpHOeDH274MqF4XqBn5vmm58JNbRqXK8CMzdpyOQR5vmJKOxtsPeEnCfU7V77JwLGyOT9WCYHKxdK5b+l7999dgMK9Tz3iOQAZeiAX4VNfd41+0scDu2RVFxSCMPcHmTxcjT6LOISRKlrG5xbnjPo56SlC11fJxMRGl9Qyr1d9h1CATAoWO0Q4t+l+qB0wHOJhDix9peA9Yfk8x6GLqFjZjmNqSmCQZtCZ+Qur5nT04MZLaJEcYJ5tKAF87oUN+3jj74ZMOJaU0sXjpLxa1QZBO6IsNXXKZPEQxZNiqwbctC7HjP/2Saaba3yOS0z995ygROwsxB+NpXI2shMuPr2eRFrHVzTLcHIRlVT8WSohQQvcU1PWwFH8fzMXEMkCSP9tsRhkJCG/HLQ+Kql2KBXAZ9Suk6a+LoQqQyfoCDKfAH/bjPWKdRQIVb9gVjHCr7g4QpwsIXtDWUJPDzSIK1sXn0HOlODP+1AC2dlzRqroB7veiKibewkdsgJmQeZ+F5TzU/aKeCB/IvqbZCCmmh18B/kf6DuNesxwj1Z/OVbu+yXfN2QmRlVIdqy/ZqGORBU38ymrKM8dgUEkqYxuJjMRUBFyyFmeK6aqZj9u2WEE3aX13JiVwr/a1zt5VOHl1AsXcnZ/cYaBzGojHMJDNjTW2ntuF30PrfVkhUECLj2Ljkg1fkhKHAUKuJkudMMkRXc51RGsH6oIn9xo8JEp6r2HM7xYvxDwLEN3R4ZMV7hPRpC6yI2/uMYec1qeFd6HHzNn2f+yxkhvbFl/vNsCqRBTaRzgrM1bLxt8Fxs69wboeAe5IhSJL4yQTCNf1RA0rhAaC936OG7CYGO4kmrCmYV37hi0mGPo28PpaSIAHd
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc926c3a-9735-4992-4b1b-08db972def48
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 10:06:14.9245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2oE1MCyzq1QtP1+VMjn5ckFyLxeEqtHqLVJ7ljjhhoJUk7A1SQPUtKtZXQ9IVWsncOlQ2S8+FVQdZXwDmiySkNtYiB5RdbU1/c62evGvmo0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5373

On 07/08/2023 11:01 am, Andrew Cooper wrote:
> On 07/08/2023 10:38 am, Simon Gaiser wrote:
>> It seems some firmwares put dummy entries in the ACPI MADT table for non
>> existing processors. On my NUC11TNHi5 those have the invalid APIC ID
>> 0xff. Linux already has code to handle those cases both in
>> acpi_parse_lapic [1] as well as in acpi_parse_x2apic [2]. So add the
>> same check to Xen.
>>
>> Note that on some older (2nd gen Core i) laptop of mine I also saw dummy
>> entries with a valid APIC ID. Linux would still ignore those because
>> they have !ACPI_MADT_ENABLED && !ACPI_MADT_ONLINE_CAPABLE. But in Xen
>> this check is only active for madt_revision >= 5. But since this version
>> check seems to be intentionally I leave that alone.
> I recall there being a discussion over this, ultimately with the version
> check being removed.  IIRC it was a defacto standard used for a long
> time prior to actually getting written into the ACPI spec, so does exist
> in practice in older MADTs.
>
> Otherwise LGTM.  I'd suggest dropping this paragraph as it's not related
> to the change.  It will also help if we do decide to follow up and drop
> the MADT version check.
>
>> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f3bf1dbe64b62a2058dd1944c00990df203e8e7a # [1]
>> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=10daf10ab154e31237a8c07242be3063fb6a9bf4 # [2]
> https://git.kernel.org/torvalds/c/$SHA
>
> Somewhat less verbose. https://korg.docs.kernel.org/git-url-shorteners.html
>
>> Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
>> ---
>>  xen/arch/x86/acpi/boot.c | 14 ++++++++++----
>>  1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/x86/acpi/boot.c b/xen/arch/x86/acpi/boot.c
>> index 54b72d716b..4a62822fa9 100644
>> --- a/xen/arch/x86/acpi/boot.c
>> +++ b/xen/arch/x86/acpi/boot.c
>> @@ -87,14 +87,17 @@ acpi_parse_x2apic(struct acpi_subtable_header *header, const unsigned long end)
>>  	if (BAD_MADT_ENTRY(processor, end))
>>  		return -EINVAL;
>>  
>> +	/* Ignore entries with invalid apicid */
> x2apic ID.

Oh, and I forgot to say.  I'm happy to fix all of this up on commit if
you're happy.

~Andrew

