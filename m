Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A3A675CA6
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 19:21:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482072.747392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIw0T-0005AX-II; Fri, 20 Jan 2023 18:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482072.747392; Fri, 20 Jan 2023 18:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIw0T-00057k-FU; Fri, 20 Jan 2023 18:20:53 +0000
Received: by outflank-mailman (input) for mailman id 482072;
 Fri, 20 Jan 2023 18:20:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vlkl=5R=citrix.com=prvs=3778cfab1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pIw0R-00057e-Jt
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 18:20:51 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29cc795d-98ef-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 19:20:50 +0100 (CET)
Received: from mail-mw2nam04lp2171.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jan 2023 13:20:47 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5249.namprd03.prod.outlook.com (2603:10b6:a03:21b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Fri, 20 Jan
 2023 18:20:45 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.6002.024; Fri, 20 Jan 2023
 18:20:45 +0000
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
X-Inumbo-ID: 29cc795d-98ef-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674238850;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Leab09+bzq5znpAUI5jSuBy+z9S0rS7msqeZJPBk6tM=;
  b=g9tm3pVd/6E6mW3ugCtcaebKa5bbJ3aLzLeXLpSzhiMESH54ta2mYMTC
   o1MbUv/kbV2epz8yY6usDeBlra1j95k3SYWBBMNuVXAxosj170Qcxzxqr
   WbMG8FJ+IBNFRYI/x4rlrEnS8akkpDsa7g1gOein5Q4YlhJ1jMoMibRII
   0=;
X-IronPort-RemoteIP: 104.47.73.171
X-IronPort-MID: 93980226
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/fvzdKCaGczVHRVW/+Piw5YqxClBgxIJ4kV8jS/XYbTApD4q1jFTz
 zdNW2mFOqrcMWDweosibtu/8kpQuJHcnIA2QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GpC5gRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwy/YnXlNr+
 sQkFzknRUGOrOm45ZCrVbw57igjBJGD0II3nFhFlW2cKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK/uxuvDG7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr6UzHOjAthMfFG+3uJNmwKS6GFNMR4xWFGG/smCt1+mcc0Kf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZDYtE7sM49RRQxy
 0SE2djuAFRHsqCRSH+b3qeZq3W1Iyd9BXQZeSYOQA8B4t/iiII+lBTCSpBkCqHdpsLxMSH9x
 XaNtidWulkIpcsC1qH++E+dhTup/sTNVlRsuVyRWX+55ARkYoLjf5av9VXQ8fdHKsCeU0WFu
 38H3cOZ6YjiEK2wqcBEe81VdJnB2hpPGGS0bYJHd3X5ywmQxg==
IronPort-HdrOrdr: A9a23:YjghU6NDiikItsBcTgWjsMiBIKoaSvp037BK7S1MoH1uA6mlfq
 WV9sjzuiWatN98Yh8dcLO7Scu9qBHnlaKdiLN5VduftWHd01dAR7sSjrcKrQeAJ8X/nNQtr5
 uJccJFeaDN5Y4Rt7eH3OG6eexQv+Vu6MqT9IPjJ+8Gd3ATV0lnhT0JbTqzIwlNayRtI4E2L5
 aY7tovnUvaRZxGBv7LYEXsRoL41qT2qK4=
X-IronPort-AV: E=Sophos;i="5.97,233,1669093200"; 
   d="scan'208";a="93980226"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EbTBHjA+ZvJOOQlEhF5NHPs/qfpdNo3gbxlP4UiTH1EvKwuH8DkvZh4SOr+KJmc7HaRLrs9y8b+3Zfevr0Vl2wtCB6ogOsRmn3hV8AvZW6De0GrFt6/Abl6o/i4Z+5YW+S8AlDUaxrYByw3kt2RgkqfvqZmLLUrRD8Jxw1gLAwAU93wIjF2YGYswWjWXyVijNdSDuHRbJJ/7Ks+ttFu8PhzMlMUlc3tzZaw/YXHraM/TYNg/Nfd268EQJ+H42NXfT3e9ndlMdTk2PED8xaX7T2ljvNao1aqL5zHl+Oe7TzC/gwhfMTBh0Czh9zUucpa0w74Q3MhWod6JdlbzTn8wpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Leab09+bzq5znpAUI5jSuBy+z9S0rS7msqeZJPBk6tM=;
 b=WPN5OmVvzDVsDT2XndsnifHp5c/xbGti/JQwItAkKNmLZMJExUA9gecq9LCrXQVtWtueohey/kWUCJRc2DBAjbYbf032e0P7pSg7Gsm2Q9cUI8NbLZznN7gLiQ1EyBbtFB0IzfZHp5riSBJQvJliC2ZaUh17VHJDEMmgBYsxKI17MS8CjCWeaO/QM6Oh/xMMZJPFVAfKAWTmCSOD1nu9MmNPkgvew3aFokjyJa6cSm1drBomUpoU+kfE/56usr56bwIz6fkOGDugEhY53AEnkhXx+53X/PR9fpDpdgu7Jn6tqmEraSkq8Zg/36G6d0bLg2IkfPZm8VmNnKVFh69ClQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Leab09+bzq5znpAUI5jSuBy+z9S0rS7msqeZJPBk6tM=;
 b=sQMZqOamG0XR6M+s4bUA0xk3K9XZcDaeBnsc8k3Qrb74uOtmuyfcsInVBiCtAgXtGU6QTWXYks+O3czFPAcV+BLPn68ye4b0lNPgbB7xpm+UFHDYrKPQhn4m+zIKV++KGDAyFz8lSlPPgTTJftpLKM273NTA2rair5QKwWG73pQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v4 1/3] build: include/compat, remove typedefs
 handling
Thread-Topic: [XEN PATCH v4 1/3] build: include/compat, remove typedefs
 handling
Thread-Index: AQHZLBnwSejHh1Foa0mZP15rWae6566nn50A
Date: Fri, 20 Jan 2023 18:20:45 +0000
Message-ID: <06ac9828-0b20-fb8d-7d39-3663365d082a@citrix.com>
References: <20230119152256.15832-1-anthony.perard@citrix.com>
 <20230119152256.15832-2-anthony.perard@citrix.com>
In-Reply-To: <20230119152256.15832-2-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BY5PR03MB5249:EE_
x-ms-office365-filtering-correlation-id: 7c52f035-6b7b-4015-cae6-08dafb130c05
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 dqgrIfwvG5YJLa0xZSK/bnfhroaBlwDcYZ/aoDOQtbBJsVfWraXhx7G2prPqKBAutDv5/2+QiwujjFx9i5yjnRkCCvn+ByIFK0+Oyq4PavR7a8CrbPR0ZO+3ig7LlokZNgJIllAK++nXczlFqT3FME6GIo8xPnFY/qQiogtLvDZhhIvL27HDTvJUWdqvN/Y8WCSqPlYEG6tFTUouHKLGWVu3R9Rq6ArXqmQi5DZobTBIF1aQFWTD6wKIfGS/xIdTl6iqKzAcdjayseM3TpgOktAhY9PnLP7f4P0qWL1gXZIwzBhToMHxM1QPTd9Djcm8XzDuq0q+SncFYNz5qVLz5LlhgkDyXL0qlMeM4xPf1glrxtFYCDOD961YpQaL5dNUKoNA7qVe4j0bl3tO6kNnIUdhTCqwr21f89cqPnaG7rEtPwpIvX7SNw2nkDWEl9BDaVD0HCmSoNZPnGfrUM3MdegWn7o0hcpCy25jop+pZrCyDPnsLPQz2SZnhLeHnqhbdsZvSuw5f5HmfcGUCDX6cnn8MFifcrBCgsmhClUx/23xK+4wu7aQB7BrhwVoPYD4BeOPLxnIpeB4QtnlAhP8py5iV7MTUOJzJfFZgAdATIWhS5BQpqB1KoCPowHa5jkBMDgCSIRDSIRCU/KEgKPd4DIKw/k9KQYTAsdFwkzA3ZKoWfyCdnHj+11iAOezmfCMHdrO3pX9gDeg4UsRUXfqLQII68ZPOLNVlMlDPnl6eksCuY7QekrrwXMhdVfQptwtA7tQ/YJFM8S60KJ3wzAMDg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199015)(8936002)(66946007)(76116006)(91956017)(5660300002)(64756008)(4326008)(82960400001)(66476007)(66446008)(36756003)(558084003)(66556008)(2906002)(478600001)(86362001)(6486002)(71200400001)(41300700001)(316002)(54906003)(38070700005)(186003)(26005)(53546011)(6512007)(6506007)(31696002)(38100700002)(122000001)(8676002)(110136005)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UUlrZnAwTE9iQ2lEb1ZsK1JLTmVKRzBNS1hBdG56T25GSEVJa1U3MFFSTHVR?=
 =?utf-8?B?NDBSNzc5MkJ6VDU2KzMrZ3ppaHI1YXJFR3c5N2JlWTlZR1dSZU1wL1JYTmdq?=
 =?utf-8?B?Ui9HVWxaNm5lVEg4aDNETHBXNFY1dTBxRXpIM3hCODBZcDVkRzl1SjA5NDdQ?=
 =?utf-8?B?WXgvVHZEZEl5cUZsZnR2eFE5RWthbkc2UjU3RmJFeHcvbkp0SUZ3bnNKN1V3?=
 =?utf-8?B?Y000OS9EaU9wT0pSNDMyTkhTRzVpMnhHTmZrc21MY1Q5S3BZMDhIdkdxRUhO?=
 =?utf-8?B?MEVqR2haRG9WeUZDZ1lLcW1kUVg1TC9wZlIwL1RQUElNZERhUFMvWk9wY0Ri?=
 =?utf-8?B?YVlzalR3WXhzdlovUUtqYVhiSk42ZS96ZkYvaWdId1RjejR4UkpncVY1TStq?=
 =?utf-8?B?akovMGF1blZpcDRqalNFeVRXMEJjczY3Tyt2QUR0UmErYkZuNGEwMkV0UlhE?=
 =?utf-8?B?TExEdVNqUTVZVzVhOHhwTXFKRE9PdXN3VDFjeUNXV2U5MjR3VnlZaVYraFQ0?=
 =?utf-8?B?VytMRW00UllRUmhNU200UVVnenFQZEZlMTlKbGZsY20rcDBaQkVraFczVGc5?=
 =?utf-8?B?b2p2aGJGRTdpeTl4Z004RmRVVHE0WHlrL29DLzI0cW1jVTZsc1Rqc3c0VEo3?=
 =?utf-8?B?TkIzbHdSc3FzTDMzaDBvL1JuLzFjVmtxS1ZVWTdCSmVyblozTzRySnhORGZF?=
 =?utf-8?B?NmxncFJHR2h5S0lEYUloRStteFhYSmRTWkpBbUFDVElUNlQvQ3owK2pIWjdq?=
 =?utf-8?B?SXVidEV0ODhOaEZwSk50ZHROcUVXSy94bTZQRkdURTFTSXlrVUdBTUxRYS8r?=
 =?utf-8?B?eTNLOXFLSDdhSk5PeHYwcmhvQ1dNMDh2MDhuNElMdHFveUdXQTg1TXdDY011?=
 =?utf-8?B?NnRjL3lmRFhlNUdYTHg5SGhVL3JIdGN0RzExUmcybnVxRzBnQXdOZVdab0FN?=
 =?utf-8?B?TEQ0RkNzN0lPTUVEQTlmMjArc21aVTFrOTRSQ2RlRmtlZFU3ZWV3bmM2VVo2?=
 =?utf-8?B?ZERBMG5FTGFLeUZyRnNSdThRZ3JvQ2RKTlpvL1dYUzU3aEdoMmZEekY1S25z?=
 =?utf-8?B?TVQ2bWEzcnZTQmZUczB0VXdGaDJlMGRPMzFzOU1xNzZkeXlrZDZqSUdraU5G?=
 =?utf-8?B?TlFHUnZTc3BRSW9hMjBXNjdUTEFwWlp6SkpheWV1dFdoWWlZbTd4alBmNmJF?=
 =?utf-8?B?cTU0c2V3MGVGVENEWkRXekllRnhIRmJKTm5HWW9Fb0cwS0VocHQzTG5XMHdG?=
 =?utf-8?B?MFFyYlBiM3VtUWlyZ2JoR0d5Z2JmMW94WUJTRktVSTBTeG5IOENVMkIyR0Rl?=
 =?utf-8?B?YW1NdzdXcFRBbzJrdFE2Ym9jQklRSjQwMVlNOWlwdWtQeGZHOVJpK05IbWtR?=
 =?utf-8?B?WmJNZENrZDVZV0xQbGFtelJCNDd3WW0yN0hZTC9MSnA3WHcwNDBCSzl4ZUJx?=
 =?utf-8?B?bTgxMVJrWUwxQ05LajZnVUxtbzdMTEl0Z0RXTms3Z3g3cmtuNTkzdDVRRGZ0?=
 =?utf-8?B?dzF3NFhvWU5qN2YxSG5UK1dnY3BEWGllOXV3QTB4ZFhQRHljcTlPWUpOVWtX?=
 =?utf-8?B?WXM1QkFFbmlBekp4cFhoYnNRMEQ0bFl3NmtJSnBLUjJyMjExRWd1MXhrOSts?=
 =?utf-8?B?bDRjY0hLSXV6M1JiODlyK3lzODdFRjhROWxxaUNDejY4Tk9ydFJnTzZiVkRt?=
 =?utf-8?B?QWJEUHlTektKM2pWUU9OS0xoK0JxbThtRC9oODN2Wmo2T3R3RXAvZkQ2SHBq?=
 =?utf-8?B?NVp4ZG9JQ1hkQmRKSWtjdUM0bXFMSXhucVRPbzg3TFl2QW9hdk1JaFBoQllW?=
 =?utf-8?B?bTd2aS8zUW9NcTc2N1J5MHFTTFVrdjlad0JIS0s3d1lVbFBGMVRZUVZGTGJF?=
 =?utf-8?B?WDdqTjh1U0pzOTNrUjcwa3N6YW1IMUJHSmR1akkrN3Z0TG9hbUsrS3ZQa3N4?=
 =?utf-8?B?c2N3UFBRbmd1dStKaHBlQWVDUm9JSWJUMTgwQmk5Um5nZXZ2OTFIeTRMdUxt?=
 =?utf-8?B?TE5IdHdaT1Y2UG9DT3JsN0gxd1JKRU5CbzhKRTJCZmtYaXJtNzRLOXdtTzcz?=
 =?utf-8?B?WlVUa2x5VlZsc1dLYmJYMDQxZXlwbElkTkNReTFwMDcxeHNoaGk3YWJ4Um80?=
 =?utf-8?B?bU13eGxNYllyQkNmVWEzRGc3NzhXcXFVSVZSZWVJQXBNTGJVZzdKZXFXRTd0?=
 =?utf-8?B?a3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <480BD9E07E38C3489368FC38202C57E2@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nGQS+OqjEDgT+BeSrlyj6xr6u7hhZ6j3OHyplMSUHz/xv+Pyl35DF0I0z68z52c+Wgj8O9BEZ0K76Dt0EfK4KsWI8l8ZemdYn6qQObhuJp6pbgq7q8wJiFx20o2OLJpwy1Sve15/qRfAmFvpOcdi+vx2h+xwiqb9THbSA6YwZ1wxo25YwyWR3SbIbJtEh/7i8Zlktk2bOIvv1Pb3EP2JGEwyDbVU10otV1PgJ0SisxQgR66Dubpp3dFA9ZO11K+Pc8A8O/JxEDVgNfe1qXHzy7oqq0oUt9PSaVSaalsrJQzmYKGQyf+AV/pGuLkn424kVy/KKMkrw+JokbNikdKguRaoVF5As0lK2hvt+0biaKDfhY6X6LOCRYBeI6rWQ96A5nWCuJM0Z7JHL7NRbghcbwzScwey/2vtd9vKQYaZVo4ng4XPu/acn1U4HM6XRZovMLOrl0G2pFl55aIq4mpdIp2HURetmUq53fPgGeeW7zUzDTIhMvk1zSlSdllWrbwkp1BuroZR6X6X2EfJqjv5aCq7AfYMtH8V04cYEgvgWf6TM/WiGTOkxBRPfXl1g26X2Juhuqa+LD8t/AyxCDRg1nXYRnct7rofLlb3KirpRSYiKFjhmtJUbQVkTQdfIslaTITxcPHcXykt9pilCwClkpb+chrj36Dpc1/562T16dUdQVdD/wYE11JC6Z8LPPTPXnx7BrJCNt24NdmvMj+sUsNMt41Cqsu/TySl3w3ncRs8ss4fDaWjoXyz56NHlN7iz8n2EU4Yer78mpx21tFIwC+QMbXyMKStlks0J5krQypisnANK9NSTyUsya1nwxkhKZ/Xhf5PNnrwjYGSCMMsBFhIkOU0Kzs3GH1xVAvW8lY=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c52f035-6b7b-4015-cae6-08dafb130c05
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 18:20:45.0690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nBxu4h64OiyaIoytuZ9vaXasePzVDr5U6BaGhxmkTBh13sbG4sLiu3ORyM/FoL985l41C9qoRzoUPZAWvzy3X8YIQZf37hIlDU4B7tDeClU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5249

T24gMTkvMDEvMjAyMyAzOjIyIHBtLCBBbnRob255IFBFUkFSRCB3cm90ZToNCj4gUGFydGlhbCBy
ZXZlcnQgb2YgYzkzYmQwZTZlYTJhICgidG1lbTogZml4IDMyLW9uLTY0IHN1cHBvcnQiKQ0KPiBT
aW5jZSBjNDkyZTE5ZmRkMDUgKCJ4ZW46IHJlbW92ZSB0bWVtIGZyb20gaHlwZXJ2aXNvciIpLCB0
aGlzIGNvZGUNCj4gaXNuJ3QgdXNlZCBhbnltb3JlLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbnRo
b255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4NCg0KQWNrZWQtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo=

