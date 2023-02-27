Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3146A4B96
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 20:51:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502880.774905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWjX6-000773-G3; Mon, 27 Feb 2023 19:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502880.774905; Mon, 27 Feb 2023 19:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWjX6-00074U-Cb; Mon, 27 Feb 2023 19:51:36 +0000
Received: by outflank-mailman (input) for mailman id 502880;
 Mon, 27 Feb 2023 19:51:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mutd=6X=citrix.com=prvs=4152eaadc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pWjX4-000748-S4
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 19:51:34 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 220f6080-b6d8-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 20:51:33 +0100 (CET)
Received: from mail-dm6nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Feb 2023 14:51:28 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5818.namprd03.prod.outlook.com (2603:10b6:806:119::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 19:51:23 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 19:51:23 +0000
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
X-Inumbo-ID: 220f6080-b6d8-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677527493;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=M1to9aRY6q6+ihjbE1wXGsg7foa49JBm9ylY9Csrzio=;
  b=JYTjMA4YLoy8ryRbdTuz1Wk4r1bGUWWKoFpQsQUq/IIB0aHhIqWfjqPG
   Z1w3J9Gn0eNuD8LsymPSCf898IATo5PtlGI7kIFOrIiA7nxkgQp/0sS5e
   5Niu1UJ5VUw2jyHn82gYA9UqCwDmVCWIzPcCere0FOmROhFh9PuV/7Ted
   g=;
X-IronPort-RemoteIP: 104.47.57.172
X-IronPort-MID: 98121982
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:b7dDjKIvzGGPccN1FE+R45QlxSXFcZb7ZxGr2PjKsXjdYENS32YFz
 WUcWz3UOfuLZWb3LtogaYW2901V7JeDx4IySQplqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5AZhPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5QHlBTr
 qwbGQsGYyuArdyK2YKjSbZF05FLwMnDZOvzu1lG5BSAVLMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dopTGMlmSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzHOiAttDROfQGvhCmgysmmU/CCYsS1K7mNaclXSses9tE
 hlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWKTVqN+7HSqim9UQAXMGsDaCksXQYDpd75r+kOYgnnS99iFOu5i4PzEDSpm
 jSS9nFh3fMUkNIB0Li98RbfmTWwq5PVTwkzoALKQmai6QA/b4mgD2C11WXmAT97BN7xZjG8U
 LIswqByMMhm4UmxqRGw
IronPort-HdrOrdr: A9a23:5b1FRKrxXswKM1Il3enyTWoaV5uML9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssSkb6Ku90KnpewK4yXcH2/hqAV7CZnishILMFu9fBOTZskTd8kHFh41gPM
 RbAuJD4b/LfCBHZK/BiWHSebdB/DDuytHtuQ609QYIcegeUdAH0+4PMHf9LqQZfnglObMJUL
 6nouZXrTupfnoaKu6hAGMeYuTFr9rX0Lr7fB8vHXccmUSzpALtzIS/PwmT3x8YXT8K66wl63
 L5nwvw4bjmm+2nyyXby3TY4/1t6ZfcI5p4dYOxY/ouW3TRYzWTFcRcsnq5zXMISdSUmRgXeR
 /30lUd1opImjbslyqO0GbQMkHboUoTAjnZuBilaDLY0LLEbSN/BMxbiY1DdBzFr0ImodFnya
 pOm3mUrpxNEHr77VLADvXzJmVXf3CP0A0fuP9Wi2YaXZoVabdXo4Ba9ERJEI0YFCa/7Iw8Cu
 FhAMzV+f4TKDqhHjjkl3gqxMbpUmU4Hx+ATERHssuJ0yJOlHQ8y0cD3sQQknoJ6Zp4QZhZ4O
 bPNLhuidh1P4YrRLM4AP1ETdq8C2TLTx6JOGWOIU7/HKVCIH7Jo46f2sRB2Mi6PJgTiJcikp
 XIV11V8WQ7fk7oBMWUmIdG6RDAWiG8Wi7xwsZV69x4t9THNcvW2O24OSITeueb0oYi65fgKo
 mO0bptco/eEVc=
X-IronPort-AV: E=Sophos;i="5.98,219,1673931600"; 
   d="scan'208";a="98121982"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVqHMaBWMGg108a4EjvAlO9ZV6i70yzh3REPoH/F4FVokB6uShxk2ZchX0vO8HSFlaYJffPe4Azazy56eZqo6CyGcVKblyjVc3MGi7wo9Ci8rvKg1PW3N1/FtNI0GioFFI6K5vpdxGnQEJ2Df0ZG8pVgqDsHs+0E90Ka9R4jxYEYWLsifZLQvGIHsBmD6WUavS3KEZltTtbl45D+VqdTU35p4QDUNk631LCMgjJDAA1SDF4Lj5b8DL+9gPJSLBEV19+lH1/Bxc00QvGyd/fblfqzwcpVRoxFww8dUGE+UkjRz5lmZ4TMJ/jMyHFzvWzHpVXbGMvJAP7WgyF9/e/xkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1to9aRY6q6+ihjbE1wXGsg7foa49JBm9ylY9Csrzio=;
 b=J1TLNHFggS1Hqectb8yVixUNsItKlRYFOXBUf0gFtSSQJZQ9OZmX+q36XsSBkcRHg0ZzVwu8KPOIX3bTMXjpleAarixECfPuKJ0uck4J2PImqFGOMGTvLGu6pSgPfMGDzCLCbhivhTGyxvlyFaYcBHUQGABXbr9Bh5ULMFdb0eHzbklfWalk4rWrZw3PESuQDGpP+TkIvpwx2UMglzRrNrNLRxTN17YbfUiQIakWdWz/QVZk5v5kiFPOFiDXW6mO4I3IWQVfhhJfOrufbVbPlg8cR57gFU39CAqJqsjHdLMl15f49EIW9phCBPThixkd/4rEyNL4CWalGMitwlxI8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1to9aRY6q6+ihjbE1wXGsg7foa49JBm9ylY9Csrzio=;
 b=EEnY7ZfFsE9ZPlZfO5Q83CyCO/iepvE1Ghn6YxQlLDdgricSQz6cPj7HTe+eyBu4Ldv46S0HbVxR9JP5WApZ0GCQeqht3Yp3E0N0av5Ok5tHrQ1rWC1Sm00tc0nlDs2cupBqdz1HDKXVdRaMBOkfSCq/gPDLzJhLIcaP/RbC6ao=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5feae090-89b2-2c99-06d3-5735088ca41d@citrix.com>
Date: Mon, 27 Feb 2023 19:51:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] core-parking: fix build with gcc12 and NR_CPUS=1
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>
References: <3e72f386-7afa-84a5-54c5-14d17609dac7@suse.com>
 <3ca0416c-0d16-1345-0d42-6c66759e477a@citrix.com>
In-Reply-To: <3ca0416c-0d16-1345-0d42-6c66759e477a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA2PR03MB5818:EE_
X-MS-Office365-Filtering-Correlation-Id: 03c3e73f-9d95-4dd4-a5f8-08db18fc00e3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nXuPGf/SK0pmG7l7nC9a1ZrZ1HReS2noQQXQ8MxSBwxH7r2cxLVLJxtEoAOu16rDlPJ8pO7BQ2MFTJwVz8mXk9nivBSuoEnZ3eS1NhaPhnKr2JzM/1NWge2yvoWdq3YSnmPMpulZZRJwEHjc/dhUBpMdCL742dQ+56guUXTUsgjAOJezura5aYWhH5MS198j4tnxztYIeSShc8HV3qTUmzKgmlAruHTrch1Mt9Xo3MPcec4Y3b65do77ININsRGI7ScY982qVoY9ekynY9rtykawOh05ci3giG2LtiMTWO50/GsHbXNLOFDD/d94HnnUULyjCE6oOmpzjeNI0g3oHsjaGu18P5FHWL3HAvBWwtTf34xqbcIAIttBgkKdTKdCAaTonkJm8QPxQ7oFX+iQUWUTJA0l87raV/fS2Gon/a8B1pc6QiqKGeOHPAHwYkybb0yzM9q8729XFVS2kcHvdaPU405I5zg7UfbJQv1m6mDFHbrdxY/NjsybwmnLre25S0xFVdF4/ZKLdzRdQbAxFTIXNS3kKCpFc6xdOyrZe8vFtg5gtQTVS8PN/zWKO4jPGrm6XDyTnZVNkON2ry/L5W/z5izHL98DEZfHpvHYEh4xDNMFAcr2vnnYBWB5NzwQaw8ZSNsif/okgERSice4tn6djOs/lOKFNTQrv1yu+qmVbooDBDpOIii/UwCzPEVOGw3kcxxiuXyR4eXwtDc9xBgPz7s3XHxQX8uh6sgFsx0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(451199018)(186003)(2906002)(38100700002)(82960400001)(83380400001)(8936002)(66476007)(41300700001)(8676002)(66556008)(4326008)(5660300002)(66946007)(53546011)(6512007)(478600001)(6506007)(6666004)(26005)(2616005)(316002)(36756003)(110136005)(54906003)(31696002)(86362001)(31686004)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWdwUWk2RlAraUljOW9xMi9WOXRjU21NUS8xRGlLMjltNldzUUlZWFlyUGVn?=
 =?utf-8?B?T1Nzdm9oeUhoNnl0bkZnWWdmL2o4cm5ibTJyNFlYY2REQXQ1ZlEvSHZpNzJl?=
 =?utf-8?B?ekw1NVdJUWhEMVhDeUFrU2ZTdG1kMHE4dnNtdC84RTlKNnRtaTNpWFVmRmJB?=
 =?utf-8?B?WWl5bUtXMUNlaGlXRkZpODZuTEpyQWRST2xpMWdsYm5GVEJqd3dZaVYvMm9P?=
 =?utf-8?B?WnRoOUNtcTMxUlkwUldyNGZFdE1UQ3RjNHFCMWF6Uy80dFAvc3p2cGRPQWFD?=
 =?utf-8?B?dGZnVFIzOCtwTDd3enpGUWhKV3JiT1pleTR6bEFWOHdpS0FTWG9Eam4xa1Mz?=
 =?utf-8?B?ZjEvYS9mb05WaHRLbml5OUhPSlYxQkpiVEVCejhIbzNnWXhFVDQxUjFvOHUr?=
 =?utf-8?B?MHhmSDR5cDJsWWpVYUUyVDVIbVZ5SGpOOUQzSFUrdGgyeDdRT3lzZFVNR0RL?=
 =?utf-8?B?NTlVcUFYTkM3VHMvY0ZtTGhPMjRGZy85MmNsd1FsWHZvU2Fvd2c2QlVjVm4y?=
 =?utf-8?B?dkx1TzgxUDF5MjdHUWowS0Q5SVlPMjhXeHcwR1BTT2lVMXJoOE81cW96Smwx?=
 =?utf-8?B?YU1uaGFYdHdHWldyVElXTEh2a3FPaHRLcTVoQ2RRZkFUb0JNUnhPMnVoaHUw?=
 =?utf-8?B?SzNCOHlwTEdsZkR6Z1F1cHlnajR6NGVINHNhalM2MDByK2VqQXA2TmJzeUMz?=
 =?utf-8?B?QUZkaWQzZVhwM3BSQlBKN2FZdkNRNVBKckRjU01pVXoybUNzUXlMUEROVGI3?=
 =?utf-8?B?RWExTjZMQ2c0a0h0SG9uNnJvQXNDck5kTU5SS3RVcVM2ZFZ1UlJvbUpjN3hs?=
 =?utf-8?B?OEx4Q2NFU3dka0ZoTWZMWU5JaDl4SFhpZ3p4enlwcmQ4ZFloU3M1YXFoNWFR?=
 =?utf-8?B?VkMrZnIwN2Y2VGxDR2dUYXNOTG5BUDY5RmFMdWlDd1h0a21oM3pyZzZjUTdZ?=
 =?utf-8?B?aUJuZUx0Ynl5cFRzRDhhSlRxNnBBVGVPSHR2NUF0VlJoTEJSb21UV1lkVDdD?=
 =?utf-8?B?NVVHak9jZWF1S214dXVDUSs2RzIwQW13UmlJVDRGNDBPL1NTOWRYYk5vSDdM?=
 =?utf-8?B?UEoyVzBZVHNHMnMwd3VyQTU1QmtkS2lOMU9RRVdKUWh1cCs3K0NXc0UrdzNk?=
 =?utf-8?B?YXJzZzFoMHRqK1dWdy8wSlhaWDJjN1BwdVdsdW5lakwxN0czL2s2VnpERGlR?=
 =?utf-8?B?ajE5UVViVnhXMEU5TDk1VG9vUHA0S3Qzb210cEVuQWU2YTJFVDlzcXNGVXpr?=
 =?utf-8?B?N0V2c1ZGRzlQR3hCL1FzRk9wNStuci90akVkSko3WmtOWTNOb01TbHpRVWFK?=
 =?utf-8?B?Nk9tSXFoWU13Y3VMVkFOZXlmRzJYUWVoRTNZREFVTjZwc293NzdFeU41UE5p?=
 =?utf-8?B?RnF2VzEwZDFsZy92QkViQTBQeWpmRzRpZFJtN1NTd1FwSWQzbTRERGZHWjFt?=
 =?utf-8?B?WDByN00rd082UFk2U3VGRUZiTE5EM29yYmVsaDg1YlhCTForcEY4UEpSKzdE?=
 =?utf-8?B?b2V4aitvQTVvWjVHVlNxcU5uZnFNbTlRS0hNZmFLcFBGbEhjMUtoMnZ2akIy?=
 =?utf-8?B?U0ltL1M1b2ticVF0eVd2T3dEbmxndDJySFNTd1B4ZG9tTDhmZDhKaGMwVjNz?=
 =?utf-8?B?ZVlIYTRnam10VCs0cnhmT3ZlcTVCSlRWR21RWmgwbXlYdUdGWjh3NXg4d09K?=
 =?utf-8?B?SEQyQTdLSXN3aXpheWdCbnczdmtmZUZPTjFvY0wxMk4vaFpHL0E0VktKRS9l?=
 =?utf-8?B?UHhyMEFxd3JNL1NyZTgxa09seE1TUzhLYU5qVG5xeWxoMDRCWGRtUGhtRkhx?=
 =?utf-8?B?bk12T1FxVTFTY3dEYnZCWDd5cE05V1pzUkMwdUo2Mk1WdTJXRU1BRG1qYXdk?=
 =?utf-8?B?bGYwQ1Eyam0vRFVoblNhMzhMdEZHbTB0MjAxb2xxTmFLbDNxd1dITDlYNDBK?=
 =?utf-8?B?bFZxR0VGdEpYVTkvcXJkb2VTcld4YURPWG40SDdwSFVsMThjd1RlMTVqalpn?=
 =?utf-8?B?ZFJ0cGNSTmd3S3BaYlJwVWcvNkpPNC9SODN4bFZOWWdxOWpUTDZDQUxYVzR6?=
 =?utf-8?B?bS9LcE5TWXFrNTMrSlZlWm5VenB2Z1pPcmx3ZldPT2NRSE9LOFNOdE1HZklw?=
 =?utf-8?B?cmx6UHRsUXU5TlFXaTBLMWxVeXNmU0hUa1FBY3g1c2RJdEdRUmFNd01QcU5X?=
 =?utf-8?B?akE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+9Ua3T1AL5huGe23qXgGog4T/5DFrGsOWE9kVD9vXVLxNbsuFwhkQ1ohp++cVC0kfAI8rxM8tKTGl8fSES+h1lvfZ+YMfVq+WbfZRSx78N4tWOXHJhS3w0PbDYTgjJLxEdb6RkrySBwFiMrIGPcH/8IdCRrQeES5PVyoyPe3Wya5wbrlVYlRhVsAER8QL5yOn0z8QocIzDwF+5KdKEu3Q66Jwb2efYSFJMPwOkQ+I8ezSxZ3Cl2/efH1BVq6fJpGLz2Ik74B6Zq647Bj0du2huA4sfjKUX/b3BEZDy2K2yYBc1bq6KUDjTemo/dND0V33g/jXfX1/UPzAKTIPg4n6AoBWpH64B///T+thBo4KpUrQbpyczkg5P/8m7jv8guYtZve4ukrQRHMBUZ794IrKImlftRm2qjz8sbsrdUnsrktlrlLkSkt9lICdrA0G/8KQV4WCbKgCzdZGCOIqNXuDknVlVaweRBThbLwUD69/Sw/JsFvf6ENpP9tUvN4jQLvXBPpQEVjI6lCfDBlDFQZIn+dHBh2RSBreq70XqkbwTpe91a+6xJtn9doz64saDivPEtG333DY8gmWj013OXK+RucVg/gDR9nuXBtf6Etq3mn+XhTsrAJ4f/LVSxkJGBLPHudqGLfwO9OdY4bIUVsqBhUSBNX760Ein7eAiTPbL1x1cPAz+fKxFlVW2dswNuHQLXcGj8EQ5KU1r4wXvyaNt1holrQJyKrSq7UZOh4lOpFjONkSQoQ8WbagzpN6jhmCKipux9/uhZX4CDPRgwtuSVdXFFQJr4fLydyiNER1TEededETdD0aXgnuT+WU2tx
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c3e73f-9d95-4dd4-a5f8-08db18fc00e3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 19:51:23.1770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/CLA/BoEbZdRfKVYKnxcSkKyVSiV83SCpdcz+qPPflspFLBpgBMJ6U0TI2V3DQf/LR3uqlQIA+9Rnp0brjrRFu/fuUqxX8jZ5FZM/pKMVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5818

On 27/02/2023 7:43 pm, Andrew Cooper wrote:
> On 09/09/2022 3:30 pm, Jan Beulich wrote:
>>     select HAS_ALTERNATIVE
>>     select HAS_COMPAT
>>     select HAS_CPUFREQ
>> --- a/xen/arch/x86/platform_hypercall.c
>> +++ b/xen/arch/x86/platform_hypercall.c
>> @@ -727,12 +727,17 @@ ret_t do_platform_op(
>>         case XEN_CORE_PARKING_SET:
>>             idle_nums = min_t(uint32_t,
>>                     op->u.core_parking.idle_nums, num_present_cpus() -
>> 1);
>> -            ret = continue_hypercall_on_cpu(
>> -                    0, core_parking_helper, (void *)(unsigned
>> long)idle_nums);
>> +            if ( CONFIG_NR_CPUS > 1 )
>> +                ret = continue_hypercall_on_cpu(
>> +                        0, core_parking_helper,
>> +                        (void *)(unsigned long)idle_nums);
>> +            else if ( idle_nums )
>> +                ret = -EINVAL;
>>             break;
>>
>>         case XEN_CORE_PARKING_GET:
>> -            op->u.core_parking.idle_nums = get_cur_idle_nums();
>> +            op->u.core_parking.idle_nums = CONFIG_NR_CPUS > 1
>> +                                           ? get_cur_idle_nums() : 0;
> These don't look right.
>
> If the core parking feature isn't available, it should uniformly fail,
> not report success on the get side and fail on the set side.

Huh, and in extra fun.

It turns out we've had core parking unconditionally disabled in
XenServer for ~9 years now.

It looks at the idleness of dom0 and starts taking CPUs offline, even
when the VMs are busy.

I don't see how this functionality can ever have worked suitably...  I
think there's a good argument to be made for having it user selectable,
and frankly, off-by-default.

~Andrew

