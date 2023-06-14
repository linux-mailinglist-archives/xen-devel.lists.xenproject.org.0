Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DD473060C
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 19:26:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549091.857428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9UFr-0008Bj-T3; Wed, 14 Jun 2023 17:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549091.857428; Wed, 14 Jun 2023 17:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9UFr-00088k-PD; Wed, 14 Jun 2023 17:25:59 +0000
Received: by outflank-mailman (input) for mailman id 549091;
 Wed, 14 Jun 2023 17:25:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiGM=CC=citrix.com=prvs=52225e267=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q9UFp-00088b-Ez
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 17:25:57 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83d84ca1-0ad8-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 19:25:55 +0200 (CEST)
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Jun 2023 13:25:51 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6635.namprd03.prod.outlook.com (2603:10b6:303:12a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Wed, 14 Jun
 2023 17:25:49 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6477.037; Wed, 14 Jun 2023
 17:25:49 +0000
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
X-Inumbo-ID: 83d84ca1-0ad8-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686763555;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZuznEZ1jnur4GuYEqJKxWh+jjPE6tji7bqRGtcOuTew=;
  b=PwtSpnPhb53xW54YauXA49SbYMmKtIvXnXkl0m3jmEKMhThPFtx27k63
   DOjtu70WiVinLWygcE2T6pJOH3oJ58d8pbfk2K5G2vXk6YOFOgREZtDb2
   sjpB9EKl1KCwNluPLD1DveLDYm+K+iaMT8MPr/smpcJod8C9r0OPzeIDI
   s=;
X-IronPort-RemoteIP: 104.47.55.172
X-IronPort-MID: 113220081
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:qQLH1K4Pxp5Ykpq69oGgPwxRtBXGchMFZxGqfqrLsTDasY5as4F+v
 jMZDGiEbvvfYGbwfo1yOdni/UlU6pXdzNVrGVZupX9kHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35JwehBtC5gZlPa4S4AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m7
 9dAdzQcKUC4qc2Jw5/jY+l0g4cfFZy+VG8fkikIITDxK98DGMqGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooj+KF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtLT+firqY62TV/wEQ3NzYMV3mCvsCjrV6aYYNwL
 XEb8TYx+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6GAkAUQzgHb8Yp3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqWMMfZQ4M4t2mqodjiBvKF4xnCPTs0YezHizsy
 TeXqiR4n68UkcMAy6S8+xbAni6ooZ/KCAUy4207Q16Y0++wX6b9D6TA1LQRxa0owFqxJrVZg
 EU5pg==
IronPort-HdrOrdr: A9a23:Me6NzKoFxT004WwrJXC9GTwaV5oleYIsimQD101hICG9E/b1qy
 nKpp8mPHDP5wr5NEtPpTnjAsm9qALnlKKdiLN5Vd3OYOCMghrKEGgN1/qG/xTQXwH46+5Bxe
 NBXsFFebnN5IFB/KTH3DU=
X-Talos-CUID: 9a23:5NEqL2yxYTRN0x6SC9W5BgUOMZh6dmyanEz+DHC7JD5ASKWQCmOprfY=
X-Talos-MUID: 9a23:GMbmYwbVC/iVFOBTkwDHnjNADdhR+YO+LHpcvpM7tMKYKnkl
X-IronPort-AV: E=Sophos;i="6.00,243,1681185600"; 
   d="scan'208";a="113220081"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvO6zhWBoKytVNYGMzzRHOercQjTULfBsP0irwZAJCDG8Bs1aa7v4jEUlZcvt9iU8jEV3uJ4UX3kXXr3/DD0165TYw1/oMsswil0gocV3FbFwRriyD5A/vQueDaJXopBgQ34wEPFd20bqOOknrd70gZQclra+MFLoTC4fd0gh66/pmAsKVYForoFMi00II5dynSjowKWY91ECfgmHrv4HiJKl+VKnrLJtOea5Gj20GEabiCTFJKPHtEvya/8mfFKMqIU4h+uEPSJM7GiYZTnuYP+CZ3q40NfwhKvnwBt1e3nXIHThKKKvhE9NBfGnbH3uLqDVFTZReKxD8y7SjVZPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVM1gH4AuSvDeuzQ3rHL64zPnqC5qQltmp3BW9JIMv0=;
 b=gOdG8RMBLfD0JdwKI0ypH2ZFJERMHOUkZkUUgeYzjklmy3G8DrSJd0Us6KFnKkYvYbzgAAGe/MqRVDV02KFkDFgyfd4g2Sk4KF7WvHRsav7QckVMCucrLMNwhs4GT+TJW7DXgGGNsPoayO0kEN82ukd49StrIu4kLIUQb7LfmAuQsdxEluppx/ts4FeNYMG6W78KSCWvc6ztX/qv7bcrLTO77/XNSRHXWNGmZ7t0zLegLq0yJyGvYP/Mt0GQZlO+e9xRjtaVqksaPG09erzU3wGfYuesBlRrsgEvio3DvptGFJyzKrO8u180Snz5ZSidwUySruHDn6bL4OcrLJX7eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVM1gH4AuSvDeuzQ3rHL64zPnqC5qQltmp3BW9JIMv0=;
 b=S63vHD38tzZ5IL0fcSXKzLCUMkCSfIbfuX7AAdVrliikEbDXmemvNGdn/y5svGHdKYHQgO4YZPPmXSyJzjdLVtbPp9r82OxR1ET1UypwUL3n/83tFpmLOU4GLZzeB/1UbPxRFvya0ox00mcv/KGuuNEJYx43TJDSSU49WSIboDg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d48c9221-c8ee-5121-8fee-a7e82dc31e78@citrix.com>
Date: Wed, 14 Jun 2023 18:25:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 3/4] x86/spec-ctrl: Fix up the RSBA/RRSBA bits as
 appropriate
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230612161306.2739572-1-andrew.cooper3@citrix.com>
 <20230612161306.2739572-4-andrew.cooper3@citrix.com>
 <81f74759-766a-bc3f-f4de-199cf3f1bd75@suse.com>
In-Reply-To: <81f74759-766a-bc3f-f4de-199cf3f1bd75@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0306.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::30) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MW4PR03MB6635:EE_
X-MS-Office365-Filtering-Correlation-Id: 33766dd6-911f-457a-512d-08db6cfc64c6
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ok1P0Z+GNtmmlSjj0OHr77qtUFbK5OqySupGPTS/bPqHcfD1s3sqfuRwaW7GWEE8DeQz969VYxA3b5xNKn/uSEPULT4zN21apo+NDgEsmcB3YHZo9m2KnEGuMBtVUFvaZD8eanYSPps8JsasQ45OL4j+HVa5acJFLUsyU7SgD5rSe4VV7v2D00brvqV2hETsz2n5dtr6NZvQlE5s+QkuqUe8kesl1AfqYImWN8M5418eu4R0T1wAxBoCvfKnBz/UTRDLDI09TNw+sAlYb6EnzwwMTboAA3QSi3rxahuKdPkE9LyHjYu8D5HLCt2o78jXN9fFxg5AFKAeRCe9HUpfDUyyKDalHGC2MZDtI0k7h5I/qzmCCAx2DS+kUlBXyYJGUoZ6XI78+bluSg6pKmoa3lqOyHIaNMRaXtgAuT2rFl6Jwzg8RSBrunVGhQIO6RBGHZlDkD+uym1vcFUPA0UL/hNTqQQQ8H74p26L+cibqGQBlqlSfZ2TuzKT6il/72JUxNaKeVbq9WjAP3Ibc2T7DXXcPd03V/nbJf/qQtwFueoBGAHsvY45sf1EzwMKDSaGF3tXQB9Q1jRhXbFclKG8ucdb1blRAnFR0oeV7xD+h4OF1v+EzHOYsyqKeN4Qj30zsDFI/xdxSYosSnYJiakyBw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(451199021)(5660300002)(186003)(6506007)(2906002)(31686004)(2616005)(41300700001)(6512007)(8936002)(26005)(8676002)(6486002)(316002)(31696002)(54906003)(53546011)(6666004)(82960400001)(36756003)(478600001)(38100700002)(4326008)(66556008)(66476007)(86362001)(66946007)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDJLdG5DYmEydTZlRDQ4MERDTTBkMkJKdWwrWU1xK0Fkay9PVUVaT2cxUzZQ?=
 =?utf-8?B?a25jbTFqaWs3a2lyblEwNUIrMFpBb1czRmt4SWMvN3VMeDlLTDBRY1AyaGFC?=
 =?utf-8?B?YmhDeWZZQTd3TUx0aWZNdFc4eE8xWTkzdlNoNUVMb0NteE9MdHhnbVVUOThV?=
 =?utf-8?B?eU9lSWZRWU1kZFArZUdRT0o4ZWlJbVpYS1YyMEZaZkRFZGZLYncrMEZIV2tQ?=
 =?utf-8?B?WjBma1BnV1k4S1I1N05oQ3ZhUXJCSllieUxSV3VCbWJTeWJOR0xYOTN0VTZu?=
 =?utf-8?B?R2Ftak1ieXhCY0NVWEJtUnFpWTlYRk9qREJZV2paMVphWEgxbGMzb0hWbVNk?=
 =?utf-8?B?a0t3OU55YzJyUXl1Y3JyQkdnVEc2Y3UrT0c5Mmd6cURodnRBM2tlR1BOSUh2?=
 =?utf-8?B?bzcxQlRxRmdZajE4RFhjQ2t6QTdGU0c4dWdzR2xXNnZsNWR3Rmw3dWtqbHdX?=
 =?utf-8?B?cXd6cld0OFFSZDVwMGhmTHRlZVl2NVdTRkE0VHhZTEZXcmV3UjZOUkNQUThn?=
 =?utf-8?B?d21vc0l3TmxxdG53eHFxSGNOWDlrUDZ2WSt6Qk9XNXluWkQwL2U0YlZSc1U3?=
 =?utf-8?B?T09SdWxIU3ptbytMeHlPdTBjRzMrMGxCenJ0SENKRmEycHQzUE5qa2xDWnAx?=
 =?utf-8?B?Y1VFYjJhVm9RNDNlc2F2QXpCV2NhaXJqR0JYZVhNRWxYWjE0dzB5eTNHSWtO?=
 =?utf-8?B?T2JMUzBOUTV1Vy9WeTBnQS9rSUdiWDQzT2dsK0VobXdiamc2SFB5Sm1rVFVi?=
 =?utf-8?B?TDhZNUgvL05hdVg4N3M0aS9hNGh5RTVBdkg0YWl0ZTFJcEFmYWNXMnVnS0Qx?=
 =?utf-8?B?bzBWdW9OdklCblUyRjRjMVBVSS8xZVlkWmJZVVc3S1dPK2NNSjhyZ21nMFZS?=
 =?utf-8?B?Z3V4Vi93VTgyUEJnaFJ3U0xRQU5sOUpSbFkwdDAxYk91Nkg1N2w2aDNRdytX?=
 =?utf-8?B?NlY0QWtnVERWSExVaEpxUG9uNGRFcjcvdWhTNG0wVDhOaUQzUnM4MTdjbnBt?=
 =?utf-8?B?U0Jsc0lrL3hJWlRvYWkwZHR6WWUzQ1lGd1lQWk1uS0xNcjlQQmYxdTFUQTN1?=
 =?utf-8?B?dHNkTFJLbTVlbWhYODJDVTZmWkhoUlRDdC9ONVl5Sk9wN29vK0VDMkJSWDM2?=
 =?utf-8?B?Rm5YdXo1T3RJYTV1S3VndE40L2V5V1U3NWpnbUNqZzZaZUp0a0x5ZDJ4Tk9G?=
 =?utf-8?B?RTYzMGU3NktKR2RiK04xQXc4UFFDU2ZIU01ENTY5anZBbFpMMkVwbEZVTlBV?=
 =?utf-8?B?UVFRTHpPT3RLdG9lU0dBekVySWp2TERMUmRCOUJlUlZ6QWRtNHp5b2pnendq?=
 =?utf-8?B?N0x4aWhtQ0tISlJDK3dSTGI5MWVNUER0ZG1FV3pTZjg1Uk9ua3Flc3ZqZVJv?=
 =?utf-8?B?aGZHdkNMZkEzRUU5Ym1lN3lZalhRUEpKRGE4Q3o5YzJScWNSYUNoUkN6ek9h?=
 =?utf-8?B?MGsrUWJPS2V6ZThTdVNmc3hPTC9aYWZZS0FUcWFXRWJlYlN5UHZTVHFlU01t?=
 =?utf-8?B?eGJLakpja3FLS1g4NVRhMGsvTHJtUlNPVkFqMFJmSHZJczB3dHoyczdiRUdB?=
 =?utf-8?B?aGVVUERONm9vZ0JjeWhVNHdMVkZCcWpFKzZIN29PSXBEOHR6UEo2OFcvdHFO?=
 =?utf-8?B?YWlMQ25INzN1aVJRalhDRHY1Y3p3MGQ0RzJKOUxKY0psdUNuNjNiRkF3MVdQ?=
 =?utf-8?B?R0NuNEM2dVcyOEZzK0pQVVVnd2t6MkZmcHpGQnFaSzZqb3AyRnhrM2JEMHpx?=
 =?utf-8?B?L2hvWUF4REFiUFF1Wlc5VEttZ3BPYTZDQ3JPK1RKRFBYQ290ZWZ2N1Yxb3Fu?=
 =?utf-8?B?S0xQK1FzOFZTTE9ldWRSdWIybnhEYWRTQktmVythUUV0cHl5NjVxV0x5VUcv?=
 =?utf-8?B?Q3JOM3lJVVRNK1lpbTY5ZjVhNzNWWmVJMTcxQTl4V3UrYjR3UWZ4dnk4c0xq?=
 =?utf-8?B?UkErU1N2Njd0SWJXN1FBL3J6ZkF2NWhsaEZLVVp1aFRSdFl0K3VHbnhQQWxm?=
 =?utf-8?B?eS9NandUWnVuTlpuYkhjb016RldPY0VaNUp0dGc3TjlKZHV3dTFHeWtSYjlR?=
 =?utf-8?B?ZFlRWFNUWU4wTHhqSlpjSVJNQUQyZUJLaGFVcy9YbHN0SVVOWGlxTlNBN2RS?=
 =?utf-8?B?Ny9BOXlPMFI4dENkUDFiM0ltMVl6bEc1Qm5rRSt6cWVjdGJVNHJWK1Z0NVky?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rl3iFZgxvgKes+OpvojH8rQF26oa3QOsZ+hoe25gKMvcLNapWMPhpwd3jMBemsGDqMz980wsTHJwqvSZeyq9b5GjGahljU/Ws4kU2KmS3hdY75I/w14F0/5pvbvjTEvL0OeEAeewKdxx+fKj4yIVCAynC2hPCfvIzUkYII9BtNWzcvH7tDOMMfpGUbaeI1T8+bgMWsq/yIu6GF+a3oaB8SPQCel1GwGNQdcNf72HYb6IcSjIf9LtuBC56lnS8iV45gXJhWYpQD8Fw2B0d70zK4u5JXj4gg74uAnTLSeM3BPI5bj/WyxtHcGrauDPApv5wW5dxRjPrsb9my7bdStFfKofrUVykHoCtdo7TfEZaK80SwT/KDLLfzjX5C8igb9UhsNOQK3pSQWTU+k6BWQoo1drgZyfq8P2j3JSb7kRt7UslZ0rxlyHZpj1tFqe4+N1HLwSyE5BXOFhfXzNkt9+L8pmxw9HkJsgjep9z8P+xcAuWsxflhRjjKg7f6BTr6+rlyxr6mq/PiCBxV4CHLOzg75anXOHCQYCtfBprlqkQBc12OeIEI7I2bZS6bszEA67AhbqUZHf1s8wyUxiLEK/StPQyFEvFWMF2R/O8+YfXS72hTca9a18Tq6Zkl4vXi/CaxNvh0hrSb1KLCC+FVJIxa9ldtsuy+1Ski2gXMZ+I9lsEgWR1Y1bEuc2G6u+D+RU0FmMU6Kf57oXfc0jJfa9t7I3FegNt/0p4wRtYWN8Z8vntlwIdXLleXYEIPwu6hvLFWxyrVl076iDyw9EJnff+oPqG+xX1Z2ff9ejVrolYIock26e/gjVT3RlVWLivFM9
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33766dd6-911f-457a-512d-08db6cfc64c6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 17:25:48.8120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 90Dmz3G4nSvNQtgXzOyRoegFZA5syK5V8xwlE+d7H06qodq+5zLNgkUgcy7FY9G7tvWQ4JS7hbyMGKKSOvEH8fAWdvhJg07TKS3D/ocYVWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6635

On 13/06/2023 10:30 am, Jan Beulich wrote:
> On 12.06.2023 18:13, Andrew Cooper wrote:
>> @@ -593,15 +596,93 @@ static bool __init retpoline_calculations(void)
>>          return false;
>>  
>>      /*
>> -     * RSBA may be set by a hypervisor to indicate that we may move to a
>> -     * processor which isn't retpoline-safe.
>> +     * The meaning of the RSBA and RRSBA bits have evolved over time.  The
>> +     * agreed upon meaning at the time of writing (May 2023) is thus:
>> +     *
>> +     * - RSBA (RSB Alternative) means that an RSB may fall back to an
>> +     *   alternative predictor on underflow.  Skylake uarch and later all have
>> +     *   this property.  Broadwell too, when running microcode versions prior
>> +     *   to Jan 2018.
>> +     *
>> +     * - All eIBRS-capable processors suffer RSBA, but eIBRS also introduces
>> +     *   tagging of predictions with the mode in which they were learned.  So
>> +     *   when eIBRS is active, RSBA becomes RRSBA (Restricted RSBA).
>> +     *
>> +     * - CPUs are not expected to enumerate both RSBA and RRSBA.
>> +     *
>> +     * Some parts (Broadwell) are not expected to ever enumerate this
>> +     * behaviour directly.  Other parts have differing enumeration with
>> +     * microcode version.  Fix up Xen's idea, so we can advertise them safely
>> +     * to guests, and so toolstacks can level a VM safety for migration.
>> +     *
>> +     * The following states exist:
>> +     *
>> +     * |   | RSBA | EIBRS | RRSBA | Notes              | Action        |
>> +     * |---+------+-------+-------+--------------------+---------------|
>> +     * | 1 |    0 |     0 |     0 | OK (older parts)   | Maybe +RSBA   |
>> +     * | 2 |    0 |     0 |     1 | Broken             | +RSBA, -RRSBA |
>> +     * | 3 |    0 |     1 |     0 | OK (pre-Aug ucode) | +RRSBA        |
>> +     * | 4 |    0 |     1 |     1 | OK                 |               |
>> +     * | 5 |    1 |     0 |     0 | OK                 |               |
>> +     * | 6 |    1 |     0 |     1 | Broken             | -RRSBA        |
>> +     * | 7 |    1 |     1 |     0 | Broken             | -RSBA, +RRSBA |
>> +     * | 8 |    1 |     1 |     1 | Broken             | -RSBA         |
> You've kept the Action column as you had it originally, despite no longer
> applying all the fixups. Wouldn't it make sense to mark those we don't do,
> e.g. by enclosing in parentheses?

Hmm, yes.  How does this look?

|   | RSBA | EIBRS | RRSBA | Notes              | Action (in principle) |
|---+------+-------+-------+--------------------+-----------------------|
| 1 |    0 |     0 |     0 | OK (older parts)   | Maybe +RSBA           |
| 2 |    0 |     0 |     1 | Broken             | (+RSBA, -RRSBA)       |
| 3 |    0 |     1 |     0 | OK (pre-Aug ucode) | +RRSBA                |
| 4 |    0 |     1 |     1 | OK                 |                       |
| 5 |    1 |     0 |     0 | OK                 |                       |
| 6 |    1 |     0 |     1 | Broken             | (-RRSBA)              |
| 7 |    1 |     1 |     0 | Broken             | (-RSBA, +RRSBA)       |
| 8 |    1 |     1 |     1 | Broken             | (-RSBA)               |


>> +     * further investigation.
>> +     */
>> +    if ( cpu_has_eibrs ? cpu_has_rsba  /* Rows 7, 8 */
>> +                       : cpu_has_rrsba /* Rows 2, 6 */ )
>> +    {
>> +        printk(XENLOG_ERR
>> +               "FIRMWARE BUG: CPU %02x-%02x-%02x, ucode 0x%08x: RSBA %u, EIBRS %u, RRSBA %u\n",
>> +               boot_cpu_data.x86, boot_cpu_data.x86_model,
>> +               boot_cpu_data.x86_mask, ucode_rev,
>> +               cpu_has_rsba, cpu_has_eibrs, cpu_has_rrsba);
> Perhaps with adjustments (as you deem them sensible)
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

