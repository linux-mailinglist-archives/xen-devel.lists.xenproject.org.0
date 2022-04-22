Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B10E50BFF3
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 20:50:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311180.528267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhyM4-0001SL-Ou; Fri, 22 Apr 2022 18:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311180.528267; Fri, 22 Apr 2022 18:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhyM4-0001QG-L8; Fri, 22 Apr 2022 18:50:08 +0000
Received: by outflank-mailman (input) for mailman id 311180;
 Fri, 22 Apr 2022 18:50:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+xj=VA=citrix.com=prvs=1042e1a12=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nhyM2-0001Iq-8K
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 18:50:06 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 046af9ff-c26d-11ec-8fc2-03012f2f19d4;
 Fri, 22 Apr 2022 20:50:04 +0200 (CEST)
Received: from mail-bn7nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Apr 2022 14:50:01 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL0PR03MB4244.namprd03.prod.outlook.com (2603:10b6:208:6b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 22 Apr
 2022 18:49:59 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.014; Fri, 22 Apr 2022
 18:49:58 +0000
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
X-Inumbo-ID: 046af9ff-c26d-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650653404;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ku9iOS7qDiztKx5YVvBRja3pzeOHCfJTACA0ZiezsS8=;
  b=GUvzgPdzO/ex2kdF7QervxZAAv83wBaKhA65OHg3newrlWWJdHSf1mU/
   gPL5GfquBXNtLs79JCWuzDKuKvjf/bAA/JQOdfQ7hU/BvMCbUoCS2Aa1F
   UMh4zF8ZDv3RwnAVUEFtMt41NO8gk099aeAqSPdQynMn/fBugYnOJ6DTO
   o=;
X-IronPort-RemoteIP: 104.47.70.102
X-IronPort-MID: 69129382
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:oVT8BqNMZ9ttEhfvrR3WlsFynXyQoLVcMsEvi/4bfWQNrUol1GdUn
 2AZXTiCMvyDamSjfY1zbIq1oUoGvMPUmN5rHgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2NQw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z7
 vpz5aydVwQVD4rNorkAdxRRNTB/IvgTkFPHCSDXXc276WTjKiOp6dMxSUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB5GdaaG/+iCdxwhV/cguhnG/rEa
 tVfQj1odBnaODVEO0sNCYJ4l+Ct7pX6W2MJ8QjE/vpti4TV5CFc9eTUaMrlQcODQeVQokqW/
 Uf/xE2sV3n2M/Tak1Jp6EmEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24ma8Ud9CL
 00f+gI1sLM/skesS7HVQBmQsHOC+BkGVLJt//YS7QiMzu/e5VmfD21dFjpZMoV+7okxWCAg0
 UKPk5XxHztzvbaJSHWbsLCJsTe1PitTJmgHDcMZcTY4DxDYiNlbpnryohxLSsZZUvWd9enM/
 g23
IronPort-HdrOrdr: A9a23:Ul9vcKPFLk9OSMBcT5j255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90DHpewKRyXcH2/hqAV7EZniohILIFvAu0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrjVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKUySw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8yfT9aw+cyDpAVr4RH4FqjwpF591HL2xa1u
 Ukli1QevibLUmhJ11d7yGdgzUImwxelkMKgWXo/UcL5/aJBQ7SQvAx+76wOHHimjUdlcA536
 RR022DsZ1LSRvGgSTm/tDNEwpnj0yuvBMZ4KYuZlFkIP0jgYVq3MUiFYJuYeU9NTO/7JpiHP
 hlDcna6voTeVSGb2rBtm0qxNC3RHw8EhqPX0BH46WuonJrtWE8y1FdyN0Un38G+p54Q55Y5/
 7cOqAtkL1VVMcZYa90Ge9ES8qqDW7GRw7KLQupUB/aPbBCP2iIp4/84b0z6u3vcJsUzIEqkJ
 CES19cvX5aQTOYNSRP5uw+zvngehTMYd228LAu23FQgMyOeJP7dSueVVspj8ys5/0CH8yzYY
 fHBK5r
X-IronPort-AV: E=Sophos;i="5.90,282,1643691600"; 
   d="scan'208";a="69129382"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSPzWISr1/bPwzdLT41sDLuGv5OU2sX0+uM7sEBPxzHT+PHZkt04u55BG17ie/4eOatlj632lKvzUfE6juiYdGLogXPmX0BTY+OIChTCwUu6F1+nj3nq7KOfDMBEo2mt2M6KKjW8OOBhKool6nNROuhcVF5F3Yi3C9Z7pUgieTEGaTORqN1D0m3WcP+RJiR2il5PG8bMCcmoYkPSnOfMv8lHmvnb0gcTmKY/48/WiJ4Q/kO+STOY9fkWFc7GfB7yeh9HXQl3ej4G8klE2UPifI07upgXh+Z0uXk2Z92fE/pD8945uQRcX8TWtW1k+/8jWURhZbgi2ubLIxno7JdjbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ku9iOS7qDiztKx5YVvBRja3pzeOHCfJTACA0ZiezsS8=;
 b=Wei6+WGhHoJgYX3E8YaE4pct5UUYpa7ZAjGZHpZciFH+PPt/QZosYFUw0H9iQ63nBNPWi3WkcLLR1pMo7f0/bxcbMv9iqT4JSju7sFM6cKFc2egu2FdUGeGrhg633BPfsaIemyVoyM+Q7npI/ZyPGYtY23+bPD3d3nXy8ucaJuX+1gQ1Lxq6TPxM8Pdm0zlfWa6PwSn/Qh6R6nUKHXkPlocT0lDgOiwc40oKHuRVK6YAGAc+XAOn7gECv8kW0KZLAGS7iqshEdb+S6yrfya1gW24rXAvCsuf87ByivXa/441O90bYy7yGy+1mQrnhMrE1suuloeJsLsM+4MBENsUyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ku9iOS7qDiztKx5YVvBRja3pzeOHCfJTACA0ZiezsS8=;
 b=HJFEGObeVpdD9GLa7lfjxDYTw6q+fSLJ4Bkys8h55shvvJ5v/qhnkLMXQJS0cLx2Br4VuUztFavTuV+KZSoSg8byn7d8Iia4yDk/eUZ+2yNcQ41jUUl1ZfZV4E26i8z4fATauXc0RMO6hLfCh8/7xl35v1Rs8oJNmTnSz1OTAc0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 0/3] amd/msr: implement MSR_VIRT_SPEC_CTRL for HVM
 guests
Thread-Topic: [PATCH v3 0/3] amd/msr: implement MSR_VIRT_SPEC_CTRL for HVM
 guests
Thread-Index: AQHYROG7H4IUo8Py9UONHlhaTBRq8az8acKA
Date: Fri, 22 Apr 2022 18:49:57 +0000
Message-ID: <9f510109-df45-af7d-1c0a-49ef435e371f@citrix.com>
References: <20220331092717.9023-1-roger.pau@citrix.com>
In-Reply-To: <20220331092717.9023-1-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fead6591-6893-4d63-100a-08da2490e5fd
x-ms-traffictypediagnostic: BL0PR03MB4244:EE_
x-microsoft-antispam-prvs:
 <BL0PR03MB4244F935A342CB548B3CE491BAF79@BL0PR03MB4244.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ggMnIGpiwzVgFKnYlHD3tsBDpOlJofMC0pgK6vSN6VIL77NWps+WsdvBXeY1o3XSeW67ZjKMVEE1edeSc7VVM1XZbBKofM5KhhN3WPa9pB2FAefJYVY2TGywr/VRZ5oa4r3rubY+eeM/tN2A+xbp3D2innduDjqm1FSe0XWGSNtjaX/2FXtobxG+UbgaFhAYTSuqR3BpaY0fZAmEUQ2eg64Q2K6YDFKwpMqSa1kish0vpiHC/bgl2p8SxLl8iB7YWXn16vjlwCZ+3v0oZbj1udtOrACVjiulmM1LTZRx2U4L+PkRX9bbWnN3kGu+GLSTWvkk90EhSLq+VEPml60UU8CovDUdX5PiC1Z+aouJLRZMb9jHjRjps5eBSchzT66t/P6lSr+F9CrHiuVeU7RhLipHwqGlk2bVC2/uu8pbokD47gMUkSwdCBp+6UICA94HKiBg06oqm9eAjRKYdyW8NEXE2a5llYOdIm3zDDM6yYvB5dqiyE+fDUvRhAEACP4M9yhMnTjFwcjzH1YbilO15vF56mAVCLMPxjwFrKihCnqTq+zUm00tgOphBO547xfQuFvD6sKnxPUykk4qyaHIaP6zEhPPsy/aaiXPvb3srzSYXzaNU+GAQeicgvCFabPAL4K86mGw1FdP8Paa4fbLuxxxyDjxNotV8TajAlMdHSVP4gCT1kxd+jR2s7lUz3FbaesxA5jhct+yR4b8gROh+LKN/62z/2v34SrC3qkC1LUnB0yAo5tXvtZfWu6AfuQWKXqVWqVkrTh4lNBVmgSmcw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(8676002)(26005)(71200400001)(64756008)(66446008)(66476007)(66556008)(76116006)(8936002)(66946007)(91956017)(508600001)(5660300002)(31696002)(86362001)(6486002)(38100700002)(38070700005)(82960400001)(122000001)(6512007)(186003)(83380400001)(53546011)(2906002)(2616005)(6506007)(110136005)(31686004)(36756003)(54906003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bzByendPU01CRzU1UGU3V3FPbERNaTJkaWVpRXd1Y3I3T2hBM25USnUxbVdr?=
 =?utf-8?B?eks0N1lJZGlTaUZJZy9SZ1ZESFhmN2FFMU5vSVVvWC9PNFh6cEphZ2N6VjZT?=
 =?utf-8?B?ZW44blc1UkxyRmt0UWNTQm5nTzRwTjl5QWk3NHBxVWtOTDQ1UmFjMmc2b2xD?=
 =?utf-8?B?Ull6VmV2Rlo2OWI4WW53TEs3U2pyV1ZRaG5hWDhZUHlUdTRmYk1HZENwVUwy?=
 =?utf-8?B?eCsxSEliMHVidzkrWjh3cTZwT2NDMFNkRmFxOVp3UC9yZVl3WHAyaGs1RkNZ?=
 =?utf-8?B?TlRFN2FSbzJWc2dnNDBMSm1nTDg5VWNXYzZLaTN3a3Vtd2h2UGpOVXU1cndX?=
 =?utf-8?B?MnVvUy9XODlMZzZKTEpHc2RaSm5ZMVVmdVhPdGs0UXdaUGkxQWwxdnBkZlVK?=
 =?utf-8?B?QmVGcDlrc0J4ejY5dmh4a0UwbWNJVG5GVHJrNUZYcVU3YUpVOCtvQzBjM0Jz?=
 =?utf-8?B?VFlnOUF0ZGZTcXNGY296a0Q0d0VFdjlxZmFxdWR6cENSSEJuSjBhTlpLV1Jq?=
 =?utf-8?B?QXU2U01vQ3A4cGN4clZYR3NGT05kUEhYM05zL294Z0RENVlMUzZJYzJ0cDJD?=
 =?utf-8?B?aUxNeURhc3gvV29jV3JpQ04zaG1mMzFHMHUzZDU3Nkp4REhObU1VNHFpaGRK?=
 =?utf-8?B?d010WkMxQytUS0NOczgwWnlGZVlyYkxCeHB3TDVMSFBQRHJwV3hPcTBzR0Y4?=
 =?utf-8?B?ZlZvT2FBUTFSaUErOTNPWVRBNFZiSFJRR09HbUUvN3daVUNFdWFSMjNSc2k1?=
 =?utf-8?B?QTdSRnY5LzhaYi9TZ2U0SHprVXZ3UGROZ0twK2JoMlBteXE2MlU0SnBDMGZV?=
 =?utf-8?B?REUxb1NQQVlSSjMyZ3ZaV3pqaW9iZWljRU50dkt0a3VRWFg0d08wZEZMZ2Q1?=
 =?utf-8?B?UmRkbFNsVjlveDVsTFlmRlhDSXRUU0M0YnVjQmlRci8zdnE2enlMQ0JVNURN?=
 =?utf-8?B?SDd4dXBpcTRhYjlqazAvRnRmUVlnSm1DME5pVXFWaXpmNVFmQXMyNXBVTkZs?=
 =?utf-8?B?ZVg1dGY3UnpxaFAxTEFHT2NlYm9VYUo3NkM5aEZyU2RjU0oxazJ2bmkxSnEx?=
 =?utf-8?B?SUI2ZndLTm1ucTVLcnc3S2RBM1RueHExaVRiSExvUHpqZHp1MElMa2xsKzh6?=
 =?utf-8?B?bzVjdHNWNEs0cGcxSUZxeTNreDlKZUtzL0JCQlBlbFI1S0VmcEVVRHZVM3lJ?=
 =?utf-8?B?Z0wweTlGaHY4aWM0T3JTeVgxQVgxTldBWHkvUzNWeDFjYTR1OFdYQ0swTC9X?=
 =?utf-8?B?aG5zdVRDbGhrNWx5SE1PNGNNY0QzM2Nxa2p2Z242L3RJUWIzV25tWUQ1YzZV?=
 =?utf-8?B?NHF1RTdPdjkxUnZBNi8zTURreXNzQk9lSy9BSGVxcWdjM0FOTTV4QjYzUU95?=
 =?utf-8?B?WEJQd3IrWFhOVHhjeFhIWWhvY1paOWZmNStpK0xyUWZIcm9lc1RmU1R3QkJF?=
 =?utf-8?B?R3A2VW56bFFyWWRnNCttbWhMRFJ6c0JGU2FhZENGVEU4ZGMyaHo4emErbkZw?=
 =?utf-8?B?b3RPemY0NmxLY3o4R3FDKzBkdnNuQlpaS09qRGhUeGVIOXBrdkZjQ1FTTFVN?=
 =?utf-8?B?UU1BWjVDZmhPWUhJcVB3MWRNWVRZOFhQZ0NmSTJ1Q2FlZmdUQ2dmRFhzM0dv?=
 =?utf-8?B?ZFRHU043NWFPWDdOSUk2UTFZRFBPdjBNVXFqR3AwcnpvbVZoVllXMXJtaE1T?=
 =?utf-8?B?Ym9lNkVvUzVWdkhNS20vZlRqVG55UFdOMmN1TlJIZDlvSHFiYnRacXhwNzlm?=
 =?utf-8?B?VmcvNWhBUlU1cnlzVzFpVlY2K2lLbHNLTW1na0M0aVpCNUo5T3RlVEl0UHF6?=
 =?utf-8?B?LzN2YktEdnBrRkRMRk5scldMbFZ3MzBpb0JGMFpSQmx5NVp4b1FSbmNxRzRZ?=
 =?utf-8?B?WW5rdGhNSHRybDE2N2RGeEJ1cWhwTE5ucUlTVWtCTXV1UGp5bkpVckdoNy9V?=
 =?utf-8?B?VXpmL2t3OCswZHRzUXo5b2V4c0o0SGlBNk5JeklTZGFFWFhYRlF6MS9qNkpI?=
 =?utf-8?B?aUc1N3FWNmp0Q08zYVUvOGFUeSszRTdwd0hhWkVSamZhM3JoNzZCZ0MyNzZP?=
 =?utf-8?B?c0VLOFVkUk5HREVkT3BnZHZ5S0JpQjlBNUFZV01BQ1dxUWFvQXlIcVNqODYy?=
 =?utf-8?B?bHV4NCtrYzI0WG9NOG4yeTBuV3F3RHAzbXg1M3ZTTjlydEVTTlVqOFdTbHFs?=
 =?utf-8?B?SVVsT05tazZxVDVSVGRJY3ZSWHRmSEx2L2xYaWIvUmg5QmduMndXbk5ETVo4?=
 =?utf-8?B?L0VLT3BXYmwwUWdVVTVyTUlBMFRTVXJ0Y3l4ZTFac0tTdEJGTGlQUlNDc3hG?=
 =?utf-8?B?d2wzYjhZdW1HL1dCNmJtbTBlNjhmUC8yVGREakZxay9PQ3FLWVBCZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0281D12324C2E148A484F96D7A035571@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fead6591-6893-4d63-100a-08da2490e5fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 18:49:57.8179
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oyuHtCMYwkh91f665JfRrEJFBpcvzmiyYz/B7pwqkZfzQNvJALPHvzfabJfpab2j1pGjj3XDQiCToAOnTNnvti7Ac/3sNUeVu6v8dyMMrfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR03MB4244

T24gMzEvMDMvMjAyMiAxMDoyNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBIZWxsbywNCj4N
Cj4gVGhlIGZvbGxvd2luZyBzZXJpZXMgaW1wbGVtZW50cyBzdXBwb3J0IGZvciBNU1JfVklSVF9T
UEVDX0NUUkwNCj4gKFZJUlRfU1NCRCkgb24gZGlmZmVyZW50IEFNRCBDUFUgZmFtaWxpZXMuDQo+
DQo+IE5vdGUgdGhhdCB0aGUgc3VwcG9ydCBpcyBhZGRlZCBiYWNrd2FyZHMsIHN0YXJ0aW5nIHdp
dGggdGhlIG5ld2VyIENQVXMNCj4gdGhhdCBzdXBwb3J0IE1TUl9TUEVDX0NUUkwgYW5kIG1vdmlu
ZyB0byB0aGUgb2xkZXIgb25lcyBlaXRoZXIgdXNpbmcNCj4gTVNSX1ZJUlRfU1BFQ19DVFJMIG9y
IHRoZSBTU0JEIGJpdCBpbiBMU19DRkcuDQo+DQo+IFhlbiBpcyBzdGlsbCBmcmVlIHRvIHVzZSBp
dCdzIG93biBTU0JEIHNldHRpbmcsIGFzIHRoZSBzZWxlY3Rpb24gaXMNCj4gY29udGV4dCBzd2l0
Y2hlZCBvbiB2bXtlbnRyeSxleGl0fS4NCj4NCj4gT24gWmVuMiBhbmQgbGF0ZXIsIFNQRUNfQ1RS
TC5TU0JEIGV4aXN0cyBhbmQgc2hvdWxkIGJlIHVzZWQgaW4NCj4gcHJlZmVyZW5jZSB0byBWSVJU
X1NQRUNfQ1RSTC5TU0JELsKgIEhvd2V2ZXIsIGZvciBtaWdyYXRpb24NCj4gY29tcGF0aWJpbGl0
eSwgWGVuIG9mZmVycyBWSVJUX1NTQkQgdG8gZ3Vlc3RzIChpbiB0aGUgbWF4IENQVUlEIHBvbGlj
eSwNCj4gbm90IGRlZmF1bHQpIGltcGxlbWVudGVkIGluIHRlcm1zIG9mIFNQRUNfQ1RSTC5TU0JE
Lg0KPg0KPiBPbiBGYW0xNWggdGhydSBaZW4xLCBYZW4gZXhwb3NlcyBWSVJUX1NTQkQgdG8gZ3Vl
c3RzIGJ5IGRlZmF1bHQgdG8NCj4gYWJzdHJhY3QgYXdheSB0aGUgbW9kZWwgYW5kL29yIGh5cGVy
dmlzb3Igc3BlY2lmaWMgZGlmZmVyZW5jZXMgaW4NCj4gTVNSX0xTX0NGRy9NU1JfVklSVF9TUEVD
X0NUUkwuDQo+DQo+IE5vdGUgdGhhdCBpZiB0aGUgaGFyZHdhcmUgaXRzZWxmIGRvZXMgb2ZmZXIg
VklSVF9TU0JEIChpZTogdmVyeSBsaWtlbHkNCj4gd2hlbiBydW5uaW5nIHZpcnR1YWxpemVkIG9u
IDwgWmVuMiBoYXJkd2FyZSkgYW5kIG5vdCBBTURfU1NCRCBYZW4gd2lsbA0KPiBhbGxvdyB1bnRy
YXBwZWQgYWNjZXNzIHRvIE1TUl9WSVJUX1NQRUNfQ1RSTCBmb3IgSFZNIGd1ZXN0cy4NCj4NCj4g
U28gdGhlIGltcGxlbWVudGF0aW9uIG9mIFZJUlRfU1NCRCBleHBvc2VkIHRvIEhWTSBndWVzdHMg
d2lsbCB1c2Ugb25lIG9mDQo+IHRoZSBmb2xsb3dpbmcgdW5kZXJseWluZyBtZWNoYW5pc21zLCBp
biB0aGUgcHJlZmVyZW5jZSBvcmRlciBsaXN0ZWQNCj4gYmVsb3c6DQo+DQo+ICAqIFNQRUNfQ1RS
TC5TU0JELiAocGF0Y2ggMSkNCj4gICogVklSVF9TUEVDX0NUUkwuU1NCRCAodW50cmFwcGVkKS4g
KHBhdGNoIDIpLg0KPiAgKiBOb24tYXJjaGl0ZWN0dXJhbCB3YXkgdXNpbmcgTFNfQ0ZHLiAocGF0
Y2ggMykNCj4NCj4gVGhpcyBoYXMgc3Vydml2ZWQgYSBYZW5SVCBiYXNpYyBzZXQgb2YgdGVzdHMg
b24gQU1EIG1hY2hpbmVzLg0KDQpTb3JyeSBmb3IgdGhlIG1peGVkIGZlZWRiYWNrLCBidXQgc29t
ZSBpcyBhcHBsaWNhYmxlIGFjcm9zcyBtdWx0aXBsZQ0KcGF0Y2hlcy4NCg0KRmlyc3QsIGl0IGlz
IGltcG9ydGFudCB0byBrbm93IHdoeSBNU1JfVklSVF9TUEVDX0NUUkwgZXhpc3RzLCBiZWNhdXNl
DQp0aGF0IGluZm9ybXMgd2hhdCBpcywgYW5kIGlzIG5vdCwgc2Vuc2libGUgdG8gZG8gd2l0aCBp
dC4NCg0KSXQgZXhpc3RzIHRvIGJlIGEgRk1TLWludmFyaWFudCBhYnN0cmFjdGlvbiBvZiB0aGUg
REVfQ0ZHIGludGVyZmFjZSwNCmVtdWxhdGVkIGJ5IHRoZSBoeXBlcnZpc29yLsKgIEF0IHRoZSB0
aW1lLCB3ZSBleHBlcmltZW50ZWQgd2l0aCBlbXVsYXRpbmcNCk1TUl9TUEVDX0NUUkwgZGlyZWN0
bHksIGJ1dCB0aGUgcmVzdWx0cyB3ZXJlIHVudXNhYmxlIHNsb3cgKGxlZ2FjeSBJQlJTDQpjYXVz
aW5nIGEgdm1leGl0IG9uIGV2ZXJ5IHN5c2NhbGwvaW50ZXJydXB0IGVudHJ5JmV4aXQpIHNvDQpN
U1JfVklSVF9TUEVDX0NUUkwgaXMgYWxzbyBhbiBleHBsaWNpdCBzdGF0ZW1lbnQgdGhhdCBpdCBp
cyBhbiBleHBlbnNpdmUNCm9wZXJhdGlvbiBhbmQgc2hvdWxkbid0IGJlIHVzZWQgZnJlcXVlbnRs
eS4NCg0KSW4gcHJhY3RpY2UsIHRoaXMgbWVhbnMgIm9ubHkgZm9yIHZlcnkgdmVyeSBpbXBvcnRh
bnQgcHJvY2Vzc2VzLCBhbmQgbm90DQp0byBiZSB1c2VkIG1vcmUgZnJlcXVlbnRseSB0aGFuIHBy
b2Nlc3MgY29udGV4dCBzd2l0Y2giLsKgIEFsc28sIHRoZXJlIGlzDQpubyBoYXJkd2FyZSB3aGlj
aCBpbXBsZW1lbnRzIE1TUl9WSVJUX1NQRUNfQ1RSTCwgbm9yIHdpbGwgdGhlcmUgYmUuDQoNClBh
dGNoIDIgaGFzIGFkZGVkIGFuIGV4dHJhIHR3byB2bWV4aXRzIGFyb3VuZCBlYWNoIHZtZXhpdCwg
aW4gYW4gZWZmb3J0DQp0byBsZXQgTDIgdm1leGl0IHRvIEwwIHJhdGhlciB0aGFuIEwxIGZvciB3
aGF0IGlzIGxpa2VseSB0byBiZSAwIHRpbWVzDQppbiBhbiBMMSB0aW1lc2xpY2UuwqAgSXQncyBu
b3QgYSBjcmVkaWJsZSBvcHRpbWlzYXRpb24sIGZvciBzb21ldGhpbmcNCndoaWNoIGlzbid0IGEg
cHJvZHVjdGlvbiB1c2VjYXNlLsKgIFllcyAtIG5lc3RlZCB2aXJ0IGRvZXMgZXhpc3QsIGFuZCBp
cw0KdXNlZnVsIGZvciBkZXYsIGJ1dCBub29uZSBydW5zIGEgZnVsbHkgZmF0IHNlcnZlciB2aXJ0
IGh5cGVydmlzb3IgYXQgTDENCmluIHByb2R1Y3Rpb24gaWYgdGhleSBjYXJlIGluIHRoZSBzbGln
aHRlc3QgYWJvdXQgcGVyZm9ybWFuY2UuwqAgRWl0aGVyDQp3YXksIHBhdGNoIDIgaXMgcHJlbWF0
dXJlIG9wdGltaXNhdGlvbiB3aXRoIGEgbWFzc2l2ZSBjb21wbGV4aXR5IGNvc3QuDQoNCkZ1cnRo
ZXJtb3JlLCB3cml0ZXMgdG8gTFNfQ0ZHIGFyZSBhbHNvIGluY3JlZGlibHkgZXhwZW5zaXZlLCBl
dmVuIGlmDQp5b3UncmUgbm90IGNoYW5naW5nIGFueSBiaXRzLsKgIFRoZSBBTUQgcmVjb21tZW5k
ZWQgYWxnb3JpdGhtDQpzcGVjaWZpY2FsbHkgYXZvaWRzIHJld3JpdGluZyBpdCB3aXRoIHRoZSBz
YW1lIHZhbHVlIGFzIGJlZm9yZS4NCg0KQW5vdGhlciB0aGluZyBpcyB0aGF0IFhlbiBzaG91bGRu
J3QgdG91Y2ggTFNfQ0ZHIGxpa2UgdGhpcyBpZiB0aGVyZSBpcw0KYW55IGhpbnQgb2YgYSBoeXBl
cnZpc29yIG9uIHRoZSBzeXN0ZW0uwqAgSWYgdGhlcmUgaXMgYSBoeXBlcnZpc29yIGFuZCBpdA0K
ZG9lc24ndCBvZmZlciBWSVJUX1NQRUNfQ1RSTCwgdHJ5aW5nIHRvIHBsYXkgd2l0aCBMU19DRkcg
aXNuJ3QgZ29pbmcgdG8NCm1ha2UgdGhlIHNpdHVhdGlvbiBhbnkgYmV0dGVyLg0KDQpBcyB0byB0
aGUgQ1BVSUQgYml0IGhhbmRsaW5nLCBvbiBjb25zaWRlcmF0aW9uIG9mIHRoZSB3aG9sZSBzZXJp
ZXMsIGl0DQp3YW50cyB0byBiZSAiISIgb25seS7CoCAhIGlzIHRoZXJlIHRvIGluZGljYXRlICJz
b21ldGhpbmcgY29tcGxpY2F0ZWQgaXMNCmdvaW5nIG9uIHdpdGggdGhpcyBiaXQiLCBhbmQgbGlm
ZSBpcyB0b28gc2hvcnQgdG8gdHJ5IGFuZCBnZXQgdGhlDQpkZXJpdmF0aW9uIGxvZ2ljIHJpZ2h0
IHdpdGggYm90aCBpbXBsaWNpdCBhbmQgZXhwbGljaXQgY29uZGl0aW9ucy7CoA0KTGVhdmUgaXQg
d2l0aG91dCBhbiBzL1MgKHNvIG5vIGF1dG8gcHJvcGFnYXRpb24gZnJvbSB0aGUgaG9zdCBwb2xp
Y3kpLA0KYW5kIHNldCBpdCBpbiB0aGUgbWF4IHBvbGljeSBmb3IgTFNfQ0ZHIHx8IFZJUlRfU1BF
Q19DVFJMIHx8IFNQRUNfQ1RSTCwNCmFuZCBzZXQgaXQgaW4gdGhlIGRlZmF1bHQgcG9saWN5IGZv
ciBMU19DRkcgfHwgVklSVF9TUEVDX0NUUkwsIHdoaWNoDQp3aWxsIGJlIGZhciBjbGVhcmVyIHRv
IGZvbGxvdy4NCg0KRm9yIGBzdHJ1Y3Qgc3NiZF9jb3JlYCwgdGhlIG5hbWUgaXNuJ3QgZ3JlYXQu
wqAgSXQncyBtb3JlDQpzc2JkX2xzX2NmZy9zdGF0ZS7CoCBBbHNvLCBlYWNoIGFycmF5IGVsZW1l
bnQgd2FudHMgNjQgYnl0ZSBhbGlnbm1lbnQsDQpiZWNhdXNlIHRoYXQncyB0aGUgb25seSB3YXkg
dG8gYXZvaWQgYXRvbWljIGNhY2hlbGluZSBwaW5ncG9uZyBmcm9tIHRoZQ0Kc3BpbmxvY2tzLsKg
IEFsc28sIHRoZSBhY2Nlc3NvcnMgbmVlZCB0byBiZSByYXcsIGJlY2F1c2UgR0lGPTAgY29udGV4
dCBpcw0Kd2VpcmQgYW5kIHdvcmtpbmcgYXJvdW5kIGNoZWNrbG9jayB3aXRoIGlycXNhdmUgdmFy
aWFudHMgaXMgbm90IGEgY2xldmVyDQptb3ZlLsKgIEl0IGlzIG5vdCBzYWZlIHRvIHByaW50aygp
L2J1Zy9ldGMgZnJvbSBHSUY9MCBjb250ZXh0LCBzbyBsb2dpYw0KbmVlZHMgdG8gYmUga2VwdCB0
byBhbiBhYnNvbHV0ZSBiYXJlIG1pbmltdW0uDQoNCn5BbmRyZXcNCg==

