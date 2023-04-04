Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA036D6741
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 17:26:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517978.804052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjiYR-0003i0-Ke; Tue, 04 Apr 2023 15:26:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517978.804052; Tue, 04 Apr 2023 15:26:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjiYR-0003ez-Hf; Tue, 04 Apr 2023 15:26:39 +0000
Received: by outflank-mailman (input) for mailman id 517978;
 Tue, 04 Apr 2023 15:26:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oy2y=73=citrix.com=prvs=4518c43dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjiYQ-0003Zp-4t
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 15:26:38 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15526ce0-d2fd-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 17:26:36 +0200 (CEST)
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2023 11:26:31 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5214.namprd03.prod.outlook.com (2603:10b6:208:1ef::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 15:26:29 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 15:26:29 +0000
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
X-Inumbo-ID: 15526ce0-d2fd-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680621996;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=79+mPpvknChuWzV8y6U2VYX1RyXjcvvfH29L6m9w3ts=;
  b=YCAD+cEYBXPwVSwaWBetc3AcYCO7JOoFez5op14Nd2Ed4ifsd8I4j95z
   zmZH9ho5vHTyDhzdajobh5ohEdab3A/q7rqm6XZHVRXoCvhMhYSygu12B
   kNY9OgIS3rerZ1A8hhmwEOZUFwc6cK0L4/bSEsaxHVdG3JzSuytXVeNEr
   I=;
X-IronPort-RemoteIP: 104.47.70.109
X-IronPort-MID: 103655417
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Fy1c164aovCxN1kuoSSZqQxRtBXGchMFZxGqfqrLsTDasY5as4F+v
 jNJDTvSP6vbazOnLYogao/g8UNVvpbRzoJnSVY4rioyHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPawT4AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5my
 v0mIWocaCm4uv+7xqqeGrJe1s4CFZy+VG8fkikIITDxK98DGMiGaYOVoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6MlEooiOmF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtKT+Plq6Iz3zV/wEQPEQEtdGO5/MWWyUfkWMt0K
 3Y++yMh+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6GAkAUQzgHb8Yp3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqWMMfZQ4M4t2mqodsiBvKF45nCPTs1oyzHizsy
 TeXqiR4n68UkcMAy6S8+xbAni6ooZ/KCAUy4207Q16Y0++wX6b9D6TA1LQRxa0owFqxJrVZg
 EU5pg==
IronPort-HdrOrdr: A9a23:RovSx6DlQGbH3GHlHelc55DYdb4zR+YMi2TDt3oddfU1SL39qy
 nKpp4mPHDP5wr5NEtPpTniAtjkfZq/z+8X3WB5B97LMDUO3lHIEGgL1+DfKlbbak/DH4BmtZ
 uICJIOb+EZDTJB/LrHCAvTKade/DFQmprY+9s3zB1WPHBXg7kL1XYeNu4CeHcGPjWvA/ACZe
 Ohz/sCnRWMU1INYP+2A3EUNtKz2uEixPrdEGY77wdM0nj0sQ+V
X-IronPort-AV: E=Sophos;i="5.98,318,1673931600"; 
   d="scan'208";a="103655417"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CmeBLmSo8iEfGAX3TVuaJ34sj3E++BLrRrum8Z3kVjU4sNFBdGQlkblGN1rPb9lpzHzvceWb1kYxq57sen5irYB7xbOPZ6EIHionwOCbkcu15APDwfBdt4kSwjjBm5dzQ8HyHv3kKkdySjf+uo2tX1fsQnlSqRwV0RyZypzHuv9GA33wIK/J+4xxRN01fjUjADrfj1E2LwqrvLO9fPxUyvzouU7IPWVfdjxq75/esbdTBrGeth0jo/RepqIslP+wN2dAkrqR9ys2IfzwABSWQtQWXzY0bo6yvBAPWn9yFoTalXC0CrOcS9NiHnQBBO5Lft0Itwj75ZsD3yHE6ilBng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z6y40F/Oe0xUll3zPKQlK+LZEkQkCQrpdsfcxvK2eJ4=;
 b=atvqcQmtsorYmY8GzSWFUpzGz3sy4P3lv7rj6flg8Zq19qQBVM8T+XSCZmM1ag/Dg1G8YaKYeI6p7/szcNtHClRQ/+HLOL1ufX1/711k/1f/fiJuU/qGRgt2oMQCUmKaABNyIXasY6RPIoGe+Jvr9BqaH+ppxOZ3bFc7IGjzyuLUBz5SeU8pKkqVZ8UAIHy0o5+dtOKwwp5xkc5jaVj9gew0ZopXknx+5mTalcUR4BScOaHTGuRGoRUwD8GfLzt23Cbd5NRCpI0APlfLpIfbpdfNqGI1Spcby8qImr+/loCehkPN+/SpsMEl+HrOT4DpAn//Ac/92Il3I51dKjEpbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z6y40F/Oe0xUll3zPKQlK+LZEkQkCQrpdsfcxvK2eJ4=;
 b=csrxbuSiUtosL82hT3yP3QCHTuxkS7b1J9wznSzrUCiySvY6Kq6924991JE1B+iPxKbHqM3dA6Fs57fqXueA5e29bjgJdbuVvkXe48khYqxrtxS1ROHx59/ktGt1t408OzfKYNPBaoqmhSVmXPjIynxrkN+UaRjyJT2WvDWI1Yc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ef49980f-1d03-387c-d343-7eb8256b6227@citrix.com>
Date: Tue, 4 Apr 2023 16:26:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 09/15] x86: Out-of-inline the policy<->featureset
 convertors
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
 <20230404095222.1373721-10-andrew.cooper3@citrix.com>
 <63395f4e-2272-5537-190e-27318d4057ea@suse.com>
In-Reply-To: <63395f4e-2272-5537-190e-27318d4057ea@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0627.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB5214:EE_
X-MS-Office365-Filtering-Correlation-Id: 342dad2b-35b5-44d6-4af2-08db3520f630
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9ejMmS5YFhoHjdFUqCErvU1+UL+um3VDUh4VoTrmH8FJacjraSLxqp9GmBDpFpdzXirNOcX+7FMf//vCQUIzyZTlxO+0SyYAeIdsHNB/72YOVjt41VwEZOIPpvfX/blM57Zfckufrkp6o7/iTs0FbIIoOKR6NKP1A83WKmRWw/qStNpSoHFm7t/TULwqcypJZzs3RiD0kEddC1czu2a57VJdPaqTEPW2FWAUncVcRhI1z9iiN1bmLEuM8j0MG94Gsu+kpMNlXzJZs3KHsPtxnY+hsigIiaLAuuPAo3OobS+USrJqgWwK2IOG+TaWlqJDkjucnPy0TbqIVaJ7A359bAnIr8sL4pVR0XlOByVVM1NRm5FAd1VC9nzmItmA2XWaH99w3SR3uI515MITH8iKxrAmTkKCQsHi7A7BxdMpLaTG9mNHCLm5Fs/uTh38/0G7kh+PeKgaS2oV3MJEU+rPXIfc3A6+WAyY4LNscygvitEqUX7ZK4H3ArV1u/z0PsH1QTuwY3p61ly6YH9fULF1oVg8jbH+2pPiwLF7Kj5MuJigFZkRvzFeyrfkOTsyoMoNNhzoEOhcsliH0bogptltlKMjTIxQp0T6gkENcmXP/cBEaYsMg8VrvyTdSdkP+kMWEuTa1l8pOpgVExJJws+IVg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(366004)(376002)(39860400002)(396003)(451199021)(8936002)(5660300002)(38100700002)(83380400001)(86362001)(31696002)(2616005)(316002)(54906003)(53546011)(6666004)(478600001)(186003)(6486002)(26005)(6512007)(6506007)(66476007)(82960400001)(6916009)(4326008)(8676002)(41300700001)(66556008)(66946007)(36756003)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEVMS2MwSUM5U1h6SUdhZWtuMVhhVWhOR1hLKzZSU3o5TTgxYXZLazQrY2g4?=
 =?utf-8?B?ZnVnaitXZTExYkc0blNLZXlNNS9HQnhkZEhzZlF6VndIaGZUb2lMOXpuME04?=
 =?utf-8?B?eUxxSHl1VmE3RlJsdndsLzJBVElNUDZ0UTlicU9aNEkvd1M0bGhHTDZlRUh3?=
 =?utf-8?B?VG9SeXMwZHRlNHZZS1BkczZIMGhIcm1UWUc4NjR1L0E5azg1Qk5raFFOZzZo?=
 =?utf-8?B?SWtkVGlCQVpKUU9iWCtUZU14ZEtJVzB1c09zTGJ1S2FXYzZodXQwblVleWNW?=
 =?utf-8?B?ZmtabWdKRVhlYUZEQ2RTQ3F6bEIxSTNiNnYwd2d1amVNQUxNcldCOGEzdjRv?=
 =?utf-8?B?QzJTQ2luajlOWUdKMXNia1FNSkRBMU1LK3dLbVYwVVpHWERqb3loUit4M2t3?=
 =?utf-8?B?dFJyT1FXRWliaWxPT0hNcm1zcTVhS2xlVWVxWkpYRG9RMFlBVFJLRkpXSDJ4?=
 =?utf-8?B?OWdBMjIwSlVCSENmaVdOclZOTVFGTzZaUE1QU0dtQjZkcC9oSmJ4QTM0dzh0?=
 =?utf-8?B?MFdaTTV0enpZUjljdkxNck9RMkxpdHdIL2o5dXRpdDFBQ2xtb1pYbVpsRzcz?=
 =?utf-8?B?VlF3K25WZ0xyWDc1MXdIejdlYTZ6ZTRSb2RyMklzVEltV245NmFDVG02NTQ1?=
 =?utf-8?B?dU00VVBHQm1TcnVuVm5IWTJ3QUJwdWJyTkoxSGJVSmZQZUNxZzludW9vNC9C?=
 =?utf-8?B?S2NvaklwOU1QSUZNMDlXWXNCeGtiVldlRXNUcWJYK0pYYVNicGRHSk1ZdHBH?=
 =?utf-8?B?SnlFSGhMem5uaTVaZFZYL1JuY3pDOUtsd3V3ZlpCRjhnNmt5VFB0WFVnaFJM?=
 =?utf-8?B?N1lNTUFGa3VNZkpRUnN2RmlGaHJ2em9KMjhoSU9wY3pYWW9ERzRpcXJwWTRl?=
 =?utf-8?B?NjhUaEZNSmxET3hEVys2ZnFxL0NsNDliOUwwWHdDOTZpU1JkUmF0NUdWcDI0?=
 =?utf-8?B?SHVSSDM0K2tCWDEydFd6YnZ2eHZYSUpjb0JLWDhDV0JKOExydi9NajR6M1Jm?=
 =?utf-8?B?SnRhK1hYblNyRUxVRjhDUENwZU1HSHdnWktCNUxiendOMkZpdUM1cjBjTVlE?=
 =?utf-8?B?VmdoQktqdnN4WG1ncjN5VGRxSDZjSGliNjVFY29pNGRpT2FybFJMcEw0RDc5?=
 =?utf-8?B?cUJPMnVpbFErVHgrSHo2a1pNTFNETTZIZ1hpOWJOVnRPVDNzSzRLaWtpRU9H?=
 =?utf-8?B?VHVRZzRHQmxNaXpzNU5YT0hqcHVPcG51Uk5wWWc4d1FIUkhiK0xTem96eUt0?=
 =?utf-8?B?SGJGTXJkNlZBbWN4aW13aVNlSUppMVBPY0lXaVA3VFRzUWNja29FR29qMVYw?=
 =?utf-8?B?U3l4djgvaFYwYy85TkJkKytoQi9HOTFxOXVzT3BmYkxhaFpEcGhyZjV4UFVK?=
 =?utf-8?B?U2F1TGFmNXBxMm1NMExic2QwSE1sRnByQlI0aTAyN0V1dWZmaGRaUHo5UDJN?=
 =?utf-8?B?aVZXVFJHZFBiZlNiMml6aittT2NaanRxVEpUU1hUMUhBM3ROeFhnSEtxVjhP?=
 =?utf-8?B?T0lsUS8yR0hUTStJY0tPakxNY01oQTV1d1ZTTjRERFNNYkt4Nm0vSWNsSG9M?=
 =?utf-8?B?amMyMVRCYnNydGk2QjFVbWM2djZHa2h3SUwvNUx3VU1velNVek9IcVJXOGdx?=
 =?utf-8?B?UEFxS0JGbzcyZisySmRjK1N2NGRyV21iRzRqSG1FVnJZZVJWMjVDT3djL05v?=
 =?utf-8?B?c1J4VWIyb1dsUVduTnkzTTFNSzdUS1N1dkE0WC9sTkV3a0hmN3gweC9nbGZi?=
 =?utf-8?B?Tldac05KTFZtakR3eWVua2VJMWhxcmhTMTBJR2hUTFBzLzVzQ0N6SllqaW1F?=
 =?utf-8?B?czlnazdJTEoyNGpqTVgxdzZzd3VtbkM0cEtKSy8wMitibXZHclp0MFNDTTlX?=
 =?utf-8?B?YXZCWmJiMkRzNTZjTmcxS3F2cjJNVjlhZExOeW5WVGdVWUJXMmhacGFTMlJN?=
 =?utf-8?B?WlZuN0NQUXIvRnIxdm1Qc1BzWlgvM3dTVy9DVjVRcGpyZmpiR3UvODJwWm1S?=
 =?utf-8?B?SFozcWZOeDA4K3FHQmxmKzJ4Nk1Va25hR01ibHgydzhWQnFueHF4VmhNMEdC?=
 =?utf-8?B?aUJsd3RSSVA1TytnUnNuK3l2S2laQWc4V04wbmRXbzFQSXRleEhkTFJhR2Uy?=
 =?utf-8?B?NEJHVEVOWXFlUk5VNElIU0tleFRzYzlxM2I4VEpIc2hmdWZzMS9GMU9TWVdR?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HoGCMVVVfn3ycyQSFTDNz4PlXxLqi9vqryWcyXEaF6ZmBkIb1PvF7Ki7GcxyF/L/9UMt4yXWOQAA/QRYrQVEsdrllv0qWjOg1p6OsRkW5CLM2K1gyMU10Ux6Hz9JSdgpxNtGpL3WyZzve5R5lGgXvDjzJ4LYDZeeCU78Vt/223lnEqV4N8Bg+/Bw6Dxq//rzuyYibuYIV7j1SIqi7W0JLb1hh8RRbadU4PtLR9HhvuOfltXx93EcrENAGeZLdZZyMpUGCcUXw5m1cWcj5MugGbAGGP5FE9KEHu1tAi1xGz7Z29a5D3n5f55+C2x5lUjfa6Ec4ZSjcHWValiodA+QkzVfzSbskCk2KQkd9u4x0Qi1Ggxdw0RihZHF3Qgh5qr398bzkWaCmlda9+XJ9Y6/1tb4A+uVCmd8TbiAdltI1aEo2leYq+/HNJaBQX67jIQf0vxGes8IBptXJv8+P3siwr5IqFP7GZ0itW/kA2Rs02u/ZTdrHlUR1YG5WZfz5zjXwRXWoPi1Fp8JLSP7KrzMN6I06shjjK3GQeEmGKJSidT41uSHlgYUAoQIWtXIzvABAWGR8T7bg1kW44IxBruQrBotHRY3GMZyOG0oE/HDaejsG1VCRQy7fEYIpHGAWiZDF3e6XrwRDky85W/7qMwU7Gl1+vEPGgtUMbmJW9K1amEzYF+BRmxO3S4mniGZSa7pY2N6LStX7z2k/kaWbhYEjkAJjp2PCTLzeGo+a0XT6ilMKwXxJ1U2xKmNOuDz7UVs6VKliSOEfRD4PmidSUx3nSI/heRfp5IH8zcFEQSKqDn+IWoKnl4no10f00K/GjTJ
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 342dad2b-35b5-44d6-4af2-08db3520f630
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 15:26:29.0140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zLuqNaIf+5JPrF2kQ29zNh3St+uIN+9cGUci+ksz8wqV7LIW6WrVyHXaVdwBU56nVBV+Lqn7Vjgv/TrzzD8cwDSyuaAjNJQlqf7KkjJlf98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5214

On 04/04/2023 4:01 pm, Jan Beulich wrote:
> On 04.04.2023 11:52, Andrew Cooper wrote:
>> These are already getting over-large for being inline functions, and are only
>> going to grow more over time.  Out of line them, yielding the following net
>> delta from bloat-o-meter:
>>
>>   add/remove: 2/0 grow/shrink: 0/4 up/down: 276/-1877 (-1601)
>>
>> Switch to the newer cpu_policy terminology while doing so.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> I take it you have a reason to ...
>
>> --- a/xen/lib/x86/cpuid.c
>> +++ b/xen/lib/x86/cpuid.c
>> @@ -60,6 +60,48 @@ const char *x86_cpuid_vendor_to_str(unsigned int vendor)
>>      }
>>  }
>>  
>> +void x86_cpu_policy_to_featureset(
>> +    const struct cpu_policy *p, uint32_t fs[FEATURESET_NR_ENTRIES])
>> +{
>> +    fs[FEATURESET_1d]        = p->basic._1d;
>> +    fs[FEATURESET_1c]        = p->basic._1c;
>> +    fs[FEATURESET_e1d]       = p->extd.e1d;
>> +    fs[FEATURESET_e1c]       = p->extd.e1c;
>> +    fs[FEATURESET_Da1]       = p->xstate.Da1;
>> +    fs[FEATURESET_7b0]       = p->feat._7b0;
>> +    fs[FEATURESET_7c0]       = p->feat._7c0;
>> +    fs[FEATURESET_e7d]       = p->extd.e7d;
>> +    fs[FEATURESET_e8b]       = p->extd.e8b;
>> +    fs[FEATURESET_7d0]       = p->feat._7d0;
>> +    fs[FEATURESET_7a1]       = p->feat._7a1;
>> +    fs[FEATURESET_e21a]      = p->extd.e21a;
>> +    fs[FEATURESET_7b1]       = p->feat._7b1;
>> +    fs[FEATURESET_7d2]       = p->feat._7d2;
>> +    fs[FEATURESET_7c1]       = p->feat._7c1;
>> +    fs[FEATURESET_7d1]       = p->feat._7d1;
>> +}
>> +
>> +void x86_cpu_featureset_to_policy(
>> +    const uint32_t fs[FEATURESET_NR_ENTRIES], struct cpu_policy *p)
>> +{
>> +    p->basic._1d             = fs[FEATURESET_1d];
>> +    p->basic._1c             = fs[FEATURESET_1c];
>> +    p->extd.e1d              = fs[FEATURESET_e1d];
>> +    p->extd.e1c              = fs[FEATURESET_e1c];
>> +    p->xstate.Da1            = fs[FEATURESET_Da1];
>> +    p->feat._7b0             = fs[FEATURESET_7b0];
>> +    p->feat._7c0             = fs[FEATURESET_7c0];
>> +    p->extd.e7d              = fs[FEATURESET_e7d];
>> +    p->extd.e8b              = fs[FEATURESET_e8b];
>> +    p->feat._7d0             = fs[FEATURESET_7d0];
>> +    p->feat._7a1             = fs[FEATURESET_7a1];
>> +    p->extd.e21a             = fs[FEATURESET_e21a];
>> +    p->feat._7b1             = fs[FEATURESET_7b1];
>> +    p->feat._7d2             = fs[FEATURESET_7d2];
>> +    p->feat._7c1             = fs[FEATURESET_7c1];
>> +    p->feat._7d1             = fs[FEATURESET_7d1];
>> +}
> ... add quite a few padding blanks in here, unlike in the originals?

Yeah.  There was already one misalignment, and I haven't quite decided
on the MSR syntax yet but it's going to be longer still.

Here specifically, we've got p->arch_caps.{a,d} at a minimum, so column
width is based on the MSR name.

This is just a guestimate of "plenty for now".

~Andrew

