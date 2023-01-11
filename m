Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 014C7666547
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 22:06:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475710.737506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFiI2-0004wk-TQ; Wed, 11 Jan 2023 21:05:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475710.737506; Wed, 11 Jan 2023 21:05:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFiI2-0004tY-PS; Wed, 11 Jan 2023 21:05:42 +0000
Received: by outflank-mailman (input) for mailman id 475710;
 Wed, 11 Jan 2023 21:05:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SHza=5I=citrix.com=prvs=3687a0f96=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pFiI0-0004tR-Q2
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 21:05:41 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b16e78ef-91f3-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 22:05:37 +0100 (CET)
Received: from mail-dm6nam04lp2046.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Jan 2023 16:05:15 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5477.namprd03.prod.outlook.com (2603:10b6:5:2c4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 21:05:13 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 21:05:12 +0000
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
X-Inumbo-ID: b16e78ef-91f3-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673471137;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=HAvb2Mg1S0uuzH1onFjGMe88MbP+3GiSjiHHn55VMlw=;
  b=eN4l+iinxuUzBuamNQVbVsDEiqPnWpDUzFnRss4JR6OH4X5upnUBGprE
   66R9TYcPATRdSF+QBgJZvnbsenm7qaJFjkDARP6g4DwAg2syPQ0lPRbRi
   CJX3XZea3lWQeEHCDmrgRe650WiJ4wuagqaHjsDF4nekJMXGEjJUjbk73
   E=;
X-IronPort-RemoteIP: 104.47.73.46
X-IronPort-MID: 92616230
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:pRP0A6LKfUcMfgJeFE+RKJQlxSXFcZb7ZxGr2PjKsXjdYENSgTIFy
 TEfUT+OPP7eZzDxft9/bdzg8R8FvcfUydMwSgFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mhA5wVnPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5mD1ENy
 qEGMwlQMEvAvqWmw6+LZrlV05FLwMnDZOvzu1lG5BSBUbMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VspTSNpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eex32iBthJTNVU8NZb2QyexzceDCYVD1uRiOuGtRWQWO5Af
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpatYrqcs3TjwCz
 UKSkpXiAjkHmL+ITXOQ8J+EoDX0PjIaRUcZfjMNRwYB59jloakwgwjJQ9IlF7S65vXqHRngz
 jbMqzIx750RkMhN0ay49FLGhjuEp57VQwpz7QLSNkqm4x14Ysi5ZoWuwVnd8ftEao2eSzG8U
 GMsnsGf6KUCCM+LnSnVHOEVRun1ubCCLSHWhkNpE9857TOx9nW/fIdWpjZjOENuNcVCcjjsC
 KPOhT5sCFZoFCPCRcdKj0iZVKzGEYCI+QzZa83p
IronPort-HdrOrdr: A9a23:8EEw46yxh1stJ6KsbVSJKrPxAugkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMUs1MSZLXPbUQyTXc5fBOrZsnDd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadv/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2jnC6l87nzFjmfx1M7XylUybkv3G
 DZm0ihj5/T882T+1v57Sv+/p5WkNzuxp9qA9GNsNEcLnHBmxulf4NoXpyFpXQQrPu04Fgnvd
 HQq1MLPth16VnWYmapyCGdmjXI4XIL0TvP2FWYiXzsrYjSXzQhEfdMgopfb1/w91cglMsU6t
 MI40up875sST/QliX04NbFEztwkFCvnHYkmekPy1RCTIolbqNLp4B3xjIRLH5AJlO/1GkUKp
 gpMCju3ocOTbpcVQGAgoBb+q3qYp30JGbcfqFNgL3O79EcpgEF86JR/r1iop5HzuN/d3AM3Z
 W7Dkwj/os+MfM+fOZzAvwMTtCwDXGISRXQMHiKKVCiD60fPWnRwqSHqIndS9vaCqDg4aFC7q
 gpamko/FIaagbrE4mDzZdL+hfCTCG0Wins0NhX49x8tqfnTLTmPCWfQBR2+vHQ6ck3E4neQb
 K+KZhWC/jsIS/nHptIxRT3X91XJWMFWMMYt94nUxaFo97NKIftquvHGcyjb4bFAHIhQCfyE3
 EDVD/8KIFJ6V2qQGbxhFzLV3bkaiXEjOVN+WjhjpwuIaQ2R/5xW1Iu+CWED+mwWE1/m71zel
 diK7X6la7+rXWq/A/znhBUBiY=
X-IronPort-AV: E=Sophos;i="5.96,317,1665460800"; 
   d="scan'208";a="92616230"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKTT/sluGpc0hw0VdTyxzbS8NC0aVlYy8NO1NnfTAUn8UMQHh59MiSGRsHGqTesHZa5uJN93HFURMLiZrlAcPHoIiN0ngTN/obGMISM+eyNnLEMgkeSewFwMKLfPCtRwGTei3b+htU0cuS5ZAPrTjB2+lbF0aeWdxOXAAEPU9CVYzENLflersyIpwvJMoRkCKByQId8I6xmNtC/p/mdyZ6fvQtAlo5yTjkeYLOKR7ak6VaMjuIfHTYRU8p/0CL140WFxU0SVGtXi/puyOOgmvVG7PnLBSzqjhvLQOhlAvYcUSlNGm9en1XbBAJOCgq8359TyXPiur9SCy8ZWL2c5Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HAvb2Mg1S0uuzH1onFjGMe88MbP+3GiSjiHHn55VMlw=;
 b=C3QcbFnDP7NRP1TmWbFtPUcieeXF+o59O/KxfJhHF1nrlNhmaj7eQwln8AURsJ5y8af399MK2Y0ALLg9fJ/fhn62zNPBgp5VoqO18UZRag8uuR86XBGjvLg0qy/4XNyvqC9//XeyGihzlHVGpNYYVWqXR9m1ZH9SDpOwSgf/QlJWyqCXJ3+qSOI+thx02QrqVbi0J73R9n0qoUrroxhmGdqdnGAdveOVswba4jNeVN+ItcylDylKUPb0qOuJ2dHi6fzyzuB7zTDWketAO9Y6s0GtDcviPm/vD6CGTx1LvxX+amhXXq7aS3zjahCPm5W6VQZn4zNcw0dKydXgbPqS3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HAvb2Mg1S0uuzH1onFjGMe88MbP+3GiSjiHHn55VMlw=;
 b=hQIoaWbSIwzd+cnLZ6CgNa2Hh3Gy6n81GaFu7s2OnkNRs+P0uysFZTPzwCG2ocz+Aqs4GegBS4+ugsOihY2/bwNgKmUTkldfjZfJmISeWFj2grS+1uwea5U+eHyExWufqDfiyFmcpL65P244oPYVd1brcP+MYkyIg7bz27U7Ny0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>
Subject: Re: [PATCH v4 3/3] x86/vmx: implement Notify VM Exit
Thread-Topic: [PATCH v4 3/3] x86/vmx: implement Notify VM Exit
Thread-Index: AQHZDxB+OJsGEBOWPkStgY7+/Eiq966Z4qgA
Date: Wed, 11 Jan 2023 21:05:12 +0000
Message-ID: <553cbd97-f667-1549-4374-9385d3d53710@citrix.com>
References: <20221213163104.19066-1-roger.pau@citrix.com>
 <20221213163104.19066-4-roger.pau@citrix.com>
In-Reply-To: <20221213163104.19066-4-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DS7PR03MB5477:EE_
x-ms-office365-filtering-correlation-id: b032f9af-70fd-4ea8-e5cd-08daf41787f1
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 aVLU/RA1iQaUX2Nu4UcxgwLOA2teLb6SwagstNjBlVNXQTDRpyAtgAIPkX2FCR1YeSyLBuniUd4a7s/SH+l6hDJz1abEDb8Zq/irA++A+xsUopEFiSxfuv8vQ1pOyMdN5MFhBcvz6JS03wuo8WVr34CtOChr0bWI8wdemHHhoUPJdUZqtFho9UUF2twGcj+BSrtsGTi3uMLW2SdEIuVQ7Lk+QPC8DoDfjIZjYlGLQZWDQTh48VBY2s9lYhXxY04XvNjZ3Ubh9Pq/pXM+F6+AnPY73zBbPGOTRyzkhQGrGuotaRW84zjfgTpPHd/tv/u5W5Fr4LKafj6cSmEKVhZ1u5jHXBIih8one71rlelD2qDUCHRfHQwICU89KGOpBbLVU6xK57B1jW/tp/l+Aaj7sgSLj/Cg/s1lfkdbYk84WWGL1ZSo+Uxd21ceQwOI4idtu5WnJ9W6FoyeaONdsew+HSMLVJftdt45jDbBQiQJGReq9YSvWYYRWNg+b+tvY5yLd08jlp05Xvw3AzRNvz/iJ6kAEu7+9BMNKZhTb/wVef5dFLD2sw3DVi6Iwk+Ydl2xdp1Qly1AichUiZ7nidGFR5RLCrUU5dH/6SDZAj7qraNPaCUCJ2xJPy+FfvR+vBT4i+T252x7ypsKhwqL1XMZgzAV84Sl2eyppYCvXuMdEqQ0SaZ9smBCgU6hogwm3+b6n/l/FDuQTd/NWKvSoHlCbl5w5Wejuj9HuYbIBluG6fZ58+qb0s7n44gL1mzlGc5iN5VgWhDlu2Sfp+Tz3ILn2g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(451199015)(8936002)(26005)(2906002)(5660300002)(71200400001)(41300700001)(66446008)(66556008)(4326008)(91956017)(316002)(8676002)(76116006)(64756008)(66476007)(66946007)(110136005)(54906003)(38070700005)(6512007)(122000001)(2616005)(38100700002)(86362001)(31686004)(186003)(31696002)(53546011)(83380400001)(36756003)(508600001)(82960400001)(6506007)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OXBrSnNvLzFDenFTTEVhbGxFd0M5ZEJ4OCthbjFsTVdrYnpaM2h3R3NaN1ky?=
 =?utf-8?B?K2VUcThiRmN0NVhsYytOSW9jYWZYQ1R1Vkp6RVJ0RG5Sbm83YUNQb3NIN0NW?=
 =?utf-8?B?MzZsdzVNdmx1dncwREQ4bjdURGhSWm1yakJOSFExd3lwT0tsL3ozOWdVazNu?=
 =?utf-8?B?OTdNblRCd1RhSXRXdVpsNC9SWTROK3BiMW5YS3dKZ051bStvL2FvNjQ1ZVJ0?=
 =?utf-8?B?TmF1T0dvMFc0VGV4eWNVSlVwb28zcmpwM0s0VjIyWjltaW9JUENML3BkZlg3?=
 =?utf-8?B?TjJRNEwxMXQ2QlI5cmtReFRpTGZKY1NaOFlnNXlONGRGVGY4d3kxd1ZDWGJT?=
 =?utf-8?B?dlB1YW5xdVp5YWRCaEdUZVpEK1E5WW9QMWt4aHRhb01LREhrdVBETHhWbTZC?=
 =?utf-8?B?MjNUTDNiYW5yMDZHUXZlZ0RETmkvMkpRLy9CQWdTNnNkV2cvSjE1bGtVSTFL?=
 =?utf-8?B?MmJpMHE3NXRvajIrWmV5MEVWdzFWaTB5MmQwNjRNRWViV3hlUWE3d3NvdHND?=
 =?utf-8?B?Mms0cGMrYjRMaDQvVXVPVTMreDZOcHlPZ3BiczRJdEdlN3RiUnJJNEFVQ0pk?=
 =?utf-8?B?aFozd2NscHNhSFlQSlQwVyt6T3oyZWMrOVlZbGwrdTgwSDBEMGNkdW1TWGhF?=
 =?utf-8?B?SWNxSlNJQktYV2VNTkhYVlQxQVVGN3BteWFrLzIvWVYxNU1xck5qNmdIYm9Y?=
 =?utf-8?B?TjNmYzF6TDBVNXpMTko3MmdJQ1FJTGxJTmJzRXVwckIzSWdHMmlNQ01NY2dv?=
 =?utf-8?B?Nmd2b1QwWWdHaTAvWmdiakRXaTFNRU5YdVNJUzdHbXc0MFk0enRBTkFnL3Vx?=
 =?utf-8?B?TXNhNEYyQU5raDgrM2NDMmJtaFhvVE92ZXFxYVZwSFZpeC96djdhVDFSQlRl?=
 =?utf-8?B?VUUzMFZSZXI4WTZWZEVSalByWXNYcGVnZ2dnMHhYR3dQU1hEcjNJREtmV0Vl?=
 =?utf-8?B?QkFVdFcyQ2MveEVhYlBzVUZkQ3hjWVAxTzRLc2ZyNzlMNllQSGpDd055b2pE?=
 =?utf-8?B?Q1Z6ZEF1YmpSNTU2ZUpMWVVEbDIwaUthUk1QNzdYKzgzb2ZpS2lsbExFbkUx?=
 =?utf-8?B?VkMxOENYeUFpWUxiMXN5ZjFIdzIyUFlvUGI2djVMTmltallSK2Q0cnJCSm1G?=
 =?utf-8?B?aHVXVVlPei94NmdXYnlMUmp2WlNHYXJ5bFFjcWw5ekZEU0ZPVTlpeFJxM3pV?=
 =?utf-8?B?aEtaSGpkdHRJQW1KWnJDK3VOMmFHTG9FcGF6RC9sTDVBYzlKR2ZhVmE4UE9u?=
 =?utf-8?B?eTZEOXJEUVFkdjhrd2pESWFFM2NyY3l5T1JmY3Y2OEhwR00wdFpUUGpycXFG?=
 =?utf-8?B?YTdWTlZTSzNTejhORGZKYTVxNzJ1c1J3STdTaCtmeG9FUzBOZnpMdkVSem9t?=
 =?utf-8?B?TFV2d1FVSDhTMXNGSC9QVTlsWGpSV2R5cXZqSFFDSEIyZ2h0SklpR3djSGUw?=
 =?utf-8?B?T0lYVG9YV3lLYXhGMVlYQ1B4OGw2M2xuQUw0V0xpRnRDNUtZLzFSY2l6dUVp?=
 =?utf-8?B?ei9JbXlUTE5KVU1MQmNKcmxSd05kek1ZTGxmcS9pZU5ad1VoZ3ExUFBEbzNO?=
 =?utf-8?B?SXhyM1FwbDF2Q0VnZHJOSWI2S3pMQ21WaFNNUzlkQ3VyVTAxaGFKdk9JNEhC?=
 =?utf-8?B?SlpRT3J2dVFvSkVwRGxTS25neWlJQU8zT1NZUElRekcyNkZoRlhKQ0FtY0Np?=
 =?utf-8?B?TGtCaTFYKzBXTlh6ejlLNU9hNTFSZEE2My9yZFpWeU82b3NjY2l1UDBTTVdt?=
 =?utf-8?B?c21EWklTc2tVVmdiTlIxWSt3MkVPK1NXL0t0d3U3RnhIejgrYW1NNmEwcXBX?=
 =?utf-8?B?WTJGT3k5a3kzNVExZ2dXOHhQRndaTTNaMmoxUnFXajMvNHR2QXlZLzZtT2Js?=
 =?utf-8?B?RUdxaXhudURMaWtwK3gxTVU1Zkw5OHZndEY3dmZaamxhdTZLaGZ5bVpOWWIz?=
 =?utf-8?B?eFAwcTJzRFVscDAwdUZ2U3ZjM1V1NEY0NlgwVXhFbmJ4UFNIYkp6aEN0ZTZQ?=
 =?utf-8?B?dExTaE5Fb3JWOC93WDFjVjEvK0IrdVhPd2pwSDgvS21SMkJPTEJMaDl1aG1h?=
 =?utf-8?B?NThMNmFZSmk2OXlIT0Yvd2VnVkcvVUsvRnYwampqZThYT1pIYmRSVmZxOUdN?=
 =?utf-8?Q?/xlTf7AXiHPfFZ5HCizSzFiPK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F69D438D5FF51349924DD3D90546B49F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	p+BhTnAM7Xns3USDFDjN8DVK1xT1QFgajx3fY6eyVy/5A7Mdzt2Z+euG1leTkfJyk7A2KcXxVj0KIyD4Qe0IvG+RcQJR5OmLuyJpDRS7mYC4Wqf9qiVNgNXSFNLBJ4vP1nOi4kmubJ9dKx2s/dpeUJyx6UCyzz2O3o32df48wiaqs+FmO8lBYkQIxo9Zdi4Au+ipmj+4UMIq8g41mpOlyI6aepo83P3i5N8HXqpVC7OXxASP6PtqCiX9WQl4fMMZPYv/m9lGPs08iBXDZaJ/8Bpc3LgAcH/Xgfaf9ynVRuvdPjrJveUqOFeGtYGr6kTz6MsiMf7ltv+8QIk9sV/wuxL+y9fcRJOnUXDQMqud2tBSFgeI7MiP+nkA1cvPzGMtfLHvl3tYFAcsdJnEUAP1syd6FC05fQS4G+rdyBeTnHZNFZrzKowVpoWff4MMxlNcDCD3T+PyOaWwfiTmi+nOixLdZ2JFwG89db7N5xpoGSjPJmt6Vom40itWV7EGNLeqs9f6EizO51wTcRdFJowXZYZrEoGVuQgZuAo7pYDSYlXDTUkyCDK8DFqKsJMoXVpYCxOTSb8X7mjghiBMRRIDTwt8894DJaEDyekQLWVgcp4BXigD3xu2yhI3swaMFWGM7Jd79pFjarPNF+tDqACT+JHz2YRCkiv51ylYJsafSYi8wdNhtGOWfDOUwrILp3S/VucfJszf+1V7owZVVgXOmhUmTORSV+ZK0oIZSfXc3NHxqqBNnKplGbbqMorsGz0Kupcbd81nI1gRSbqacVeOPfnAZoROx4jijU/ANeq9gNVlurN6WcNSDA5NYxCfRLYpnLiq7+EUmNZbqtc8/AyEuqM0Mdtgl5MdBoL55nDhmELhlreknlxL8Po8J1AUGqlV
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b032f9af-70fd-4ea8-e5cd-08daf41787f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2023 21:05:12.8236
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SWnl7+gqiOcOo1DiD/1APtZak1TLCD3UwsIb3jlZ8HJzFJskw89zynpz1ECeK2BRHLiCZ5LKLyZkOWFGwG/Sn8JIWFxRcABCgTOu1OBhZ+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5477

T24gMTMvMTIvMjAyMiA0OjMxIHBtLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6DQo+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bWNzLmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92
bWNzLmMNCj4gaW5kZXggYTBkNWU4ZDZhYi4uM2Q3YzQ3MWEzZiAxMDA2NDQNCj4gLS0tIGEveGVu
L2FyY2gveDg2L2h2bS92bXgvdm1jcy5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Zt
Y3MuYw0KPiBAQCAtMTI5MCw2ICsxMjk2LDE3IEBAIHN0YXRpYyBpbnQgY29uc3RydWN0X3ZtY3Mo
c3RydWN0IHZjcHUgKnYpDQo+ICAgICAgdi0+YXJjaC5odm0udm14LmV4Y2VwdGlvbl9iaXRtYXAg
PSBIVk1fVFJBUF9NQVNLDQo+ICAgICAgICAgICAgICAgIHwgKHBhZ2luZ19tb2RlX2hhcChkKSA/
IDAgOiAoMVUgPDwgVFJBUF9wYWdlX2ZhdWx0KSkNCj4gICAgICAgICAgICAgICAgfCAodi0+YXJj
aC5mdWxseV9lYWdlcl9mcHUgPyAwIDogKDFVIDw8IFRSQVBfbm9fZGV2aWNlKSk7DQo+ICsgICAg
aWYgKCBjcHVfaGFzX3ZteF9ub3RpZnlfdm1fZXhpdGluZyApDQo+ICsgICAgew0KPiArICAgICAg
ICBfX3Ztd3JpdGUoTk9USUZZX1dJTkRPVywgdm1fbm90aWZ5X3dpbmRvdyk7DQo+ICsgICAgICAg
IC8qDQo+ICsgICAgICAgICAqIERpc2FibGUgI0FDIGFuZCAjREIgaW50ZXJjZXB0aW9uOiBieSB1
c2luZyBWTSBOb3RpZnkgWGVuIGlzDQo+ICsgICAgICAgICAqIGd1YXJhbnRlZWQgdG8gZ2V0IGEg
Vk0gZXhpdCBldmVuIGlmIHRoZSBndWVzdCBtYW5hZ2VzIHRvIGxvY2sgdGhlDQo+ICsgICAgICAg
ICAqIENQVS4NCj4gKyAgICAgICAgICovDQo+ICsgICAgICAgIHYtPmFyY2guaHZtLnZteC5leGNl
cHRpb25fYml0bWFwICY9IH4oKDFVIDw8IFRSQVBfZGVidWcpIHwNCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoMVUgPDwgVFJBUF9hbGlnbm1lbnRfY2hl
Y2spKTsNCj4gKyAgICB9DQo+ICAgICAgdm14X3VwZGF0ZV9leGNlcHRpb25fYml0bWFwKHYpOw0K
PiAgDQo+ICAgICAgdi0+YXJjaC5odm0uZ3Vlc3RfY3JbMF0gPSBYODZfQ1IwX1BFIHwgWDg2X0NS
MF9FVDsNCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jIGIveGVuL2Fy
Y2gveDg2L2h2bS92bXgvdm14LmMNCj4gaW5kZXggZGFiZjRhMzU1Mi4uYjExNTc4Nzc3YSAxMDA2
NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMNCj4gKysrIGIveGVuL2FyY2gv
eDg2L2h2bS92bXgvdm14LmMNCj4gQEAgLTE0MjgsMTAgKzE0MjgsMTkgQEAgc3RhdGljIHZvaWQg
Y2ZfY2hlY2sgdm14X3VwZGF0ZV9ob3N0X2NyMyhzdHJ1Y3QgdmNwdSAqdikNCj4gIA0KPiAgdm9p
ZCB2bXhfdXBkYXRlX2RlYnVnX3N0YXRlKHN0cnVjdCB2Y3B1ICp2KQ0KPiAgew0KPiArICAgIHVu
c2lnbmVkIGludCBtYXNrID0gMXUgPDwgVFJBUF9pbnQzOw0KPiArDQo+ICsgICAgaWYgKCAhY3B1
X2hhc19tb25pdG9yX3RyYXBfZmxhZyAmJiBjcHVfaGFzX3ZteF9ub3RpZnlfdm1fZXhpdGluZyAp
DQo+ICsgICAgICAgIC8qDQo+ICsgICAgICAgICAqIE9ubHkgYWxsb3cgdG9nZ2xpbmcgVFJBUF9k
ZWJ1ZyBpZiBub3RpZnkgVk0gZXhpdCBpcyBlbmFibGVkLCBhcw0KPiArICAgICAgICAgKiB1bmNv
bmRpdGlvbmFsbHkgc2V0dGluZyBUUkFQX2RlYnVnIGlzIHBhcnQgb2YgdGhlIFhTQS0xNTYgZml4
Lg0KPiArICAgICAgICAgKi8NCj4gKyAgICAgICAgbWFzayB8PSAxdSA8PCBUUkFQX2RlYnVnOw0K
PiArDQo+ICAgICAgaWYgKCB2LT5hcmNoLmh2bS5kZWJ1Z19zdGF0ZV9sYXRjaCApDQo+IC0gICAg
ICAgIHYtPmFyY2guaHZtLnZteC5leGNlcHRpb25fYml0bWFwIHw9IDFVIDw8IFRSQVBfaW50MzsN
Cj4gKyAgICAgICAgdi0+YXJjaC5odm0udm14LmV4Y2VwdGlvbl9iaXRtYXAgfD0gbWFzazsNCj4g
ICAgICBlbHNlDQo+IC0gICAgICAgIHYtPmFyY2guaHZtLnZteC5leGNlcHRpb25fYml0bWFwICY9
IH4oMVUgPDwgVFJBUF9pbnQzKTsNCj4gKyAgICAgICAgdi0+YXJjaC5odm0udm14LmV4Y2VwdGlv
bl9iaXRtYXAgJj0gfm1hc2s7DQo+ICANCj4gICAgICB2bXhfdm1jc19lbnRlcih2KTsNCj4gICAg
ICB2bXhfdXBkYXRlX2V4Y2VwdGlvbl9iaXRtYXAodik7DQo+IEBAIC00MTgwLDYgKzQxODksOSBA
QCB2b2lkIHZteF92bWV4aXRfaGFuZGxlcihzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4g
ICAgICAgICAgc3dpdGNoICggdmVjdG9yICkNCj4gICAgICAgICAgew0KPiAgICAgICAgICBjYXNl
IFRSQVBfZGVidWc6DQo+ICsgICAgICAgICAgICBpZiAoIGNwdV9oYXNfbW9uaXRvcl90cmFwX2Zs
YWcgJiYgY3B1X2hhc192bXhfbm90aWZ5X3ZtX2V4aXRpbmcgKQ0KPiArICAgICAgICAgICAgICAg
IGdvdG8gZXhpdF9hbmRfY3Jhc2g7DQoNClRoaXMgYnJlYWtzIEdEQlNYIGFuZCBpbnRyb3NwZWN0
aW9uLg0KDQpGb3IgWFNBLTE1Niwgd2Ugd2VyZSBmb3JjZWQgdG8gaW50ZXJjZXB0ICNEQiB1bmls
YXRlcmFsbHkgZm9yIHNhZmV0eSwNCmJ1dCBib3RoIEdEQlNYIGFuZCBJbnRyb3NwZWN0aW9uIGNh
biBvcHRpb25hbGx5IGludGVyY2VwdGluZyAjREIgZm9yDQpsb2dpY2FsIHJlYXNvbnMgdG9vLg0K
DQppLmUuIHdlIGNhbiBsZWdpdGltYXRlbHkgZW5kIHVwIGhlcmUgZXZlbiBvbiBhbiBzeXN0ZW0g
d2l0aCBWTSBOb3RpZnkuDQoNCg0KV2hhdCBJIGNhbid0IGZpZ3VyZSBvdXQgaXMgd2h5IG1hZGUg
YW55IHJlZmVyZW5jZSB0byBNVEYuwqAgTVRGIGhhcw0KYWJzb2x1dGVseSBub3RoaW5nIHRvIGRv
IHdpdGggVFJBUF9kZWJ1Zy4NCg0KRnVydGhlcm1vcmUsIHRoZXJlJ3Mgbm8gQ1BVIGluIHByYWN0
aWNlIHRoYXQgaGFzIFZNIE5vdGlmeSBidXQgbGFja3MNCk1URiwgc28gdGhlIGhlYWQgb2Ygdm14
X3VwZGF0ZV9kZWJ1Z19zdGF0ZSgpIGxvb2tzIGxpa2UgZGVhZCBjb2RlLi4uDQoNCn5BbmRyZXcN
Cg==

