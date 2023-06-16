Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CECCE733A1C
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 21:43:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550381.859427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAFM3-000196-Ko; Fri, 16 Jun 2023 19:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550381.859427; Fri, 16 Jun 2023 19:43:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAFM3-000167-HC; Fri, 16 Jun 2023 19:43:31 +0000
Received: by outflank-mailman (input) for mailman id 550381;
 Fri, 16 Jun 2023 19:43:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4sU=CE=citrix.com=prvs=524b4a1dd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qAFM1-00015l-Lp
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 19:43:29 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e96bee3-0c7e-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 21:43:26 +0200 (CEST)
Received: from mail-dm6nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2023 15:43:23 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB4959.namprd03.prod.outlook.com (2603:10b6:208:1a3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 19:43:21 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6500.029; Fri, 16 Jun 2023
 19:43:20 +0000
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
X-Inumbo-ID: 0e96bee3-0c7e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686944606;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=A5NjHm3gt+ChQ3yuJcEaOQ7J6Gtoz1QE7BwOJNDPvT8=;
  b=K8mv77nMnbUKQI4ox18TRJFC6W3xbur3pyMds44GV+7ppdt3XwxVuQIo
   mCG8kbhCVNfjEvitoHhKf6oHulzhO9XEvhkrHUUQICpkrxfJyL3DNQogY
   0mMKjChh+k9xo2xRf+BbTipNbZ3wFDgBDZ2zqBxPVnHgi/omOpaoLFq5I
   U=;
X-IronPort-RemoteIP: 104.47.58.105
X-IronPort-MID: 113519403
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:GGSD7KBV4DabnBVW/+niw5YqxClBgxIJ4kV8jS/XYbTApD520GZUy
 2YXXTjUbPreYGqnKd0gbty08E9S7J+Hm95lQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G1B4ARlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw2u17AkVz8
 90hIxMjNhucn8WfybaKRbw57igjBJGD0II3nFhFlGmcIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9exuuzW7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraWxn6iCd5KT9VU8NY3o0KpnlIfAydMUACfoNCoi3SPWeBmf
 hl8Fi0G6PJaGFaQZtD5Uh+xpnKeuVgCUt5UHu89wAqJzbfYpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRuwMyUIKW4JZQcfUBAIpdLkpekbkRbnXttlVqmvgbXI9SrYx
 jmLqG0ygusVhMtSj6Gjpwmf3nSru4TDSRMz6kPPRGW54whlZYmjIYu19Vzc6vUGJ4GcJrWcg
 EU5dwGlxLhmJfmweOalGY3hwJnBCy65DQDh
IronPort-HdrOrdr: A9a23:z3Kd/Kgfe4ebgyqgOkUg90UlvXBQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-Talos-CUID: 9a23:l60qxWzr9sbS2Tc25VLdBgU0EcwmVkDb7U7bAGHgAnlxb5ScTW6frfY=
X-Talos-MUID: 9a23:PIiWJwkz6XZzJOD4rAx8dno/F9hSu5qiA3pXlM4iuuCVNBZBOQWk2WE=
X-IronPort-AV: E=Sophos;i="6.00,248,1681185600"; 
   d="scan'208";a="113519403"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pg/navPRWRw1A5GYtim9/yIOjQ6VQit7PMaqA8e//3F1e9Yt42mAbXlwJ0YGhk03Zp0bMWHpIb546zKkKiHb3p2CXZNjyvO/AfXl1Fzikn/r+gk7QLmY9E8HkRlDVuJghVhxTQjhbIzXCDhV3h3KR3JMDz9ib7wh+FXsSYTO0p4HVkb5IQO0c5apZCXkUQngYCLlexdtz/Eymzbqu1IWvu0XlEcQz7iO+FV4thmq/aAkPgCopMm6nETPNJdb0W0nv5VH5kltXT9zVaP5a7ShU01dPhaU3usTBOSafaGI0juu4yIyFEWNdThMt5g5eMmWmsu3yXQKDPKa64pRRrU5cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDaYED4IRlGS3YbCLDGiQK3+y0vatorHAbYvkdhSWeM=;
 b=M7uS2dzkbBdjat5cefhRsTUuUqHrg/Q6xZWj5t+PSewwFmxHVBXGZHRIPlXMN4I3ebZ5tDL8sbosSg/bNU+VDrAquhWWy9NJsRcD6BkCDDCwovyL6yop2Ob7hWWXDULY3gHie8cQ1CgMTcHsvaRoIPKftzROydvv8m4FstxNMGMZJbqkT86YSF188C1JbSTLWk3TrWzGKHRt9qANRgwdhDvTfvs2a3ux+wk9tiNUWlJ6nty7FKwADTgglvWySA2Mi3LL3AiOsu0Y17pq+AM77KWfWn3FXIiKweWGcFE2o28K77iq7VlLq3YKXm4/Zksx/YozsJu9hnQEp8UEExQvJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDaYED4IRlGS3YbCLDGiQK3+y0vatorHAbYvkdhSWeM=;
 b=A3/ZDurDykD8sfidFNmLsJVfCR4I7a6Gzq8vEXZAfCxa9+5yXjfowVVRC4UvczYY2XAz01pvhWqkF4YNxUFcQV+mYAo1+56Hp1s4nh+m9et5eCc3lUVqNZXd0oKEyQcEuCYBw2/IstPen4BKSmoCcXFpoy+9Q0lZ7SorOCD5rq4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b254f8ce-e894-ffc1-c7e2-af69f8ee3529@citrix.com>
Date: Fri, 16 Jun 2023 20:43:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/2] x86/boot: Clear XD_DISABLE from the early boot
 path
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230615153157.444-1-alejandro.vallejo@cloud.com>
 <20230615153157.444-2-alejandro.vallejo@cloud.com>
In-Reply-To: <20230615153157.444-2-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0105.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB4959:EE_
X-MS-Office365-Filtering-Correlation-Id: 984392ea-5d98-49a0-9d40-08db6ea1f041
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nqEI/DWeP2MrUnu0Yr1FeGbR9wMgpb7Dybq6DLZQrS9uQCA/IDy1aN/65k6d6g9MhRDME8wfzu6W64ZCGa/tJSIBZVuaE66RXtAoLWB5Hn6gbsMrGWBRcmM819nIPsd9fUjeMJLnOX0kWeSn8BnJpwoxR/a9CSdTs096COZpe0KoJoO9FCUn+LGhXcomjl1qEhDrRaPcvtvDmjdHsduLTowF7hM2L3h6rS5m6I2VeK5wKnQK5TNnOMzkhZH1/1O8yRp6C00C//qxInjwTMn+SMT6tFqUV8ptpvc8LObFqmDWbtHIX9nmXs9lxyaHT9BzuinbCPhM+nHKJPo3yriPEgg/cH1ysAEHkCsCMdZAwIjJW5jSzopgyUcVcNPlWELh+Fa2y6EjyIYEhMc4CPbQUTAcSq5jI5uvjZ3ihcbKNmiVskjL5ss1MwyF5do8qF061GN9witxoYb0Hjzgdw0p+JO2l3djR0mCg1tGo5ku5nbpf0Md/6ZmjJlLOy0Zq7PjQzG2Nas2v2QBpgy4k9jGn1ytn305t6XA9Y7WJ+sPi3x5HUtUMayjPD5Jr4VZ+LPIHR/VyrAQIk7zUBc7FitmQMQ34tTiQE8sKm1c3oz2orX+RQ0OkK/fQhk98YUNQQhkDmFagZl1i17K3G4Y//mw7g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199021)(508600001)(110136005)(54906003)(6666004)(6486002)(8936002)(5660300002)(82960400001)(8676002)(41300700001)(36756003)(2906002)(86362001)(31696002)(38100700002)(66476007)(66556008)(316002)(66946007)(4326008)(26005)(53546011)(6512007)(6506007)(186003)(31686004)(83380400001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFJVK2R0U2FSMHFMZzNxaUVzaHRtUXFXQkxsb3I2cWk0MEEyNHV5NCtzQkk3?=
 =?utf-8?B?eTNhaCtYZG9GU0FualE0Sy9iOEV2NjZhU1VSRkJXeCtNRk1aS2g4Zk1NM2xx?=
 =?utf-8?B?MjhqVm1rVDZFUjEzSGJJa3h4V24zM1llOEhNRmxscjFBUFlwSWxHOTI1RitE?=
 =?utf-8?B?amhrUWQvWlc0TkVwVzVzZTNCdU9JRGR3UnZTT2hXY2FYaHpYUkFLVk92VnBD?=
 =?utf-8?B?ZlJjeFY1eGtiaUYvKy90b2RuWFNwN1hKUGNCN2o5WHBTZUZmVkFPM1BMY09S?=
 =?utf-8?B?Y05HTjNENGpxcGJKQUxmeWhRNXZIWlh4SWJUZWI1Y3l6UGo0SVJGak9XLyt1?=
 =?utf-8?B?NFZnM1liNWZ0MFNUWjRVNE5hZWJPNVJ1Z0Z4dmpLcDVwTHdTTkNuNDdXZm5p?=
 =?utf-8?B?U2JFUG5uM29ndmRBWEJ1d2xscWcyM09oR25kQWRlY2ZuaUFHbnFjM1BHak5i?=
 =?utf-8?B?STV0WXhNeldZdkxLY0xKenZnVTVVYkRPSDBkczNQanBaS2xhK3g5S0FtSnpm?=
 =?utf-8?B?U29Zc2hKOFhab256YU1xZEdaSFhONjFkbE9aaXpuYmpvblhUYkwzT1h2YkNH?=
 =?utf-8?B?em1ReFdnSEZsaU9FdnV4Yy9rbUptWHZLN3IyNVgyOHFlQ3lwa1RRRHAwRDRV?=
 =?utf-8?B?eGE5VUlUUmt1TGordUFYWE5QaDZrMFR4MkN2L0tmbVMyV2svY0ZpOHpRckhv?=
 =?utf-8?B?VU1yejVSZjhrOU9iNWtQZ1p0SlM4Qnh3VVNjcE5jM09SOE9hV3BWcVpKUFdq?=
 =?utf-8?B?bk9xa1VCbmx5N3RUNjhDRll2emtuMG1HNmdoWGxoU1lCOWpjSXgra0RkOXly?=
 =?utf-8?B?VzVFbnZVc29hYVRSUWlscnJiZDlCVnJuejNXeDFQRzZTdmNnRVl0YXI1ZmJ1?=
 =?utf-8?B?UnFGa29CUkZPQ1EvTjNjb1l0Q0srVnNWNkN2dnY0SjJOQlR0RC9ESTJueGdu?=
 =?utf-8?B?VjBWTnh4Qlg0NGdxWk5JVThZMXVBbXZwbmlFOHR1SVlKVXlYMjVRelMyOWhU?=
 =?utf-8?B?dmlsNDl3Wjhxd0pCcjBGU2NXOExMTmtpYS9nQmFZaGF6cnA3NTdvVWw4R2pR?=
 =?utf-8?B?S0tCdnlOTDN5K21aNmJZSkg0ZnNqalh1dTBtajZPYjYwYVk1SVdlU2o4MUFY?=
 =?utf-8?B?YlVDNm1NOUpYMThlM0hITC9BcXBUb2J4OGVOZW5jOWhVVXhQVGJxQk1UR3BG?=
 =?utf-8?B?RTUxV09sR285RmhYeUNaM2xPbW54Z3o1eHRuQkhOZ3FNR2NuakRxRlhGd2pX?=
 =?utf-8?B?QWlUWmtoNTkrd1ArdHNQNnhDcEpKTFRRallTZ25KUE4zVXJ6SHZ2Qzg3ZGhD?=
 =?utf-8?B?NExTRmZNZWY2b1JjNjJCZlp6eGM2UTVJcVo5Zmt0K09Qd1RQb0k4Wm9PT2pn?=
 =?utf-8?B?UUQxa3dubFhZSXN5ZEw2cnYyQm0vNm5lYXBkZzNzeHV3Wkx2WkM0a3lrVHVN?=
 =?utf-8?B?Nko2Wmt2Uy9zSHBPZlVkNXdJMG8xcXNqalNPS2xFOUxjZ2x5RWtIVjRCT1VB?=
 =?utf-8?B?NTNTb0JOZ2JCVC84ejI3QXhSV2s1RUlQT2dMVjl5UlBnempBT1NBdXRLK1lP?=
 =?utf-8?B?VmZTeUd0K3dOemRWbklaUjNZWldKTjF3azRZWHk5bGdtWFI4bDNLUlUvYnRZ?=
 =?utf-8?B?MXhDak8zL25uN3hSQXZLNFBYZ2JGUW10b2RSSHJvcHFpZEVlY2Ewa1JPV3lX?=
 =?utf-8?B?M3loaHROZUFlcFQxVVN3MGZYSUN2Ly9ydElqU0x1U2dTUy8zZVhJWnRjWFNi?=
 =?utf-8?B?NzZHVEpnU3lOSWtPejJ5bzM5RklZM2p6eUltMzhrNmhicW9NbENkUlR6MHZr?=
 =?utf-8?B?MHhvOGdUM2t0WjJtcVBpTzZtbi9vamRCbzZwMXk4VVB0d0JIaStKZ3FTbHJ5?=
 =?utf-8?B?YVBVK0cxeWl0WUJqR2x0MlN0Tm1zSlQ1NHEvdDM3K0czR2llS2lkY2lhaDc0?=
 =?utf-8?B?MVIxWUNXa0FvVWhsVk1jMDIvcHZySm1UMTJObFVDL1IzZXFFM296clhWcEJv?=
 =?utf-8?B?UkxHS2FaQm13S1FaU0RtRExPV0JYKzc2ZDJsdEw3MDIvR3hXOTZ4aWdiSm01?=
 =?utf-8?B?Y2drV2M4MFBKT3o2cFlkSVNsaUhJK05qNnZqcFlBQVFLTmJuTUhrejNRazRE?=
 =?utf-8?B?aGRsQThDeUhBbCtjTVg0Wkp0L0oyNnNSeTJuZTd3MFJMYVU5UHFjQUtydHEw?=
 =?utf-8?B?N1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ENk8AXtEBA3GY1+zpjPhjYapyXdsKUCgrCXp1mO468wduJSjeHHxa91bxEe5R9kS0UD203T90dOBx9aVLnf0eQyu3PpwJeSb3ISQerWGq62c873jIFWRTNORubIyPnp29kY2BpMtFqCFkmCm+I0tTXjG47wRfCtzKf1QmLQHUxiTEu14nx09UBp/lsOs+tfor2F83cuADjWnBauyRbXVUFIFrf+/to0DGNWLgRzKcxBVFnDRGPogw+8tr4Lloos3wmeqpufAq/G6CQNjfeGB7V1sD75Yg4KrckAN0PbtZl+rtsGhqOHhUKdg9KrSiOiikO+EDoeQRY64PdUuNiYidT17X647X2ChAYsz1c5JFWeIEM1ANpcbxuUVFgJeZr/2ClirwkOPYv0usQtIyLojoeBLF8UG450d/TtwBNKo4t/zvBor0B+HfxYlpI9M7YeqHIPHuvQEknNvkK+GnfLE8Cd9eaGDPkJd6SDMrjO8RVblA+0Eon+NDSvV/ZsK7NjAO1rXhohNftgf38JK3gAvYin3tbZc/kLlrbplCYyHxCx87pYhWe5XXtzciB8yLQH2THNJiawLR2UcGcODgUd9fNo4gE69HkA0+4NiOfx096ah8F14TiWrrB3nZvsp9ddddUvPnEtRwJh2sJD2zigEHdErplItKovF2MChKm29G23bUZPzsLcxSD6QoEuFhm5byvWFkTHZ2ibzDyWITFYWaG7XNMrfc1bXwu3f9I1F6KcCGgKqI01i8zZVuhceD0MZCuk1bx9/rTE93/YxL8NtfEQR+3WDNu+Wq6Z8LXsev7QjW4rF8ZHokSxOK59yu4IvL93KHSFYx7BOgFrXqJc9+f/zHdIUMKdskzrl9LNBefw=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 984392ea-5d98-49a0-9d40-08db6ea1f041
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 19:43:20.6093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEls921Z+8tU31xl3IIX09MooBmQrrNJdiz5l3Z74SlP+vJ4QFlsc4DO0kQDaTDRO5edp7yUz2EGqqomYyklTpn+XUXU9qPq74jQ8lA1fW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4959

On 15/06/2023 4:31 pm, Alejandro Vallejo wrote:
> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> index 09bebf8635..ce62eae6f3 100644
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -142,8 +142,8 @@ efi_platform:
>  
>          .section .init.text, "ax", @progbits
>  
> -bad_cpu:
> -        add     $sym_offs(.Lbad_cpu_msg),%esi   # Error message
> +.Lbad_cpu:
> +        add     $sym_offs(.Lbad_cpu_msg),%esi
>          jmp     .Lget_vtb
>  not_multiboot:
>          add     $sym_offs(.Lbad_ldr_msg),%esi   # Error message
> @@ -647,15 +647,59 @@ trampoline_setup:
>          cpuid
>  1:      mov     %edx, CPUINFO_FEATURE_OFFSET(X86_FEATURE_LM) + sym_esi(boot_cpu_data)
>  
> -        /* Check for NX. Adjust EFER setting if available. */
> +        /* Check for availability of long mode. */
> +        bt      $cpufeat_bit(X86_FEATURE_LM),%edx
> +        jnc     .Lbad_cpu
> +
> +        /* Check for NX */
>          bt      $cpufeat_bit(X86_FEATURE_NX), %edx
> +        jc     .Lhas_nx_bit

This part of the diff is far more legible when rebased over the 0.5/2
patch I've just emailed out.  I've got the rebase locally if you want it.

Although I'd suggest that this label name be .Lgot_nx.

> +
> +        /*
> +         * NX appears to be unsupported, but it might be hidden.
> +         *
> +         * Intel CPUs (may) implement MSR_IA32_MISC_ENABLE. Among other
> +         * things this MSR has a bit that artificially hides NX support in
> +         * CPUID. Xen _really_ wants that feature enabled if present, so we
> +         * have to determine if (a) the MSR exists and if so (b) clear the
> +         * bit.
> +         *
> +         * For native boots this is perfectly fine because the MSR was
> +         * introduced before Netburst, which was the first family to
> +         * provide 64bit support. So we're safe simply accessing it as long
> +         * as long mode support has already been checked.
> +         *
> +         * For the virtualized case the MSR might not be emulated though,
> +         * so we make sure to do an initial check for NX in order to bypass
> +         * this MSR read

I'd suggest reordering this a bit, and swapping some what for why.  How
about:

---
NX appears to be unsupported, but it might be hidden.

The feature is part of the AMD64 spec, but the very first Intel 64bit
CPUs lacked the feature, and thereafter there was a firmware knob to
disable the feature.  Undo the disable if possible.

All 64bit Intel CPUs support this MSR.  If virtualised, expect the
hypervisor to either emulate the MSR or give us NX.
---

> +         */
> +        xor     %eax,%eax
> +        cpuid
> +        cmpl    $X86_VENDOR_INTEL_EBX,%ebx

Where possible, spaces after commas and without size suffixes (the l on
cmpl here).  While not relevant here

> +        jnz     .Lno_nx_bit

The "_bit" is still redundant.  Simply .Lno_nx will do.

> +        cmpl    $X86_VENDOR_INTEL_EDX,%edx
> +        jnz     .Lno_nx_bit
> +        cmpl    $X86_VENDOR_INTEL_ECX,%ecx
> +        jnz     .Lno_nx_bit
> +
> +        /* Clear the XD_DISABLE bit */
> +        movl    $MSR_IA32_MISC_ENABLE, %ecx
> +        rdmsr
> +        btrl    $2, %edx

It's unfortunate that we don't have an asm-safe ilog2().  Oh well.

>          jnc     1f
> -        orb     $EFER_NXE >> 8, 1 + sym_esi(trampoline_efer)
> -1:
> +        wrmsr
> +        orb     $MSR_IA32_MISC_ENABLE_XD_DISABLE >> 32, 4 + sym_esi(trampoline_misc_enable_off)
>  
> -        /* Check for availability of long mode. */
> -        bt      $cpufeat_bit(X86_FEATURE_LM),%edx
> -        jnc     bad_cpu
> +1:      /* Check again for NX */

Failing to clear XD_DISABLE wants to go to .Lno_nx, not to re-scan CPUID
having done nothing to the MSR.

> +        mov     $0x80000001,%eax
> +        cpuid
> +        bt      $cpufeat_bit(X86_FEATURE_NX), %edx
> +        jnc     .Lno_nx_bit
> +
> +.Lhas_nx_bit:
> +        /* Adjust EFER is NX is present */

"Adjust EFER, given that NX is present".

> diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
> index 168cd58f36..46b0cd8dbb 100644
> --- a/xen/arch/x86/cpu/intel.c
> +++ b/xen/arch/x86/cpu/intel.c
> @@ -305,23 +305,23 @@ static void cf_check early_init_intel(struct cpuinfo_x86 *c)
>  		c->x86_cache_alignment = 128;
>  
>  	/* Unmask CPUID levels and NX if masked: */
> -	rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
> -
> -	disable = misc_enable & (MSR_IA32_MISC_ENABLE_LIMIT_CPUID |
> -				 MSR_IA32_MISC_ENABLE_XD_DISABLE);
> -	if (disable) {
> -		wrmsrl(MSR_IA32_MISC_ENABLE, misc_enable & ~disable);
> -		bootsym(trampoline_misc_enable_off) |= disable;
> -		bootsym(trampoline_efer) |= EFER_NXE;
> -	}
> +	if (rdmsr_safe(MSR_IA32_MISC_ENABLE, misc_enable) == 0) {

There's no need to change rdmsrl() to rdmsr_safe(), and not doing so
will shrink this diff a lot.

The only thing you need to alter the re-enable NX printk(), which
probably wants to move ahead of the "if (disable)" and source itself
from bootsym(trampoline_misc_enable_off) instead.

~Andrew

