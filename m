Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 498B271095E
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 11:59:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539497.840430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q27kY-0002Mt-Ub; Thu, 25 May 2023 09:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539497.840430; Thu, 25 May 2023 09:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q27kY-0002KN-Rw; Thu, 25 May 2023 09:59:14 +0000
Received: by outflank-mailman (input) for mailman id 539497;
 Thu, 25 May 2023 09:59:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ugP6=BO=citrix.com=prvs=502bf10e6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q27kW-0002KH-Lo
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 09:59:12 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca0820c3-fae2-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 11:59:09 +0200 (CEST)
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2023 05:59:06 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5615.namprd03.prod.outlook.com (2603:10b6:a03:27a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 09:59:04 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6433.015; Thu, 25 May 2023
 09:59:04 +0000
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
X-Inumbo-ID: ca0820c3-fae2-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685008749;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=f5QF+wu9OCCG1FY++5LMdmi37O131AgZqgYHvdCHpN8=;
  b=heIpgncJvVTkqRockXUaZVE1Vpe5Xm997rQRvQwBlzMSbQjZxtDlNgff
   FoyQpxVDCcIbiXX8exGwyrlgAq4j6zKYp8XHTPP+hr1bZ0l7m2x1kWh+3
   SXPLtb1t4E4KPfK0VTDWt8t/mcpgufP2ORGfOClooocDBrDJd8MnlcilI
   8=;
X-IronPort-RemoteIP: 104.47.70.109
X-IronPort-MID: 110752667
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:st927q50Jw5RtIMZ9rNh/QxRtCHGchMFZxGqfqrLsTDasY5as4F+v
 jEeUTiDM/+Ja2egco1ya4ni901Uvsfcyd5mQQc4qSE9Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35JwehBtC5gZlPa0R4AeC/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mq
 aJfay5dcy+/3+/p3JuLaLVrpecCBZy+VG8fkikIITDxK98DGMiGaYOVoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6MlEooiOmF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtLTOLlrKA03zV/wEQ5WQJOdwC0hcOLj1CvepUOc
 lY34hAX+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU331y1uPhTa7OCxQJ2ldYyYBFFMB+4O6+NB1iQ/TRNF+FqLzlsfyBTz73
 zGNqm45mqkXiskIka68+Dgrng6Rm3QAdSZtji2/Y45vxlkRiFKND2Bw1WXm0A==
IronPort-HdrOrdr: A9a23:27XnAKsJyhr+1wH5DgPZ1p/07skDstV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMbB55/yKnTVRxbwbsaW6GKPDv5ag8590JzsaD52Jd21Ce36m+ksdfnggObMJUK
 Cyy+BgvDSadXEefq2AdwI4t7iqnaysqHr+CyR2fiIa1A==
X-Talos-CUID: 9a23:jeuUUm+lwRb4AL+QX7OVvxJKXYM7ImDi8C/dfFOROUQ1T562aHbFrQ==
X-Talos-MUID: 9a23:5JHMIQgyASCzgauEC/h8qMMpHpZ3u4b1B2Q3o5AYqujDZHVqGC+ntWHi
X-IronPort-AV: E=Sophos;i="6.00,190,1681185600"; 
   d="scan'208";a="110752667"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QsVbMc85FB1FUovuoH67QLVw/8XB4dfonznnruAbLY9Tfd7aC2MskDrXCKCHQYDWVcqJS2loEzDLIwiKLRcF5en1U8vNSg7RizH2rcYEum5AcFG5ggQ0+7Ls2cmXgBeimZPqt3rSVoWjHeAWFi34O06HaJdsldj0rccwzSMCnhiUAKuZGiPJ+h826l/fiKsmM0PmROSAapiwt9QYd1RDlGsxz+RJLwCTnLXnxHhXxrtrGO9XiqmnGemIuPFYr/mW2sJA1Ph3JDQsOFRI5bdEJZUDc8QAqOTB1jWS886+7dx567wzmYnZ1dIA/LZObtVdqEfoK/XRrxk7W72Rw2E7tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qG8QPeDflbqXoAZnw2M0wkZgXEnjgnNnIHBvERyQmE=;
 b=SUfLhEpCrePVVGm18GW47Sztytui0/ZeNLsqZrzPzG8RIGOLwBC6aAYOdfOenrgheeTMn0k0Ni7O/alTtcA9xXFXDWu79d14IybopqJMkhXBtH3k2uU1edkEAR77adAP/HhPh8fEkeDUbgfxZZC3zvYDhu1ASPLaThLiH3/D5c8hyWlWp6AmvcEnQkapVcDBm/AQ5hCpRUmdbxYMeJp+ohNpqW7t4G4GI5Lglw8tP2RgZFaEz/NF0sQvQo7XkRlQZLW9Vrv0Rasp3NNZOuYUpN7DmlBLUZNQGWqQs0eVv9qau++kN4DH1vo2DqFj4K0loenyrp1ck4RG8w9662GUJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qG8QPeDflbqXoAZnw2M0wkZgXEnjgnNnIHBvERyQmE=;
 b=JvQvFhMKfxWBZEvk7j7/DinXnzGrkAeZ/IvFJYZsvdEDfabjl+ACc9faKc1jYETBNBAuvxqZw1DrRBEsj50zsoxXAWzmTtAGU2sDXgkZDbk4po8VK4CvuCXNsGDJC+oGSVrxewuoafhdWdLCT5K1t3QWL2XMgufDd3lPfcIJ6jo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b43ba6bb-60e1-8567-064c-1452271ec255@citrix.com>
Date: Thu, 25 May 2023 10:58:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: xen | Failed pipeline for staging | 511b9f28
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <646e6ac6d749a_281a7a5e8825bc@gitlab-sidekiq-catchall-v2-596d74f7d4-ntx7r.mail>
 <af7e2e9c-1065-da68-d9b4-fd116fe2e2b0@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <af7e2e9c-1065-da68-d9b4-fd116fe2e2b0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0333.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5615:EE_
X-MS-Office365-Filtering-Correlation-Id: f3b854af-fc59-41ef-fb7b-08db5d06aba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DF9XzWMmbKzYhNkxWYPtYsGRbzfD+m9RemLT0E08No3oNJY0uxxqu3gROb9zyJb66HQ2fpAvR8VAW1v9bYZASyVSjSgfGdVzY7aEoa+JcAPBpLvEqmvIrRNFDtO3XZQqrxSVBSZZ6wx/o4s8cJEO5X4OZbYNTKAHyZ6jnoRc/CVlvmiCW4LYr8vGjqrk+u7a4Dd+PAXzsOxFaXaBMTeeOsH4UNOJq8gHUkiBCZ0kwuRZkPHGHj0MALhJSnt1l+FeNYnumPw/aIkklGmNF6lrxWmvJ5FBMjK6EKEkzKLyCe0TlFdho2ZA3WnkMmn9QdH3zBiejAldU84JbXBxQbKm2XS0GdiMJw3TEAzxKVaiBr7Hz3vcirRE8gHArn4hKD1n2o4mQJaZdvLuvkQrDMmgShhsE9fuNSzFeT1fzn7rFUauH2MhEOsMnE6aD5qxpggXGjL/fDiNB6E6Gb7JXu2K4qjStuccizzjK/rimqDJ6r1jA6xb3k+gWkWQS2ohEmAfN9ZVnEq/JvxUsauEILXyPZdQ3uQH2+UvzVxfY3xpSdCqu4kcancjwCvC+dp2QW+TFIorvrUZ59yrSZOyWtxFE5KjRvdHnEoK7sSmIkXo2F+Hv69uWaG8UbJL1mYhTIrcAkzBcJ1WLMOKz/SS+GZjKeu9PpwYaAntxBBMt6eqhsl+tPPjkBsMwMGnLdIuyH9K
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(451199021)(66556008)(66476007)(66946007)(8936002)(36756003)(8676002)(5660300002)(316002)(31686004)(110136005)(478600001)(6486002)(41300700001)(6666004)(966005)(38100700002)(82960400001)(186003)(6512007)(2906002)(53546011)(83380400001)(6506007)(2616005)(31696002)(26005)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N242Q093eDVDT1BnWTBGR3ZtQXFNUXB0M1padnFVcFNrbllDSVVCak93RTEw?=
 =?utf-8?B?SzQwNTJmS3Y1ZGFUOGVWZG5kNGdkUDd0QlBTWEdaRVh0c2wySzdQU2ZSMFQr?=
 =?utf-8?B?YlM1dHN6OWo0YThRQnRFY2krYmR0M2hVUXVjNzI4QjAzQk1QVmtZU2pQeDYx?=
 =?utf-8?B?WTQzRE9KQlZ5d0JsUHNxdnI3UFRTMnZhNWdqQjBQODNqTUVXSVNOV05JUGNG?=
 =?utf-8?B?WkorS3RGYldkZlRSKzNJZHlqYThRVEhOV0w0eVNoUE10VE5CbnRaaEpoREpB?=
 =?utf-8?B?Sk9HcmQ5L3dZSGd3SEx6ZlNXV3JKSGN5ZTh6MGY4K3k3Rkpwa2VnZ3V4bEZh?=
 =?utf-8?B?Z3lGUUppRGFYb092RE1FRlhBWit0U1o3cnNmRHN6b1FTcWVGMlpNYXBlN2hJ?=
 =?utf-8?B?ckNCL25oSTlKMzJKRzZkckZTU3BDeWRHYXgvU0tTdWxhenQ1Y0VqNVpaV1kr?=
 =?utf-8?B?ZHpLY0x4TVBCdmtRQVBVY05Cand4RDRDWmZEdTdQa1A0aXhjVFJ5Y3p2VUp5?=
 =?utf-8?B?RFI4WlJOYUxjckNBM1J3RGZGQUZoTEh5Rjhya0QzaDVWblZZa1d4Z054RGE1?=
 =?utf-8?B?Z2Izd25ZSkhWbmhYT0IyZzUxSk5qbTRKTmppYjI2d1NEY0MvSTlPRmU0eFNI?=
 =?utf-8?B?UUlnNExmUU9oa21GSklyVS84cWRZTnNoT2hOSVA1S3lUNGxLRjFDVEdwNWlO?=
 =?utf-8?B?eXFtV29jQ1JqWEFWUHZKdHVnR0RwRzkvUDZWL0d5WEFQY2E5YjBKY012clBB?=
 =?utf-8?B?dU8rT1dEMjZ1UjlMeUtaaXA2SG4vUUdoQ2pFQUpOY2IxWkIzOEpVcy8zY3Jl?=
 =?utf-8?B?TW1KTzJQMjh5TDNoUkNVcXp0MkRNTG1zVXVNblYvdU5LN0Y2eU1MbUJicHJY?=
 =?utf-8?B?T0xwZ045emY4d01lVWhTNXF4UW9WZE9HNytqaFVzOUxIMHZqUGdicWhQTVJ4?=
 =?utf-8?B?SlpqQUczc3NzUmkyL2t6Uno2aDlpRDB4NmJBNzhIVnkwN0ppUThZVjd1bG5x?=
 =?utf-8?B?YmdraXZJSVN6TW0rWWFieFlwTWNZVGNhOEovWjF1YXE2N21Tc3J6RThPMk5C?=
 =?utf-8?B?L2FFclM5VFI2UTBwbjNpYlM5bGQ0aE9nTkdQK2hTQTlXejE0cm1LQ3M4YVFj?=
 =?utf-8?B?SEhVemk5b05ZYkVhelkyQVBTeE5QNHlNY0VXNDRVSW1EWmpaR25uTVU1Y2NB?=
 =?utf-8?B?Q3VFbmZBRE05T0laYnpLSTlnWUxrdXh5VzlTd0M3Qi82WTAvY1NjY1Yvbjhz?=
 =?utf-8?B?MUcrMjd0MDJuQ0tBLzJzUVptOEJwL2M5MEhiWlQ3a2VwL1hVN3ZwS2JacytO?=
 =?utf-8?B?MTFYaDBtT1haU0xpYStUVThpN2ZtMFFtMDQ1T0x2ZXdzQ0kveGtkVDJDNm1B?=
 =?utf-8?B?dnVwb3FFUE9GNkt4K2NJVU94Z0dQRWFvd21hTkhtYzc5RlpsNjBjaTZwbFpB?=
 =?utf-8?B?WGRLMk9VK1ZxQVFzeHcvajNPU1QxT3hFV2l3MmxmcDFPQ2FVQkVMS3h6SUti?=
 =?utf-8?B?VFJhRjR4OU1kTVhoZHNUcEQ5M2VNOGxOVEFpcGJxSjU3S1k4ZTZsd2ZGL3ky?=
 =?utf-8?B?cTNvTU1CM0MzZHhzc3FqUEJpNzVua0l1a3packlEWnd0cmY5ck15T0lTSEw3?=
 =?utf-8?B?NTlUelkxOGFjb2JackJITXM4ejhqL3pvbEl0Sm55bGluQlQvMUlpbjBJSS85?=
 =?utf-8?B?VWd4RWRZL1J4WnhuaTcwRXBmMVB3N29SVExlazhVNm9sWDhOMFFTWGZabjdF?=
 =?utf-8?B?VVppTmM0YmFlS1dKYjVIMzM2dTNCYkxrUWhxcHpuVXJ0NzNnQzdMYTBINU5z?=
 =?utf-8?B?KzFiZ0RIdXBHM0tKTjhpYjAvRGpzTFpRUXdVb0hvYUJBZHo4TStDU200aFNr?=
 =?utf-8?B?QjJkWThvVllCYVFlcUFyNUZGem5GN1FkSitLU3RCZ0NnUlBQZ01FZ3BiazM4?=
 =?utf-8?B?NjRYeDJXblRIVFMyUUhFKzI5U1BXRlBpOXZsMzZFVUtoSVZtZ3ZNbHdORDh5?=
 =?utf-8?B?WkRKM3VVY0FHV0pDaDcyNzVvZHFDWTlwa3A0WnB1Q01rRmZKVFF2TjVCSXVB?=
 =?utf-8?B?QjRmc1NzNUtHdGkzUzBFZWxiK3ltT09PaWRYSk9oWmc3T1pjSGg5bnFOa0NF?=
 =?utf-8?B?M0NZcDNmbXRmMGJsTXBKSGREUlcwVkRXUWcxbTE1OHVkUjl4OXFNMytpK3Bp?=
 =?utf-8?B?MFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PYBvrYOvyZn1XQsi8872ilCINzullmLNdqHgtwVDPpmbeHqFjvB8NfwMlaysxPPuLZ1u7hagvlPVG+LqAyy6p3Y6gzlK9jAaiXiHHYycO8DSGVJHmdjbTLQn4uYbfxBMr3nZUs+1CrgJQtrZWfRS0XZ3XKjHh6y+eo+9f6BLvAAXqSWoBdoewdWgFkICIN67y5eRyWb4Ii7LBsT5J0bofyHJGrtDvRTpl6M8I1pJ/JLZ+8RefiijPzCWxDniwTKIGzqfL7Tn3+yBD/wPjsPE2A1+TRJ/6HI6NZ2hUIaRtP7zvnVzS3X+HZTahzGISQQFmuKkCeCTxzBKewBohhH/yX6d86VNEY+UdlstI+G+mgFjsbl9wqVEjPp0VHdkzFN+yz7yQWq6466psYlcx0rSFx+2jbkXmNvy/kMmMAOgbY2cvmqXXbvKHBWtJJuoOEwXHNDHr2DyqZHRA6t1pVFUa2SMFJp1guPMJKkul35qEkdbkYsZPPAUBvApyYaGY44yafwfjdprtEwugUnGntH/bp6+DWhzWvcYu9YNESDkgvua3b28llxPv2vkrXhwneNYMYIQtxvwgvIt+4Iz800QLFhRJ3EW7LTQVP3wk3HdNTxWW2h9PDTAfmtyjfxkhpca/wDZ7cF1eRGUwahdI/bnhzokQHUOE66qm90BiZytFpKHf0OoAgfGciTUPCoRVFEJq/IMe27SSukQXW11139XQ5A/n6HFA2S4RZydaZOaHKlit0cSmoGUhmevHfoCYc8aBzIU25No0aHkaxVsVuOj4S11+D2/d+2KRDyqmOMofqU=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b854af-fc59-41ef-fb7b-08db5d06aba3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 09:59:03.7269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J34rv+Bo/YF4fQO/gQGd1ZtxADKmhTOR02F01lUbeEnnMrKSQ6jEAr1n31zhtbrzOL8NjxVevB1dZK0ZVj0isnqRnFLdXP5RTnLHcFZKPZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5615

On 25/05/2023 10:49 am, Jan Beulich wrote:
> On 24.05.2023 21:51, GitLab wrote:
>>
>> Pipeline #878023438 has failed!
>>
>> Project: xen ( https://gitlab.com/xen-project/xen )
>> Branch: staging ( https://gitlab.com/xen-project/xen/-/commits/staging )
>>
>> Commit: 511b9f28 ( https://gitlab.com/xen-project/xen/-/commit/511b9f286c3dadd041e0d90beeff7d47c9bf3b7a )
>> Commit Message: x86/spec-ctrl: Remove opencoded MSR_ARCH_CAPS c...
>> Commit Author: Andrew Cooper ( https://gitlab.com/andyhhp )
>>
>> Pipeline #878023438 ( https://gitlab.com/xen-project/xen/-/pipelines/878023438 ) triggered by Ganis ( https://gitlab.com/ganis )
>> had 3 failed jobs.
>>
>> Job #4345633611 ( https://gitlab.com/xen-project/xen/-/jobs/4345633611/raw )
>>
>> Stage: build
>> Name: opensuse-tumbleweed-gcc
>> Job #4345633612 ( https://gitlab.com/xen-project/xen/-/jobs/4345633612/raw )
>>
>> Stage: build
>> Name: opensuse-tumbleweed-gcc-debug
> While I understand these continue to be ignored failures,

It's a Qemu failure.  Olaf has a request out for a backport into the
qemu-xen tree.

>  I would have wanted
> to look at ...
>
>> Job #4345633615 ( https://gitlab.com/xen-project/xen/-/jobs/4345633615/raw )
>>
>> Stage: test
>> Name: build-each-commit-gcc
> ... the failure here. However, the log as shown ends at 4Mb as usual, yet not
> as usual the job artifacts consist of only config.log. So it's not clear
> whether anything relevant would want further looking into ...

This one is weird, and yes - there's nothing at all to go on.

First thing is to get the build log out reliably, because everything
else is guesswork.

This ended up failing on my pre-push run too, so I think it's something
deterministic on larger pushes, but I'm positive that my series is fully
bisectable, so I suspect it's not a content issue.

~Andrew

