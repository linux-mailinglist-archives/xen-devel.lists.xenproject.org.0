Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 775CA76D062
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 16:44:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575016.900766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRD5Z-0006tq-AJ; Wed, 02 Aug 2023 14:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575016.900766; Wed, 02 Aug 2023 14:44:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRD5Z-0006rZ-7M; Wed, 02 Aug 2023 14:44:37 +0000
Received: by outflank-mailman (input) for mailman id 575016;
 Wed, 02 Aug 2023 14:44:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/vke=DT=citrix.com=prvs=571ca8ae6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qRD5Y-0006bA-3D
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 14:44:36 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16f7db42-3143-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 16:44:33 +0200 (CEST)
Received: from mail-co1nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Aug 2023 10:44:29 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5032.namprd03.prod.outlook.com (2603:10b6:a03:1eb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 14:44:21 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::9410:217b:251f:2a98]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::9410:217b:251f:2a98%4]) with mapi id 15.20.6631.043; Wed, 2 Aug 2023
 14:44:20 +0000
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
X-Inumbo-ID: 16f7db42-3143-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690987472;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UNeF6WAyrYDXqzjP+1UB8Hs+VZNNbhNjmB9zY5OzRkM=;
  b=WsIjBmbi9zkBBkdwmXMBU7fL2x4JlLyVPZuXrK8F/YG8+MWI8bGdY4/e
   yOT3nmB8WTLT9kb1HkBQj5JRkRzlUT9wpU+DtrlORrL79FtAjuV6pfnGl
   dVhmFWgYSZkppqFHPmARQ3OjisZaWAPK/manIw5PWfAAfYtJjCahsgtuY
   c=;
X-IronPort-RemoteIP: 104.47.56.177
X-IronPort-MID: 118696024
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7mdw1a7BCUB3A50UuvNXGwxRtILGchMFZxGqfqrLsTDasY5as4F+v
 mQWWWiBO/6KYmXyet9xbd6x9U0FvsTUxoRkSQZq+Xo2Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35ZwehBtC5gZlPaAT5geH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m1
 KxGKA5KUUu63f+Snpnqdtk32el5I5y+VG8fkikIITDxK98DGMmGaIKToNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Okkooj+eF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtLROPpqKYw3DV/wEQuNzAXa1GDhcKX0FC9S+hyK
 H0p2gUH+P1aGEuDC4OVsweDiHiFtRkYUpxOHvEg6QeM4qDJ7B2UAGdCRTlEAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9BXQZeSYOQA8B4t/iiII+lBTCSpBkCqHdptj0EjH5x
 3aNtjozg50aiMJN3KK+lXjXjjStr97TRwE07wneXWW4xgp8aMiuYInAwVHK5PAGL5ucR0PHv
 HEAl8WExOkLAdeGkynlaO4KGqq04+qENjL0i0NgBJQn+HKm/HvLVYJa7Sx6JUxpGt0ZYjKva
 0jW0StO4LdDMX3sarV4C79dEOwvxKnkUN/iD/bda4MXZoArLVDYuiZzeUSXwmbh1lA2lr0yM
 ouadsDqCmsGDaNgz3y9QOJ1PaIX+x3SDFj7HfjTpylLG5LHDJJJYd/p6GezU90=
IronPort-HdrOrdr: A9a23:841YB6lG9Ntq75cZ07tXrgrCQ6zpDfLm3DAbv31ZSRFFG/Fwz/
 re5cjy1XfP6Ar5K0tQ4exoWZPwPk80kKQf3WB/B8bGYOCLggWVxcRZnO3fKl7balPDH4xmpM
 NdmsFFYbWdYmSSz/yKhzVQeOxM/DDzytHLuQ6o9QYPcegFUcBdBgFCYDpzWXcGPjWuTaBJaa
 a0145iqz28eXIRdK2AdwI4tsb41qH2qK4=
X-Talos-CUID: =?us-ascii?q?9a23=3AzI1BymgRaqiiIDrTAjLuTdNwEzJuUy2DzEmXHBS?=
 =?us-ascii?q?BU3tNFpbEdW/Lp44+nJ87?=
X-Talos-MUID: 9a23:vOcqBQgc4cRq3e5gqioSTsMpCfhF4pqkMGQ2v88YuNm+GC9BBheypWHi
X-IronPort-AV: E=Sophos;i="6.01,249,1684814400"; 
   d="scan'208";a="118696024"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0KQMbrulpcy1MazCf14/3J3AkzNH2aInI4ul3ifMNIgLBEIQ9Ptm/ZxAjTO4PgoBSqyPL/V/zTKb8azuWbW8R4vHk+lun9tPfSnKcg+hmn7g3oUPxlPjRnY2tIfyTRYFIdJ06tB8YflRyziqkNDZlSU3xWpdKaV/9TUlIaDEJidD1WPPmucq/Q8k+SL6yVN/X/HFbGq573spml6Vjd8LiQTb9xD9g4x+5WfHBbNGbUBAISs2r7uIytSocepLmZvWmyO7kYw4aZ1LOZYfglwEJtX+D+5T1p0a1kJZGgeEQskcfkwCkaQGBvt18svvuH3synS3HcFRxno9eqTFqDA8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhKHw/piiMVIfAz6pOjG7eVxMM10gNolgIJmF2iIWvw=;
 b=evfeR9ihuZYvOin/rQ5nCXBh20HrspVvKG2bS1/xVWjbXCPC3FGVvm1wRYDqiETIwvz9Q7RQAYMe+egjLXyUQTWRq4C402TkODg194QqGo82xInsE+1SvVuOmPmhqR5envqQqzHNVFSVEAWwOcm1KNqXEQYlOkRjhAvNQQsvoCMBQfnuRwKsHLj9l7lsFf+AOtT+3e0/1900+a7ZuL9gGAH18viuwr/o2KSKPZ9uTHtOjN5Gzw19e39dSaSa+dkQHz60BhBahtK0qoED+TbMHYqjzAwpDX9AuiWeMHr6cMOaT4kC5UNgxQxjfKLoCOJTwUVo+CrGAja+eYxXWj3LSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhKHw/piiMVIfAz6pOjG7eVxMM10gNolgIJmF2iIWvw=;
 b=L8rPWGHY50LBfx5QSiXmOmw2iifkdgyN2+8A181tXLwfHRgVqqMhOB+quUDDWyb2Ab4qpuqyW/aCuQAQZWRM9KPSlCvs3qLWGOOQg9fi2B6lM/OXU2k+laWJfRg+zfcWMBoO04dTEC+oGyqyvUTFMF/PMKE1WC46lXZb+H3fIM8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <22224dbf-352f-710c-7708-bc1ac0bb5803@citrix.com>
Date: Wed, 2 Aug 2023 15:44:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH 02/11] x86: move declarations to address MISRA C:2012
 Rule 2.1
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
 <204bf3ffcdda04d6d6cf072c42b78720e1e85b4d.1690985045.git.nicola.vetrini@bugseng.com>
In-Reply-To: <204bf3ffcdda04d6d6cf072c42b78720e1e85b4d.1690985045.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0114.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB5032:EE_
X-MS-Office365-Filtering-Correlation-Id: 4304b82f-1595-4697-f98c-08db9366f4a3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C2/1RTZXTuv/bnLonxidDTMS/klPvv0bjF2N3StoYOHoTwgC8BVx3kqRROYRwioccGaH8eoi3Jbe5l2QELHhpR3dP30gjkItcd8UMxGFk/6P8zZO96vS6GNiWyqx+qblC/f3OV3vXvws/2CivQSZNYPqChXgX53S8KY3ulO6w+ND+TnnonNzlXtFldR4/bfGYEcAZlACZuXMilVxB4iuZ/9icueZ2fCiA53zAcXmAFvteAHtg1TjwdkbSD3fyxxX2sKMFKZfKK2biuSkLA9kIOFkwVTwecA/nYthTnykJcA7vq8yy3DlZiN6xSOPblboriOtsoVAdz0DEK53mcMrXnBzOIHCPbgxpjAdChjU0KYMr84+cEf2xxfLvRvYLaeQmxnEaR49bBh6JiZgXHR27P5Wk8Oofi23XgIcTZH3BPSdLGW79SXuEi8QCu2xYNUjl4j0Fr2UMkN2R856ozf1KT1H/HWiSeI8HUl3GYZwhkmDWgzGFb2NpVkyep45QEHL6y5+cN6y2ShKarjliK0U9Wyj9M/zq+fNtDZCwjSprphi+ySlhHlIKl5ijDmU0xKuDb5Ecwnugap/mzJ9/QFpxY7YSRnZ4NO1dAEsoJVWQZCX272S2eMpif9SVFO+wW92IBns5WfGB2eiHL0kqjnJkg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199021)(8936002)(8676002)(5660300002)(26005)(41300700001)(2906002)(31686004)(7416002)(36756003)(2616005)(478600001)(54906003)(38100700002)(316002)(86362001)(6506007)(53546011)(6486002)(66946007)(66556008)(66476007)(6666004)(31696002)(82960400001)(4326008)(186003)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUozdjdoVFJPSWZpK2pEWXhVMzFhdmFVWlhvYTdjRFFEdXNrZVpGd2JzZEtV?=
 =?utf-8?B?YlJvWTdSS2VCdWNRbnpEeEFSOGZrZ1I3WjZNQlVzN0M4QXkxT29BT0ZXblFB?=
 =?utf-8?B?eEJ5ZHRVeUNpUG0wcExMNlN1UjczV3NTZlJUK3lKcklQdVF4blFjL1Q2VTY2?=
 =?utf-8?B?NFB5ZGNSbVl6TDNWSWV6RXNNUjRsM1dZdjhhM2pjc2N2aWp2N2ZkMzBsUGFD?=
 =?utf-8?B?R1BCaDN3OFhMMGVVZ1N4Z0l1ZFphWGZ2WXZBanRUQ2RKZTZ5bzZhNG9HbS9D?=
 =?utf-8?B?QkhWUitCUS9FZEE2b2VWN2ErNW1RMEZ0ZjhZeDNiQUpiTVFjNEx2RURBeEY3?=
 =?utf-8?B?WjhON1VqQTVwUmtML1VWNGRhMlVTREJ2SXIyd1VGOGtGVkN2MzdqQXN3bzM4?=
 =?utf-8?B?cUYrUU1KTGNuL1BwQWxheUMvazNtMnJrS0RlUHBqSkFmaEhJT3Y0VldQcHpv?=
 =?utf-8?B?OHBocDNxWnNaK1RBc20rNnM2MDJjMnhrRWpkT09hWlF2SlQ1aFphVDAwSzVl?=
 =?utf-8?B?Y2hYK3JhVVhRUjJFcEdRdDhIS3hMd0ozRkxmRkdKUm9Rdm1UdGxJTGI4azdZ?=
 =?utf-8?B?U08wclJqcEcwa1ZyU1Zydm1SMkJ0YmNWdmY1UVlXSEpkT1A3alBOMEIyb2dN?=
 =?utf-8?B?NCtCUC9rQmU2SlVQTE9oNzl2K3ZXaGVHVEZxeEVUTEhaZDZMaFl5eGpYVFRF?=
 =?utf-8?B?NWJRdXBUSlZteEtkUkdueXEvTjhqS3lQNkEweWNKQW50eWpGa1d2MUxtREhp?=
 =?utf-8?B?VndsVU0zY1Q3M0RDclE0OTNrcTVqaDBQajdNUlpLMzVCcVRDQXdjZ3FLT0cr?=
 =?utf-8?B?SWdWMStMQ1lPRyszYmhoYjM0T1ltQk9IOHFtZ29vU3VzaFFSL3BYRlpIemFK?=
 =?utf-8?B?U0J5TFJWNmdJcUVuSW05Y05nd1dmcmNyZzUydDZIaHcxNnRMVXFoTFNJeEtw?=
 =?utf-8?B?UzdTSjVpaGZTYW5hZGZwblJkVTluK3ZaaDBzQnN4bDB4dFk0LzEveUpGaVVn?=
 =?utf-8?B?NHBQeVpNK3lGRVNnMS9OUG5pRldFaGg1d0Qwd2E4b2ttTEFmVE1NK0Yrc0s5?=
 =?utf-8?B?T1YwQ3BsL1BkNHBjV096MGpsUnF5dytDWmlFc1JZMldjRWpWRG9LbVdlVFBG?=
 =?utf-8?B?Ry9ZTkE2My9RSi9hb3hwMGpJaG5mcytVaEF3aGNpVjJGbm5JR3p1OGFlbi9k?=
 =?utf-8?B?cHBRMGpaUndzWC9zR2hvNW5kbW5HYVlXR1ZUaE5PckEwUkg3emlZdEpYYWcy?=
 =?utf-8?B?UmJ1WW1SN2drMFZhL0Q1c0hRM3kvdkgrYURkQ3JEak44alduN0ZhbC9xeXIv?=
 =?utf-8?B?Unc5Mkg3YmE3K2dNUHdoWkdtZUpFY2RZSXhOM3ZnRmM2cE1kZU9VZ3JmaFlX?=
 =?utf-8?B?ait4NW9uM2JLcXZCNGk1MVFXa3hHdmQrK1BLMWdMRHdKcWVONGFaci9GY01z?=
 =?utf-8?B?SUxQRTZXK0s4dlFMUVc3WU1seEkyVGI0dGdkaXB5d0NSK1hJbXEzVDUzRFVr?=
 =?utf-8?B?Y3E4TUY4NjdscjVwRldZTENsMzRpMk1KTnIrbHExYjliVkFhNmZyUkhLbW9P?=
 =?utf-8?B?QlVkalJzNTE1ZGFXY2s2MlR4blZOcGFSNEhZRm53eUhOSENYVndQMzFiaC9E?=
 =?utf-8?B?bmdxdm5DbTk2RlA3TW9NQXorL3hvTExDSXFNUjVJZ0hMM1J2NlR5dEhOYVpn?=
 =?utf-8?B?cUdUQk9TSS9jRDNlNG9qMDB3NjNaelArTTNSZUpMa3JCdFBHRXFRRzhUNlZW?=
 =?utf-8?B?U1h0RkNsTDR0aWxRQVpJQ0JQV2ppcVZ2a2ZUc21hNHg4UUxzR01nTk1BUmFD?=
 =?utf-8?B?clNWaC9Jblh1MW1NQkdva0FXME1zUWZDdXhFMFEzckFCSXFkbVUra0kyQllW?=
 =?utf-8?B?MXJ5dGI1ajBIOGlzNVVreTVCT3RWSGNLMitHOHRKbytxSXp3VVpMd3hPMTZ3?=
 =?utf-8?B?Z1FpK3FRVkgrWUpkUHRTRmR5RFBBUmJUVW95Y2UyT2h0YytiYjJSYnlnY0pR?=
 =?utf-8?B?MDgvbzRYc3lZanpHVXRoMGFQT1BLVStpWnYxUlplOG1QdGgwYzR3cU1UZW1x?=
 =?utf-8?B?VU5jQmFJZzgzOXlybVZOZHlZRWNrWE1tMGVPcUtGKytvT3ZvRzVodE80QnZO?=
 =?utf-8?B?SlJFRjE2QnNPS3VnNlk1dHRnb1BmbHlTbis4cDZoMGJBWjFYaU92ZXJ5Z00w?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5KKC7Y4RS8VnXkOnhA2SMQ7UYg3ljSO/QS9L7YAlpb0b9L0PlyThXQKu2hbgpvq6jtQA0UiRhpqhVzfPJr1+PeaIbb/C2uitdgsuXBZXZVmT6XVKjAPd8ncGrJ1fs8bpbQg6Gsdjpc/UJgZ6AMRfIbzCt4g4ZCUPXM/AX7Pi5DzTt1iqBIzw0Iu18YRB997XDApKOuJZtaL0KkQ6km5bdgHwg7QPdf6br5Zwrq2vz3wUMy1vnS5lTgH40/ap0y17LqNOG8rQtcWZ8r2/dRJkXahQq5k5j3RNZL2yH9X9ehxfaGjMy7xkCdY9zB3TyobiRaFXjk8LIzDexlwwE5FbnYjochRu6jZqkLHzu83Y56D6F5FDl5mvxpepAduHR1IUkurp/TBfqi/SadKnAu8Svp1NNjnSRJTme2ESCUUWhkmRxZw+LoKWBGRONSERRfjP1XrQviU5skK1wCuy0toYkSYqTZ0ZcviYQP37rTfX73ENGdObIGeF5m0JdzL7HVWuigli+J/Y4qRxzL7Oj09/BXDdz8sleaE5+RE4IIglFG9szK9uORFl4NKVbl6mC/wVTqsKqJRVUeukjcsYbD9U+ugkSBiM0oWv3JHv0qUJ0ysxs9Hc9kw6cfBHjL/cID8BoUE7Iz6CjdIG25N/LhoXONglVaZPhdqifjdbrvHjf5zj92gbF8dsQ2080kjHoxACzgJ30BXnxVm4wCvbiSfu+rMdZ5qPInOt9s+3F/a7QtBDfa04cT+I/L3HANll9gVRre++Xj6qUwYQyBCiymLsPwle4m8Cw5fZUkmB3Xj/pQMxX0M/bkiqco7YFxQGhBMi+vb+B0jQMKycnf+dwecitzF2eMGj7iZoqM/cWDdHlpmwh5kYzVMgDdK8DIy1GBtSFg1lps2zQwDZWrVhWPby+Q==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4304b82f-1595-4697-f98c-08db9366f4a3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 14:44:20.5895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GO3n/EOvsxjzAEYhKKGJi/uZG0UNyUd1ftDF3LmdC9ENkajHF8RWz616akbK6OmnPsJrzbrvtIeERDS7qZE3rBLxQ7WutaWDDj0u/7SPmRo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5032

On 02/08/2023 3:38 pm, Nicola Vetrini wrote:
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 5f66c2ae33..015f7b14ab 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -2268,6 +2268,17 @@ int domain_relinquish_resources(struct domain *d)
>  {
>      int ret;
>      struct vcpu *v;
> +    enum {
> +        PROG_iommu_pagetables = 1,
> +        PROG_shared,
> +        PROG_paging,
> +        PROG_vcpu_pagetables,
> +        PROG_xen,
> +        PROG_l4,
> +        PROG_l3,
> +        PROG_l2,
> +        PROG_done,
> +    };
>  
>      BUG_ON(!cpumask_empty(d->dirty_cpumask));
>  
> @@ -2291,18 +2302,6 @@ int domain_relinquish_resources(struct domain *d)
>  #define PROGRESS(x)                                                     \
>          d->arch.rel_priv = PROG_ ## x; /* Fallthrough */ case PROG_ ## x
>  
> -        enum {
> -            PROG_iommu_pagetables = 1,
> -            PROG_shared,
> -            PROG_paging,
> -            PROG_vcpu_pagetables,
> -            PROG_xen,
> -            PROG_l4,
> -            PROG_l3,
> -            PROG_l2,
> -            PROG_done,
> -        };
> -
>      case 0:
>          ret = pci_release_devices(d);
>          if ( ret )

Why does this get moved?  There's no code (reachable or unreachable) in
there.

This is very subtle logic to start with, and you're moving one part of
it away from the comment explaining how the magic works.

~Andrew

