Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9252E617931
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 09:52:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436161.690248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqVxm-0006ng-MZ; Thu, 03 Nov 2022 08:52:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436161.690248; Thu, 03 Nov 2022 08:52:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqVxm-0006l3-Jd; Thu, 03 Nov 2022 08:52:38 +0000
Received: by outflank-mailman (input) for mailman id 436161;
 Thu, 03 Nov 2022 08:52:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OB6F=3D=citrix.com=prvs=299187ae8=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oqVxk-0006kx-Rz
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 08:52:37 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da65b143-5b54-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 09:52:34 +0100 (CET)
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Nov 2022 04:52:30 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM6PR03MB5018.namprd03.prod.outlook.com (2603:10b6:5:1ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Thu, 3 Nov
 2022 08:52:28 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c%5]) with mapi id 15.20.5769.021; Thu, 3 Nov 2022
 08:52:28 +0000
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
X-Inumbo-ID: da65b143-5b54-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667465554;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=QskB8PMeRAs940sXfZmevqd1rnlBhFvS+0itl91ODw4=;
  b=YVIvK8CiwGajwamUTdHQpLYS4iu9xxOfrzvaqvd7QheISz+IuX7m7FFC
   RxGBcOeYKQRhi9pdGbto99PACOofiEWLrDj6Igf9nM5Eai2HmVmSeayIl
   1etYDo6v27g7F1Qh64CDErLNk/whY+Ec2x6TScoV9pxVGsvBiyBq/5Jxi
   w=;
X-IronPort-RemoteIP: 104.47.55.100
X-IronPort-MID: 84074864
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:PkT9T6utZIJnRr+gCanXYV6HGefnVI1fMUV32f8akzHdYApBsoF/q
 tZmKW+CP6zZYjCmc4wgbdm3/UxXvZTQzt5gTVBsryFhECoV+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5Vv0gnRkPaoR5QaGzCFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwLyEDRAiip+OK8uyYbdg2oNs5D8bTI9ZK0p1g5Wmx4fcOZ7nmGv2PwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjf60aIK9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAurBNpNSO3mqpaGhnWY3zY+VSQ5XGCWrNunimPjReNvN
 k49r39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooL07gCDFy47RzhOQNU8sYk9QjlC/
 l2Um9LkAxR/vbvTTmiSnp+Pti+7MyURKW4EZAcHQBED7t2lp5s85jrQSv5zHajzicf6cRngz
 jbPoCUgirE7ic8Qy7797V3BmyirpJXCUkgy/Aq/Y46+xgZwZYrgYpPy71HetK5ENNzAFgHHu
 2UYkc+D6uxIFYuKiCGGXOQKGveu+uqBNzrfx1VoGvHN6giQxpJqRqgIiBkWGaujGpxslePBC
 KMLhT5s2Q==
IronPort-HdrOrdr: A9a23:E1xKUq+3Z8uIQFVCSqpuk+FDdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdhrNhRotKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtJD4b7LfCdHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaF52IhD0JbjpzfHcGJjWvUvECZe
 ehD4d81kydUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInty6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXkIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6W9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfF/9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmc0a+d
 FVfY/hDcttABKnhyizhBgu/DXsZAV4Iv6+eDlMhiTPuAIm30yQzCMjtb4idzk7hdAAoqJ/lp
 T525RT5c9zp/AtHNNA7cc6ML+K4z/2MGXxGVPXB2jbP4c6HF+Ig6LLwdwOlZKXkdozvdAPpK
 g=
X-IronPort-AV: E=Sophos;i="5.95,235,1661832000"; 
   d="scan'208";a="84074864"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kj0flFnyx018w/3r7rPb9fdRHVJbafwc3s+aO/SD9Fn7+pr4TntxWk8y0IEmjc0g/gth7cBiMEqqmpcQfNB75tZlaJk3Dh5YfOxVXoNsnbgnkuzbLCqNlqXMh4WcHDpIMbO9pD7jUqZSUFdgNSuxkm39uFf9MH1O03a5P5C2dP5x13qIRzTdSNQTOHhYrx3s/spXDcW43xs/fySCoifI2tjy4yWfQ7MVMqwBdAmIMT/sK17PGVzFUKCCAw+PGgetod8ZunWiBdT/wxZwTBe31zOWyEFc0twc87A7OJZjtVfO42pOCV5Gi55uAOc45YAHTD/dQiZ8Zfb6nefGHQxO4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2rTuwT8cYHxszVjf1Bj9Peq3Hqa12vcBCHZTZ11GoQ=;
 b=hEWx/WcxCOmOaVHlDmgEgZrM5KjbokAg8h4ug3JbM8BetyMm/wafGLYD9J4IshMpGAGIjq3CzgrUi1mCVjcF6PR5nO3U0Lyuy58yV/qpqIDCd7RDCTLjK6ARZsUkLSBX/7DEKUXY/g/4czChYiwFvBCa7hOzfFWmaPoc2OEY1qj7Qsa6KTSBq5xo/KaLEJ/t+jY98Oxt1htpMajw9sa9f5u1HHFX/MVgyGr4lkRxpOOkpxxSkJFkvFfvZRGU4UtKv1W/B468Tq4Xm9bM0ZjBaZqqO9ousBiUfXgyz9xmh45PlDDhDizhTdEH8C8b/zf4CCM47UPwIfMP/+5W8KeFmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2rTuwT8cYHxszVjf1Bj9Peq3Hqa12vcBCHZTZ11GoQ=;
 b=Nz9y3tKqoWvGhpCEBI7F7aVkW2ZQGEHghyPl/G02tQDc29s3IoUFWPpircw4Up2u/eqGmQvpJRqEfb51oNchl0E2Unu3S3NWA5rNpCe3fXQh70fQaIYpsXIc06moUF7bDA/HZfEEaiuM2UruVsnQwWV0slpc0K+pAxG/p3eZrs0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 3 Nov 2022 09:52:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17 v2.1 2/3] amd/virt_ssbd: set SSBD at vCPU
 context switch
Message-ID: <Y2OBRg0cpVkgu1iP@Air-de-Roger>
References: <20221028114913.88921-3-roger.pau@citrix.com>
 <20221029131258.95811-1-roger.pau@citrix.com>
 <198d04be-e7f2-dc11-18b7-ef3352d07b80@suse.com>
 <Y2KrF+0ns174JC7S@Air-de-Roger>
 <20869a2c-224e-698a-b927-96d6ad752b9a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20869a2c-224e-698a-b927-96d6ad752b9a@suse.com>
X-ClientProxiedBy: LO2P265CA0292.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::16) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM6PR03MB5018:EE_
X-MS-Office365-Filtering-Correlation-Id: bdb9b41e-0e71-4d10-0a8f-08dabd78bc53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+NG1TNLKJSWdDM8XZ5BcY/HaOs0QVPx4jVJXO3XznURZVeYA16AwmO+0ImD0OqFTkcZoNuEcz8IgaJtXaQGa7zFwBLsCKZ+Np5RiIXJ6DjbwuCHRSD5twz0no3XXAj2VDPJMW+ieuRO4QnxPnhzJ1zWvrv1Mr3+dOSuqRjdd39W78nbKtOUXTcGw8UyoR4/EMZLE1UEC/FzSisZUPryFqUcllfgUnsGYIa6TXGdO4PYDfykWStTydsUeNriOXyiAb3lGPk48LPfFMQapesnGWLMdJTpvugAO4SeZvU1fVqqCS1VnXFgSpPWUOYD6+CLVMfMdKCUN6Dz1LIXkdToZv3IqKGR4OtvgAJZR/4VrAql+gU5Ybf7r0jqC/8OwDnUVl1K5qjq7hEYzTh8LEGZgf0Z1eWda0Y6XttbCzNRcUihuKtWAj4Fl3vsIKSitCJSAj0ChkqVqbdgVbFM7zj1oV3J7ykZlYr0RgteigD1Ym6ukC4Hjqh/C5UGuNEFJlDcYPVLVQiqpgfWnaY26iGgF/dJhzAYnVCRTKCyObEZYIyi9kEirqQGH8B2aRLCGc41mlj2+q7XD/wwim3VFfQFqEn2q5Hdvkb+H3PZvZ14NtN3dzsxfoZelMc7uHUi0e4hSTGiHzF/nW8+57L6/uul4Pf2/jWkicVyaaDA9TcAFAm+VQSsfqtR+w8aCaPws7BhXJpqhB3uHxP7PEsYE7LpbJA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(396003)(366004)(39860400002)(346002)(376002)(136003)(451199015)(4326008)(86362001)(38100700002)(82960400001)(316002)(5660300002)(2906002)(8936002)(66476007)(33716001)(66556008)(8676002)(41300700001)(66946007)(9686003)(6506007)(53546011)(6666004)(186003)(26005)(6486002)(6512007)(54906003)(6916009)(478600001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUVJTXN2Skk1dkEvclljaG5NZ21WQzlsU1BETWxUMTQyZVhENnRwUVJCTWNO?=
 =?utf-8?B?STQxRGprdThLcGhMeHJja1dkODllR3ZSOVVLd0wzYWRLV3U5ZDZzb0FtazRw?=
 =?utf-8?B?OGpjRE1VM2FKN2tKTTVnSzhJL2IwN3JJSDFFalBJOWFycklsOUhuT2F1Q0w5?=
 =?utf-8?B?d21vNGdQUWNUL1BlYUE0OUd5MnJCQ1N5RXRoV3NWRWd4OWNKdHlvTkEzQ0Ni?=
 =?utf-8?B?U2t6R2JPNW4ycElkUjVHbHAwL1l6U25XZjcyamlDTm1mTjFkeW1JNXBDZFBy?=
 =?utf-8?B?YzdSUnQwOVNhTUVnQU80cTB3eWkvc0RQemlXVUJsQmhJeGVoRktZejI4NnR2?=
 =?utf-8?B?QmRpY1A5RmRlYW1KN3FJcWRTTG9YZEl0Z0dqSGN4Ujl6TTdRYUZQU3Y5OXE4?=
 =?utf-8?B?TUhpblNFSDZReDNxRCthdm1pSkdZVjl3VjRaM2w3Vm1FUHRaTTlFUlYyeG9Q?=
 =?utf-8?B?ckQrdmVwMkROM1BYN29VbWlKS2hCOWd5L2tRbVluRDZ0KzF1cWxHYXU4ZGsx?=
 =?utf-8?B?ZUgwcGRmR3k5ZWdlU3FPMzdackw0ZnBhQjJGaGJlOG5MTlRBdlZyVzd6SjJa?=
 =?utf-8?B?SXltYTdUYWhZUXZVMWxEblNlNGI5MWlMdUNwYUt0cHJpQ2YvTHh6Q3crQ0Fr?=
 =?utf-8?B?WE1tNnBtYkJtczVNdHU3YkFXYm9MbjlONC9mSmlYYkU4emlDTks4dVk1WDFx?=
 =?utf-8?B?UTFBRlhhSytFVDlzMXh2M0paWE9mekVzcEl0VlFCUTlycUFLU1A2ZFVpdS9O?=
 =?utf-8?B?RGFVNUlBcDN1SmZ3emhpV3h2OUlxdGRNSmRsZ2JFNkI4Rm94aWw3NWZmbUQz?=
 =?utf-8?B?cEJFOEdKNXBxVEswZndtQzc4eTU3eXhkQ0pERG4xZ3lPY2tCbW45ZEZSNWFX?=
 =?utf-8?B?YjhpTEo5TjkrZGNuUzJVbitZRmgzTHdrWlVMUkNRWU9lbGh0Y2VOTHc1Yk9l?=
 =?utf-8?B?bk5wdlFTdGZtZGdEVXVOblJJdzRqaWx0blRaWmFiWFpvaWJSL2hSa2pIc3I3?=
 =?utf-8?B?K2dFQkV6Rms4dVh0d2lGVC93Z3VEUXZLQ3NMQUZ2OCthajA1WUVNdjBaOHpS?=
 =?utf-8?B?cU9XTlVVckN6REZlcGtyaWlQK09ldldrL1RXaHpjV2xpdFhSRkJySXZQeVBE?=
 =?utf-8?B?eFNIQU1vcGl5VkF3Q2Y1YjRFZnRFbkthVFd3OWpjOWo5YUQ0U3IwcE9QNU5t?=
 =?utf-8?B?ckJibUdJRTJDS2tZWWxXQ1VEdmU2d241WDk0UGFrNE5yRE1DMlp4SkVGK2Vy?=
 =?utf-8?B?VlBKYzNOaFFERXF0RzBtS0U5YTQ2R1BMWDdDK2xwRFl1M2xiVnBKMkRKRUZU?=
 =?utf-8?B?ZzBHTG1TNnRsSFprVFNyV1daY1R2M2w1em0rejVZL3p5YkovYzFETEh5ZkxX?=
 =?utf-8?B?QkRlUDJtcUxQVlJSeFNVeFZNQWg4dkMwQkxybkxJS3ZjZTBCa3lYVko4N3Iv?=
 =?utf-8?B?NmtlM0RueUlYb1ZraEMxUU1ZamhCcTM5NHNHaUd4M1VnakJ2Y3YzQmVtNHdZ?=
 =?utf-8?B?MWlUOW02WFpQcG5GVTNDMllVcFJZSnZEalB0NEl2Nlc3MFZ2Qk84N09JRFVq?=
 =?utf-8?B?dG1EQTVPUURNWUJSWXNyT2syTU4yRlN2ek5HeUFnTnQ2NWRKM0lsR1FzcDVT?=
 =?utf-8?B?Q2ZCQ1B0WWR5c0NTY1VXU0tCczFxWVpFeERPSkFzQmFaVE1acktza0xiYnpN?=
 =?utf-8?B?OTdKZThud0xkaXdDdkJKc1FoM0V5Z0psYzlIMmx5Q25leE9xZWJBK0VJcTcy?=
 =?utf-8?B?OFV4c1pGVVQ1Wk5JRGJMUW1paTJoRDFQelJUM1pUSkFDSHNQM0lWZkY2TmJH?=
 =?utf-8?B?V0lIcWxpTWJwcUpGcFI0amkxZUVoeDFOQmZBOHBkK2NMRHVHYmppWFh2QXVP?=
 =?utf-8?B?YUE3K3Z2TTFrb1krWUtMWHlzajh0dzNKVU81NmRncVMyRXljd05vL0hSL3BL?=
 =?utf-8?B?TzhKRXBkQURlVEUvZnp4cXNzS3g4eTlScGVVKzJrUGE2UGNrNUtvaExIaXJQ?=
 =?utf-8?B?UGpjZVBuRDUrRU50dG9OTUhydFJnZytYOHdMdHlCbGRjcG1VZmZsbW1ic0xT?=
 =?utf-8?B?YWdwdFcrTlVhZ2dZZnowVVFZYTdxTnkvQ0JoUHJlVTN6djJWVUVLSEhVN1hJ?=
 =?utf-8?Q?m+78qZ0yisPt73wGwjqWpLK9D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdb9b41e-0e71-4d10-0a8f-08dabd78bc53
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 08:52:28.2130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2DDy+m05HOk9Z85qOglc1yKIPrBWe6h77dTzUyo1TU6XqCi1BtQqhgmsAn52h6NRYapcz05iSP4G8+PmRDgYTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5018

On Thu, Nov 03, 2022 at 09:09:41AM +0100, Jan Beulich wrote:
> On 02.11.2022 18:38, Roger Pau Monné wrote:
> > On Wed, Nov 02, 2022 at 12:49:17PM +0100, Jan Beulich wrote:
> >> On 29.10.2022 15:12, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/hvm/svm/svm.c
> >>> +++ b/xen/arch/x86/hvm/svm/svm.c
> >>> @@ -973,6 +973,16 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
> >>>  
> >>>      /* Resume use of ISTs now that the host TR is reinstated. */
> >>>      enable_each_ist(idt_tables[cpu]);
> >>> +
> >>> +    /*
> >>> +     * Clear previous guest selection of SSBD if set.  Note that SPEC_CTRL.SSBD
> >>> +     * is already cleared by svm_vmexit_spec_ctrl.
> >>> +     */
> >>> +    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
> >>> +    {
> >>> +        ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
> >>> +        amd_set_ssbd(false);
> >>> +    }
> >>>  }
> >>
> >> Aren't you potentially turning off SSBD here just to ...
> >>
> >>> @@ -1000,6 +1010,13 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
> >>>  
> >>>      if ( cpu_has_msr_tsc_aux )
> >>>          wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
> >>> +
> >>> +    /* Load SSBD if set by the guest. */
> >>> +    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
> >>> +    {
> >>> +        ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
> >>> +        amd_set_ssbd(true);
> >>> +    }
> >>>  }
> >>
> >> ... turn it on here again? IOW wouldn't switching better be isolated to
> >> just svm_ctxt_switch_to(), doing nothing if already in the intended mode?
> > 
> > What if we switch from a HVM vCPU into a PV one?  AFAICT then
> > svm_ctxt_switch_to() won't get called and we would be running the PV
> > guest with the previous HVM domain SSBD selection.
> 
> Would that be a problem? Or in other words: What is the intended behavior
> for PV? PV domains can control SSBD via SPEC_CTRL (only), so all we need
> to guarantee is that we respect their choice there.

If the hardware only supports non-architectural way (LS_CFG) or
VIRT_SPEC_CTRL to set SSBD then PV guests won't be able to change the
setting inherited from a previously running HVM guest. IMO it's fine
to run Xen code with the guest selection of SSBD, but carrying such
selection (ie: SSBD set) across guest context switches will be a too
big penalty.

> >>> --- a/xen/arch/x86/msr.c
> >>> +++ b/xen/arch/x86/msr.c
> >>> @@ -697,7 +697,15 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
> >>>                  msrs->spec_ctrl.raw &= ~SPEC_CTRL_SSBD;
> >>>          }
> >>>          else
> >>> +        {
> >>>              msrs->virt_spec_ctrl.raw = val & SPEC_CTRL_SSBD;
> >>> +            if ( v == curr )
> >>> +                /*
> >>> +                 * Propagate the value to hardware, as it won't be context
> >>> +                 * switched on vmentry.
> >>> +                 */
> >>
> >> I have to admit that I find "on vmentry" in the comment misleading: Reading
> >> it I first thought you're still alluding to the old model. Plus I also find
> >> the combination of "context switched" and "on vmentry" problematic, as we
> >> generally mean something else when we say "context switch".
> > 
> > I had a hard time wording this, because of the Xen/guest vs vCPU
> > context switches.
> > 
> > What about:
> > 
> > "Propagate the value to hardware, as it won't we set on guest resume
> > path."
> 
> Sounds better, thanks (with s/we/be/).

Oh, yes, sorry.

> 
> >>> +                goto set_reg;
> >>
> >> It's not clear why you want to use hvm_set_reg() in the first place - the
> >> comment says "propagate to hardware", which would mean wrmsrl() in the
> >> usual case. Here it would mean a direct call to amd_set_ssbd() imo. That
> >> would then also be in line with all other "v == curr" conditionals, none
> >> of which apply to any "goto set_reg". ..._set_reg(), aiui, is meant only
> >> for use in cases where vCPU state needs updating such that proper state
> >> would be loaded later (e.g. during VM entry).
> > 
> > I thought it was better to hide those vendor specific calls in the
> > already existing vendor hooks (set_reg).  I don't mind calling
> > amd_set_ssbd() directly here if that's preferred, it seemed kind of a
> > layering violation when we have vendor specific hooks in place.
> 
> Well, Andrew of course should correct me if I'm wrong, but my understanding
> of the get/set-reg interface is as described. On which grounds I don't see
> any layering violation here - doing the call right here is merely a more
> involved flavor of wrmsrl().

OK, will change, but first we need an agreement on the SSBD context
switch comment.

Thanks, Roger.

