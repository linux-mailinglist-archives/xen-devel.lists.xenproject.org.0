Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6B56441C3
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 12:01:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454626.712153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Vh1-0001Qr-Lz; Tue, 06 Dec 2022 11:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454626.712153; Tue, 06 Dec 2022 11:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Vh1-0001Nd-J5; Tue, 06 Dec 2022 11:00:55 +0000
Received: by outflank-mailman (input) for mailman id 454626;
 Tue, 06 Dec 2022 11:00:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XkKw=4E=citrix.com=prvs=332b12f58=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p2Vh0-0001Ko-IJ
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 11:00:54 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fbf31ff-7555-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 12:00:53 +0100 (CET)
Received: from mail-co1nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Dec 2022 06:00:51 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO3PR03MB6759.namprd03.prod.outlook.com (2603:10b6:303:179::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Tue, 6 Dec
 2022 11:00:49 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 11:00:49 +0000
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
X-Inumbo-ID: 3fbf31ff-7555-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670324453;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=f3gDGFXbKh5iIuURx2764aIMCzMUjL+ckzSfafXLaDU=;
  b=SnnGPvtEl3gw9l7PwoMiohPjnJKuN4wxcHisVUtwPCFtDDrNG7vqneAv
   vKqwQLlkskM0yg0Chi0UP57CJHh7aC4URR2zWT7kix1QX6/UoGO+KVsDv
   jDR8MFH1R62Zs6Bjq+MQO0nJX19Wknsg2WIt+T7vIQxoT9gHCP24M2tHV
   U=;
X-IronPort-RemoteIP: 104.47.56.173
X-IronPort-MID: 86809322
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1RPSFaDN08oI7BVW/97iw5YqxClBgxIJ4kV8jS/XYbTApD4jgzJWz
 zBODDjUaP2OZWDyfIgiPYi2oUgGvZPdnd5jQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WlA4ARkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw8clOOXBsz
 +MkNHMkZz2am/2RxLu8Vbw57igjBJGD0II3nFhFlGicJtF/BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI++xuvDO7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr+RzXuqA9hIfFG+3tN0w0TUl0FIMwEXUVS2nNWUoXSyA80Kf
 iT4/QJr98De7neDQtT4XjW5pmCFpR8WX9dME+w85xqJw6CS6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hTa7Iy0cN2IBTS4CUwoe4tPnrZ0zjxTAVdJqGui+ididMTP6z
 i2OrSM+r64OlsNN3KK+lXjYhxq8q56PSRQ6ji3LX2eN/g5/Iom/aOSVBUPz6P9BKMOSSQCHt
 X1dwsyGtrlRVteKiTCHR/gLEPex/fGZPTbAgFlpWZ486zCq/H3ldodViN1jGHpU3g8/UWeBS
 CfuVcl5uPe/4FPCgXdLXr+M
IronPort-HdrOrdr: A9a23:KvPDRKyWVf77ijD+QLTHKrPxaeskLtp133Aq2lEZdPU1SL3sqy
 nKpp906faaslYssQ4b6Ky90cW7IE80lqQFkrX5Q43SPjUO0VHAROtfBODZsl7d8kPFh4tgPa
 wJSdkANDWZZ2IXsS6QijPWLz7uquPrzImYwd77i1NRZUVSbadkhj0JeDpy0CdNNXd77V5SLu
 vt2iKDzQDQCEj/Ff7LYkUtbqz4vtjWk5CjSQcebiRXkTWmvHeT8bvnFBrd9QsfVj4n+8ZezU
 H11zbh47mlsbWdwhvRvlWjiKh+qZ/a095eA87JrNYTJi6EsHfPWK1RH4eauSwzoqWUyHtCqq
 i1nz4Qe/5r7m/XfCWOrQDz1xLG2DIjgkWSsmOwsD/YuMnkQzB/NMZbn4JedXLimjAdgO0=
X-IronPort-AV: E=Sophos;i="5.96,222,1665460800"; 
   d="scan'208";a="86809322"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R7XWRkEc8/hK249qxqJ2nI30PKKgM1b14ZGuKQkmdSfgEbiF4B+PCpjr6c2H16OWD5HMcazyCoZVUiRu9j8Pd7Uhoe0IFWlDPQ5UwQRYOlmcvy66TnsU7tp31ACw0xvl10BnlMrI2GUgDLJ/bCr1r1jJOtnqIThu8NG36dkMwBJnD0TME7x+Fx1G19M4MnvXEXCVrqFWywPMdkHZs4sj6efR+Mv2M26DwOCNSC2vH17+K/cADwKt7suYP7+MNnl/547fWCuv56GtdwGsN10V3q0p4W3eLVDNxFdEwzRjhiD2hgRQcGu2iTZTKFBaOIg02luYJU2Q0ZlWlce9MeoPqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3gDGFXbKh5iIuURx2764aIMCzMUjL+ckzSfafXLaDU=;
 b=YVSyyCagwi7WbWoYgFhDCa/mqLp4qAAQE+hhpRj4Ve8rCe0dNbukiRZSOZuDJbxOCBL9aEY3R0EcftlRyFT528uYcO5nokzp+i0noIyb0v/NVp7Be4XvZCogeCc+rGuUdSe67eVbeNUUT4/qSzzMFR2s0FM18M/4Ce9i1bRcFZo/Kgdo8sqHDFGFlerF+J/b714qQJDQeQlCus+p2Sp2HLkt9BcgHTJNErYNxqYCLCHJnODHIlTS/t+AipMgsz4cFpv6cvaK7Z7zwB/3vXKq5Hs07IrvYLphOQpkvndXVtk6yZhJ565EcJeUPM3OPgDFg5dS7CI8UD+lAZl9t8HSfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3gDGFXbKh5iIuURx2764aIMCzMUjL+ckzSfafXLaDU=;
 b=vH1GGad5IkCkfxiJOIIGQBbuhx2mbNAyhjiorHcDmcr2Gmzn0IuhlbfN0Qn28b8pfhu7a5zqc5jHjivx3jLwmZfAUw8tp7C8o/XQ3B+HEFssFIKBY01jYG0gLuU5XFH6SMABenItxcvrJY5ezDxd8/0gSRTAVAveBXTPNeD1XlA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau
 Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 3/8] x86/mm/shadow: avoid assuming a specific Xen PAT
Thread-Topic: [PATCH 3/8] x86/mm/shadow: avoid assuming a specific Xen PAT
Thread-Index: AQHZCSwIvWwu4GpFLE2OKubGvNfAxK5gsaeA
Date: Tue, 6 Dec 2022 11:00:49 +0000
Message-ID: <33e6df53-42cb-7090-dc11-b685d5b8ec5e@citrix.com>
References: <cover.1670300446.git.demi@invisiblethingslab.com>
 <8fba8137ea2aa4fb5c61102342ad42ed8a9d0f66.1670300446.git.demi@invisiblethingslab.com>
In-Reply-To:
 <8fba8137ea2aa4fb5c61102342ad42ed8a9d0f66.1670300446.git.demi@invisiblethingslab.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CO3PR03MB6759:EE_
x-ms-office365-filtering-correlation-id: 2eb3592d-9387-4069-3665-08dad7792299
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 hmpqS7JqxGahiL5nNwrg/MWEQG8PW73QCkhlCrypHrY7TdUylFsWWiLvu7m8X2FoKZSp0js7NGh/7aRnhEP0OgE8/O5cig900tMSHjwIDqlIqUfYJxXN/1KIlaF6AQfsQkJ6GJmLNB0V2bo5zQE4AVbyqa7bblH19bpvZSCFdqGoRfDA4lSyRG0C5M1KarWc4AfUDTr5qez9fU5VKJO0JIhm9iM9IiN0/4BAcIToCOsn1/1QnL8hHMJ4taKe2WbDNsdLL1zcr90MXnWLojonltaOID+Qd+G8b/p4c1BooG8MI2L/BM7m2nrYOWuPrLWouU0vmYX0aqffyeq04ih+QH5/jTLHSr3gMRXfysYkSWVJO8YuHV/YCQ9DmXH9f668NqDevmWDYRKzi0Rj9tvjBtXYtUaxSaR/+qGxh+8IWby4wj/zpyN4qeixtFle6tCLF6a+VEP3UlsdhzYz0UzCgEyE6OZaW0aruuycjiK9MdvoXlJHUqr8kRkg8OKV3nL11eMiBtOrBgar51wT5tQtUTSyX8OMczj+L0Yb3BnrAfywmMWo1raAOPkI916h0VXE7sVko2T4WNT/MeSTZfXrZHnpAhDVWUiJq++CF18p/Bb+F9K201qEJN25dQmMjGTeI06sVNNDl56GAWDaHyWZe5BO18/v/OHziVZXj0H9t6JbpuJF/GvEjCVALoIvz4ieThVCxxdg6o6ZzMDxmVZc9qVXSNpd1V2CXItQPHQw4LST7Y0szMs/+Nb460naSHm1s9pKy1ViL9mOzUG+UXJHSA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199015)(186003)(31696002)(86362001)(2616005)(38070700005)(38100700002)(122000001)(82960400001)(558084003)(316002)(36756003)(110136005)(54906003)(2906002)(91956017)(76116006)(66476007)(66556008)(64756008)(41300700001)(66946007)(31686004)(66446008)(4326008)(8676002)(8936002)(5660300002)(53546011)(71200400001)(6506007)(26005)(6512007)(6486002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YzlaNmVlSTVWTkR4K0M4SDZvWStRNzFXNk9lNjRBRG5xaWdCdHFHSExlSWtq?=
 =?utf-8?B?elZuSkozTFlJQ2RCejNpL08vWU9LUm1wcnMyODNjMlJsVzl2blJxaXF3ZmY0?=
 =?utf-8?B?UFhOeElMVG5pbDFFTWJJbzZXdkQyQXZ1VHBEbG5JcS9pc0xIWHdkUXZ2M01U?=
 =?utf-8?B?ZEJlRUlzRTdxM0Q0Z0F2WG10eFdsRHhKQnFxR25TWUFPbVcybkFEQk8vUkd5?=
 =?utf-8?B?blRYWnA1RXpLUUJWT0tvemFTV2g5enRBdDk3d2lQbFJ6bU15a21LUXk5TFl3?=
 =?utf-8?B?TlM2eDVhSWE4bWJUWWhUSVlqWEI3Y1h4QUMyemtrNVI2REpMQUNETW4rRUNJ?=
 =?utf-8?B?TmFpdERHOFFDZ1Q3a29HdGM4Vm1VdHB4V0pKNlRERW5oWENjS1JoVFBaa0Uw?=
 =?utf-8?B?d2xBQVIza0N1WjB2RExQTDM1OWFQN0VTblFEVENWK2cwdFRHNjRkVEN1OHZl?=
 =?utf-8?B?U1hEU3c3TWVac2RFeDlHUXdaWXBNb2RYUkxMY2ZPT2xFbC8vNmR5b2dKMVpp?=
 =?utf-8?B?eTRtWmtqWW01TktwalBpZXM4dS9RYzVDTnlWQ3NuOU9Uc2hjKzRITHBXNWlP?=
 =?utf-8?B?TmE1S2RiNGxSVGN5U1ZHOVUxMEdVaXdLelRtcEppTVRhdlNCTHoybjFvZ3Rj?=
 =?utf-8?B?aEJNUkJXZkhtWU1pQmkxQ3pqcFl2TzJlSDBURGYxL2VjbUVRbXV4UVVkQ2xO?=
 =?utf-8?B?ZTBSeDVzTjhzV1Q0dmM5K3JYakhKY05sZjFFODNYaUtTZVp4djhpTFROaFFS?=
 =?utf-8?B?dUJ5eG5lRktWeFdEQmI4blNyT1RNZm9hbkVUd3R4aDg1RU9EUTltK0ZqQWw2?=
 =?utf-8?B?V3J0Mm5qSXNvNngvcmM3cFBOS0tTQXlnbEVObnQydjRXNnc3N25xZ05JcnYv?=
 =?utf-8?B?ZWJHMmcyc0F5MGtPRmtSQzNUNCtRT2d4d1huQ3l6S1hONHBZcndpL1dITXF0?=
 =?utf-8?B?a2k5NVMySGpSckhVajJJbWxhWVpYOW1YbzBMdjVISmFITGNLZW82R1U1cTVK?=
 =?utf-8?B?eTBoZjY5ZTRUaTdFQWdBYmdqbWlsTHB3NXFZSkNxMmhYMXBrRkIzRVNNaGlx?=
 =?utf-8?B?QzYyMndwL3Rud2hPSmYzSWVKVTlhM3dEWWdqTGx0Wjc2RllMVGhxZnlvWmc1?=
 =?utf-8?B?OStPMkszMm9SLy84NkwxWitEb0QvcFlqT2sxcndVTVJwY0V4aE9ldDkyYnJr?=
 =?utf-8?B?SWsvWWNSTXZuUUs3WS8wdmhpQUhBd052RXpRaVhycG5XOHFjWXhULzMvV1VH?=
 =?utf-8?B?M0VpbjJScnNuazljUDFpdVdZWTNLK0ZHYjJtbUNsNVZIY3BXcEZpdW1BeHlk?=
 =?utf-8?B?aGpTNUVMNnRLaVBnUFdWcHBlTUdKcm0vdzZUK0lEZHFvZFR4d0d1bG5KeTF1?=
 =?utf-8?B?UnpnUGY0K2ZJUEFrQklMa0NnUERyRTlUVlkyWjVGelNKeG14OWc4V0IzM3px?=
 =?utf-8?B?eDlHUUJMdW53SkdrVHp4M0dTM1RqdFJqY2NSSWdOT1RhMlJpZXBDNTFieGtu?=
 =?utf-8?B?MzRxZVk1cUFuMlB1Z3BGNlk5azJ3dEJ2YkxySVgvQTFUNjJza2ZqTm5UOUM5?=
 =?utf-8?B?WXdlZ2JPUG5lQm80NnR1NWdoWDlBcnp4dnY0NDRXdWhEcVFya1dDeE9ZM2F4?=
 =?utf-8?B?TlhRQnZMczV3R2huSUJUN1BsUHIyczFlODFQYXhlYW4wTGRWOFV0QUZYL0Za?=
 =?utf-8?B?anAyTnFEL0M3R2FOQ2JYcG03ZjdPQlI2ejh0NnFSWEJoNmhIc0Y5U3A2Z1pT?=
 =?utf-8?B?UXlaa3dLZnAvdk5ZRXZMZHJMWEJOWE5QLy8yZ1hpOGV2QVM3R040dExGc1ZQ?=
 =?utf-8?B?SUw3QTdxNHpMS0hEc2xlSXE5blcwVFFzaVR1WU5DWkFqWGtKa051cU1qYkJB?=
 =?utf-8?B?dEZ3VUhWNm5oWG1KZXlMRGtoeGRwQ1dzOHlsNlZmQ25GSjZxbmozZmxrbnFZ?=
 =?utf-8?B?ckZFTFZjSnhBdm1YYjlaM1lXcWJ0S2ZLQ1h3MVptc2ZXU3BHRTNJNWIrWWZS?=
 =?utf-8?B?akZEeVlJSzg3NUZ5SkJwVVY1blY2VDRGa3BHUHJsUFV1Sitxb2d3NHpscVYx?=
 =?utf-8?B?WDdtcm9EZ0QrT0I3em1EOVBZdmdPblZLUzVHOUlTYjVmdThUY2FMUXBKN1Rp?=
 =?utf-8?Q?NVXAhl+jF2TozUzo7S09mlDWR?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <480092AE075E124A856EE982E1B082C7@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?bnNFWDloUGJ4bVF3T1RtODhTSUVKbUczYUdMYWo2ZE5GRGt2dUlFc0VjdXY3?=
 =?utf-8?B?UDZLWVI1VWhrSVpGbEtjNVlkL2xSazN5dFJNbDlNd1RVd0lUelFzQ0p0OFdy?=
 =?utf-8?B?L2ZDV3ZCU3ozck1nM21vLzUyZVVBMW5jTUZzOUlDVFBaaDJhamZFdlpEYm5o?=
 =?utf-8?B?QlJyaU0xMnlkYVpnanZjYmk5KzNJYnZ1eTNqcmloQ0FGSWFxeXhPSEFVdVJZ?=
 =?utf-8?B?Y1F5dDhJM0ZqUmJOYjhSU21pQjh1emZRa3JaV0dmdm01YTJQMDJMTDVyUDhK?=
 =?utf-8?B?OHdLeG5pTXNuTmVKSDd1eDFiL1Q2UjN1eDR4NnFIR3IyNytMc1VxQVVNNWhS?=
 =?utf-8?B?TFpHZ2pZenBqbDhzcERGVEsvNkR5NFdBZUpNcGZkaGp5S0U4eTQ4MzcxdEtl?=
 =?utf-8?B?TUlVK0liR01EK2FwcVBMVmdMSDJiUTZBQnNEYUtOb0Vvam1icHJQNjltQjdC?=
 =?utf-8?B?TVZha0xwL3ZpcGdJa2VFNk40bDJIZVlCVTFKTGRwUXkyaGViZ1JwUnlJakJ0?=
 =?utf-8?B?Nk9VOEpRT1dJNDZzbUxWMFhDaTlLZ2dxRVphbDZaOEVRajNWNTk2a29KVVc2?=
 =?utf-8?B?Y3NLeW1RZEd0MTI0R0dwVWNWNU5XZklSWjdzcERhTjJYMXB1RG5qWjJIaklM?=
 =?utf-8?B?ckhvTDZsMGNMY1FXNVhKbnFqdFNqWk5VckxiSU5xUUtNYlFhaXVsbWtpMlVF?=
 =?utf-8?B?WWVYalU3bTVtZ2crRGlxZHVVVm41Q0NRR2pURnVIK1Fqc0MwNFV0K1MrcVRR?=
 =?utf-8?B?TjR2ZEJYbFVPSjM4VitncEFlZTg0enRnb2tCSVNqRnhORk9laVZRV0FPVnNR?=
 =?utf-8?B?ZG1jaWRNS1FVaVRpRzRITGp0Y0lQWUw0TVM0OEQveG9OOFk2R1M0UXQ5a3Nl?=
 =?utf-8?B?ZlVCVmY5VmdESU9RMWxTUjJOUTlvQnZIcklNcG5kaXQ3Ylp0MENDQzJRMmVk?=
 =?utf-8?B?WHU0Z2RaYWt3MGpCMkxDMWdQUEwvUno1ZDFCeUVySkUzZ0tEUmsxT0ZZTnV5?=
 =?utf-8?B?OUpqLzRvVWlzSUN3azlhUnBJbjd1SGFYSHFxR2Zxd1RiSXRZckFPVzdwQVZ6?=
 =?utf-8?B?Z0RDRUFVV0wzRGRkQUZoM3pHaWNmSEg5cm41Lzh5T2hLMHdiNTM0OGNMLzR5?=
 =?utf-8?B?aEdYTXYzL2JkbTVnOU5KenJQeHhGM0ZiZjYxVHhTY1VnUG1PaUlDZnhvZmhw?=
 =?utf-8?B?c0tlWjBzM1ZjdTBxbzV2a2t2dFgyd0h3OWVMTW5lNkVWR0czMlIwVWorRGdq?=
 =?utf-8?B?UVY4NzU0UmhQckw2V2Q2TmcyRVphVy9ER3hicS8waE5TNEdRdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb3592d-9387-4069-3665-08dad7792299
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2022 11:00:49.7514
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jREXUmSRcLtEp9fJbRKI/fqk7sM/aKcH534Zq8SjNLhIsAURRFYCZjH+s0NFAz28Zz8+oTts3TLTiXdRZMHffnE4E+RTidHvc5wXr4gbCvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6759

T24gMDYvMTIvMjAyMiAwNDozMywgRGVtaSBNYXJpZSBPYmVub3VyIHdyb3RlOg0KPiBUaGlzIG1h
a2VzIHRoZSBjb2RlIGVhc2llciB0byB1bmRlcnN0YW5kIGFuZCBtb3JlIHJvYnVzdCBpZiBYZW4n
cyBQQVQNCj4gZXZlciBjaGFuZ2VzLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBEZW1pIE1hcmllIE9i
ZW5vdXIgPGRlbWlAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo=

