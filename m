Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EA5715AED
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 12:01:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541051.843363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3wAI-00071f-3D; Tue, 30 May 2023 10:01:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541051.843363; Tue, 30 May 2023 10:01:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3wAH-0006zU-W1; Tue, 30 May 2023 10:01:17 +0000
Received: by outflank-mailman (input) for mailman id 541051;
 Tue, 30 May 2023 10:01:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8xzU=BT=citrix.com=prvs=507ffd061=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q3wAF-0006z5-M0
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 10:01:15 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7eb3db6-fed0-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 12:01:13 +0200 (CEST)
Received: from mail-mw2nam04lp2176.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2023 06:01:02 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA3PR03MB7369.namprd03.prod.outlook.com (2603:10b6:806:382::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Tue, 30 May
 2023 10:01:01 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 10:01:01 +0000
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
X-Inumbo-ID: e7eb3db6-fed0-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685440873;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WnJPlMSLXFSJlyjpUrBTijZJtJYvWWuyEAgSNJFjo9o=;
  b=aPUycUbUS0oS15QXqWicPYuiYelFdfaL6cZjmbRgvY/fDr8XaSYVphzw
   A3Qdcpl0DNc+7sjJE60G0eO2oY3ZTJwfquXTWbub5MoffK//zsvowMr9/
   31u5vzK7wuA7/uoTh5PyxGjhHjjGWDE8oi2qzmzicxeMeyGB4DrP0Jj+2
   I=;
X-IronPort-RemoteIP: 104.47.73.176
X-IronPort-MID: 113378520
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2JW7i6DOXFK80xVW/wTiw5YqxClBgxIJ4kV8jS/XYbTApD0m0TQOn
 TEXW2jUPv6CNmb8L9F2aonkoBsFsZWBmN5gQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G5D5gRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw4P58AEh36
 qYkOWoydVeNvMKNwpeyc7w57igjBJGD0II3nFhFlW2cKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK/uxuvDa7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraWxnikCN9ITNVU8NZz3QSdy0kNLicUcnC1jfe9zXGgfeBQf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmSzoLE7gDfAXILJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaBMQOBWoLZCtBSBRf5dDm+N03lkiWEYglF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9XABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:AoPpda5R/p6IxFX1bAPXwMzXdLJyesId70hD6qkXc3Bom62j+P
 xG+c5x6faaslgssR0b+OxoWpPwIk80hKQU3WB5B97LNmTbUQCTXeNfBOXZslndMhy72ulB1b
 pxN4hSYeeAamSSVPyKhTWFLw==
X-Talos-CUID: 9a23:Zc+bCm4gcHgXad/2mtss7lYfG+kcbSfh3S3vOAi2MkZSSpiccArF
X-Talos-MUID: 9a23:i+tECAb60npyueBTrmK1ijxHKuFS4YOFBmwDldI5pe+2Onkl
X-IronPort-AV: E=Sophos;i="6.00,203,1681185600"; 
   d="scan'208";a="113378520"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLl+N8kkucjPmlXl9fjHW6OoeHY4PRVk3fcYn2SalKj5BXAFsHrpV3gZ5EWj5rS5OSZ72w60R7FhLnrX4oelRTs+8pvGYBiBvrY+JNJzeXgE2dmN8syffaXKh7dKv8MXSmbYcFG0aLjRR7y910Ugb/bB49JRaZYGiHP15vnfPMrwsZXeSeEtY5hhZ+Gb/pfqiECFPopd+eBq+vZpKuSogNgO34p2jpNVIPEmWr2z6yyckI9gPXfLkiYaEKOe+2IiSFOcIKYUTvwbIoA2CMP7eXWWMGdsVADtvbw6H3vGFmYOzPXuTIKtDrL1Cgudf0ZIPMT0vyv5uERlyjttkTSBCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOt5yhWUZyOGvdUK1BpYksoi5YdvLivI4nWrbB08dww=;
 b=kp4I1MwKzcNHjRTO4FAVP3734NMgqHjPFUzEx3bMGAueQjTezOKMOPnaS6vbho5ivRBcSfiZRaAyKOa9ksB/DARfc4LFQVdfCvheY+0xTRbQ49m/qBvscFEhbPIUaMHo+DPdboZo7bmuoIOtQtwBGMC/euzVWitUkwEiJXwyeoOr8NzSQWasjOjo+8ebt2a2ZlnwJiNptToaU5L5NODF4sh3RsQILBd2PrY/GcrnGOTVDhYzAm40SmvBF+RQ4z7IEOCBILd4ZqMmhOljyyE1rJbuFsAQFywbtTOgyuE4FmNKkDuUvOmZ+Mn8kHhcnEQ8z8e/L0SH4PoYNgCWB7RaTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOt5yhWUZyOGvdUK1BpYksoi5YdvLivI4nWrbB08dww=;
 b=ECTU0iNgFsYi6mTHh/VMLdS79RsxYiQGdDEHygrStN+4K2M1ZrQqeZqlXOgMQ42pqA2/OgUyNgDN+z2iJVCaKmQqkohvwnsTY39Fv2RHYj1iu/6paHU/QVyAKNR//8krceiPeSH32op7WpYXNyjqgTt04Q//H+7ZxH7m0EPNtF0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <aedc61dd-7c9a-f1dd-6430-fc3c56624a39@citrix.com>
Date: Tue, 30 May 2023 11:00:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/4] x86/spec-ctrl: Synthesize RSBA/RRSBA bits with older
 microcode
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230526110656.4018711-1-andrew.cooper3@citrix.com>
 <20230526110656.4018711-4-andrew.cooper3@citrix.com>
 <3f38d4c1-dac7-611a-1882-a5e6de16d4f9@suse.com>
In-Reply-To: <3f38d4c1-dac7-611a-1882-a5e6de16d4f9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA3PR03MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: c1249ccf-6cfd-4ac3-9e5a-08db60f4c563
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x15x4xetULPRpS3XL7oU1sFQotN3QhdAgalkXMiBLZa6vVhqRA5k684uLvHVJzy5GoGvHorj8Qg+g18WBCMiVbtsV8geEVi0/v8SkI6/9Hagsyj8e3BA2stNKag3nzrBYv/2vRNv7IUsSma0TlKiBpIMIIZWSIAlEWBhgoJcMJjFeJiZ8xvVHKAlVmdbbcPjFJMjkMl6IDI5OGA/C1nIKFCILN2pOIiXjQTe2kpEIOMuAyfUiB/EFcqdY6vvOxjiFE5ggsYSrnqJJc8uKTEVTG9fugTiR00SG+H2chjC9Z2QZU1fhVC6vPQEQQv/jVsuoXXo7HI54VGmLb1z2YiOoSQEj7pNrvZldPp9vjuYL/1nRywIKSL/R3a86otfJj9DB37HOvcO/ZEYn3BhdeELZ2DmjuxatU6qTSzEL2tZaN4fiM8OjuzxKid1YprMAfPW5lsn0grCRsIaMUt04jWGR/dUaQXynsWTMtwsoCtZk+NLFwsWsmepuBoPWz8+s8cp1Is8w66OKO0ivWH3+neF5XJmmQt0HB/5Ng/MX9JvsnM402QWYbUkF8vCRs59Xt8uWo4B4Idem4Rm1arFGzrDwArOGgJepLajOSyruQ6RdwJJ+pa9O7jk+UBSSpkHdtwCip+yguRE4jmkq8d2ujeS2w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199021)(86362001)(6486002)(41300700001)(31696002)(6916009)(6666004)(4326008)(66946007)(316002)(66476007)(66556008)(36756003)(5660300002)(186003)(2906002)(478600001)(31686004)(53546011)(26005)(6506007)(6512007)(2616005)(8676002)(54906003)(8936002)(82960400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WS9MQmNYMzFpL2xNSjJFS0k0OW9OdGUrVlRzNW40NlE3TWRVMWtjK0xVOFp3?=
 =?utf-8?B?b29xWndLbTJZVUY5Q0dYRFVtQ3Z6S0xPVkdUOGplbnZZOTJTOGdPeVZISjdS?=
 =?utf-8?B?Mlp1ZHNlS3RXQXRtZ3VCcDJvcFJJZkh4eFFWd004cmw2TkpoTDVrOGNLWFly?=
 =?utf-8?B?WGhDQ0Q0R1Z5OWRzL1pnZEJHdHhZQ1lDemhFbFJyYXBkTHFWUDJicXArUUhP?=
 =?utf-8?B?eGFvRU52elg3TU1MY25nbUJpVkRQcE5lZ2MwcWpENTZmYWdubzM4OTFKb2oy?=
 =?utf-8?B?NWY4YjhGTllMcldmYnJaUmNNSlY5ZjErOGljRmJzUmdFRjFGL2hObWJyaHMx?=
 =?utf-8?B?OCt6QnhGeFRtUG9vcitMbGx1YUpvWmwzYnM4YkpGaExKZmtTZVVyMjlaTkJZ?=
 =?utf-8?B?MjA0KzgzWUpJYVpaWEluRDBTVTVjbjBreFNNSVpENHZCN3FBdi9rQWxRcEdY?=
 =?utf-8?B?eFdrY2E1MkVuTVJQVHFlWmRFUk9JcE1HbEJ0WXM1djBFMmhqeHpqcElPYUJo?=
 =?utf-8?B?bFhvZEpKTTJ5RmJNbVFEWCtXM1FaYS9aVVhSQnN3SzlMdWQxdVgwSm5CeU9F?=
 =?utf-8?B?SGdQblJEbUlBZWNVMFdmYTUyY2Znc0N5K3RRTXE4T0wwN1dGZ1EreUZJc0k2?=
 =?utf-8?B?ek5ZNGJrUXJaaE42RGd4VE5lOVFmWDlicUF6eVQ5NDdhQTEwWFhXR1FHemFh?=
 =?utf-8?B?aExyeWZkVlBxQUFEMi9kc0VQTVZadHhzRjFHWGNQOGdVUFJQT0ZGakZlaDNP?=
 =?utf-8?B?TmlFSk9zUklremYzYWtJMmJ6allRalNxVFpmSGpKQkMyL3hscGFHYTVtS0FJ?=
 =?utf-8?B?NHd5OEliVy9SV0wxUDNSRUV6Z3U1Ym8wV0VaWlFzY25McnIvVEFEdUI0OHox?=
 =?utf-8?B?SnZZUmpLOXZray81c2pwSnZzek9TdmIxd2ZQRTlUNWRlRkdLWWFWVHA2TCtX?=
 =?utf-8?B?NGRwQlY0UXpXNm5POWVudzJkNUFqU0YzWmNCYm0zNHBoa3I1SW1rOHpDSmRS?=
 =?utf-8?B?aXBUakZFYUdYc0libUJieTR6cGVSbHdiY2ZJaWM0SFZGOEZnUjZELytCVHA4?=
 =?utf-8?B?UnlRK2VJMVlwUVpCYzI3VGcwQmk3WWlmQ1V5Z3JRZDg0UG1TUmlNL201K211?=
 =?utf-8?B?cHVqbVFZNkMzVlFnV2w2RkdDT0VncmhpN3c2dlA3ZGxMSFIwWTV0QkZGR3k4?=
 =?utf-8?B?T0ZqM3hTQVhaT1VSSjEzTmJDaHZlMlBSbUc5TFlzWGJGZnRaQ2dOWFMwTnBx?=
 =?utf-8?B?VzQ4djc0VTJSR0xhZVNPdlFrUjl5ejkrclZMS1ZxUXd6M0NtMkJEOE1VNXRw?=
 =?utf-8?B?Z3lXVG1Pd1FGYll2NUJQdGF3UE1GZ2pkejgyK2h3a1lGaFQ2cThVSitvVDRu?=
 =?utf-8?B?eEJCRlhCYXZMK1BKKythSjZRTlRnMVJJVy9uRGJrdUhyNUpLc0FlZU1nV1No?=
 =?utf-8?B?bWJCblNUeURXR1Y1NDc0TitNeDhxdkdlKyt1dzBKWWNXb0NrWEI3L2c2WDFk?=
 =?utf-8?B?VjFPL1BvZi9HODV0SmdwVGYzS1BVY2FsZmpZUkg2eDV3NUxidHhwQTFUOUl0?=
 =?utf-8?B?K0gzbC9MUmhXSzYzNTUxeSthZ1A2TEV2K24xbDk5NEQxSGNvTEIyc2huLzQy?=
 =?utf-8?B?R1ladEcvcU9SWXZLRGxMV3dHOFpGNWJNeU1QMzFpSjV6RWhTOUFZL29BaDMx?=
 =?utf-8?B?SjlOSXNGQVE4RFUveVRVTXJGeGtSNTkzOHc0aUl4a25HRjdZQ1B5cUlETmVU?=
 =?utf-8?B?TVlRZGgxZnB2T3VDVzRmOEh6aU1MUW1BNGtJV09uNFkvSmRDR3NBZEFNK1lu?=
 =?utf-8?B?eVZBeHozeFUyeDZGb3RIN3dMNGVGZmVTeUZleFVraWpDUjZDWmlwTUE5Z29Y?=
 =?utf-8?B?WmJ4NlR0YmhhSDd6U1VoeXNmWWRZRWFIVERoNGYrY3dFbENXbXJkSEdoeldz?=
 =?utf-8?B?UDVRY1d2S1F0ZFNZWEFZa0hRaTZnWEsxclRqRWJYNjRScXNmUGZpTTBMY054?=
 =?utf-8?B?Y29Lam04bVZXVWF3eXdqc3JBYXF1bXFBZGVVTkZzeDJmUEZIK1N0Uldyb0RU?=
 =?utf-8?B?ZjJIcDB5OTlveGxoeGVNcUdVeVA2TTJ4eUxZQnRHNG1GeFBWYVVuYjRxUUZk?=
 =?utf-8?B?bHlVY3pnTVpNK0ZlL1Z4SzdzQk82aW5GNHN0VkVCYU1UMk9UbTFGaWVRdUMr?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	p6vL1Sex/B7Z06c8cxfUMx3ixq3Izw82aWSj2t+0bWo7/NR96x6rm2PTaxLvryQdp3cVk7P3r6CzlNDquMcZS5HhboiUW3/i/CzbOphR1FPuGBpNuM2vAmhsXd5VMrZdJ5LQMMIF6fQN67OB77pGTVPVDhzaiAUXJV8gIBA4hfYtAenJA7PLcOp1ZxsZoyhVJPG0Gcbg1G0XNGqLJ+iIr/On4VITI32tKrKnLF0mnSZ43Bk+UGdDKBTgRhylGzoRLoCfIT78ro2mReZ91RGJo7ycwk77bNdAIMHZz0Pq+0BsbrjkNrcRt5VGMJshVhZNa8j58vTiZ84yNLBpA8xiDJGa3g557Gp09cnip5rIFlqmqekCLKfD0Cqw0gmxwptKgVOByJoEesVbPuETNH8P2WY/s5cfBh36cy5EeEGzxXcjpL3qk7VNgttNWpZCzgqBleLMaXm/Ihm7uEMEBKRqbhtRZUbfUlXDRXjTVoKGTna2xU18NtFBRK1fN2jliNGI7eUMty2F5HGEpAQgQ4pEpdMTebJUKeb1ZYMrbPh/rLJsbqJxGD4ATuZdXwdt51jwW+h2YpfT1aQsiV7nAGB/VNi6KEu9R8DTq2SZBKQNC8h+DCnwS06PUqVeDo02vJRZwTpzG337rYiDn2rymOEC6d1r+91356JrewszgABFwursQ1HBZQt1fGID4eYFDNQrTkKRcO+b2aoxGklJ4H3hEdPP1xJucSmKX72Enz1Lciw3lO2gsOm7GUaJafR2FdLqrPyV5m4FoAB3+ZcBAi4SPFn2ebPzXyeoTDupkGP0xXT42dwxFGDauifRTWWt6wGQ8sfxQL1fcmCDZ4WTYdHT2Q==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1249ccf-6cfd-4ac3-9e5a-08db60f4c563
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 10:01:00.6987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1pVNuyTqz75ZJZnFa3uon9rPmC20CBz6IW7f8wKYTOpKEbn2288TAXkaVdgaPcHRHP9wTPxYwebgDXtJa5xiTfzjthO0vO8kplpaTq+Dc/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7369

On 30/05/2023 10:18 am, Jan Beulich wrote:
> On 26.05.2023 13:06, Andrew Cooper wrote:
>> @@ -687,6 +697,32 @@ static bool __init retpoline_calculations(void)
>>      if ( safe )
>>          return true;
>>  
>> +    /*
>> +     * The meaning of the RSBA and RRSBA bits have evolved over time.  The
>> +     * agreed upon meaning at the time of writing (May 2023) is thus:
>> +     *
>> +     * - RSBA (RSB Alterantive) means that an RSB may fall back to an
>> +     *   alternative predictor on underflow.  Skylake uarch and later all have
>> +     *   this property.  Broadwell too, when running microcode versions prior
>> +     *   to Jan 2018.
>> +     *
>> +     * - All eIBRS-capable processors suffer RSBA, but eIBRS also introduces
>> +     *   tagging of predictions with the mode in which they were learned.  So
>> +     *   when eIBRS is active, RSBA becomes RRSBA (Restricted RSBA).
>> +     *
>> +     * Some parts (Broadwell) are not expected to ever enumerate this
>> +     * behaviour directly.  Other parts have differing enumeration with
>> +     * microcode version.  Fix up Xen's idea, so we can advertise them safely
>> +     * to guests, and so toolstacks can level a VM safelty for migration.
>> +     */
> If the difference between the two is whether eIBRS is active (as you did
> word it yet more explicitly in e.g. [1]), then ...
>
>> + unsafe_maybe_fixup_rrsba:
>> +    if ( !cpu_has_rrsba )
>> +        setup_force_cpu_cap(X86_FEATURE_RRSBA);
>> +
>> + unsafe_maybe_fixup_rsba:
>> +    if ( !cpu_has_rsba )
>> +        setup_force_cpu_cap(X86_FEATURE_RSBA);
>> +
>>      return false;
>>  }
> ... can both actually be active at the same time? IOW is there a "return
> false" missing ahead of the 2nd label?

I've already got a question out to Intel to this effect.  (I didn't say
the enumeration made much sense...)

> Not having looked at further patches yet it also strikes me as odd that
> each of the two labels is used exactly once only. Leaving the shared
> comment aside, imo this would then better avoid "goto".

They're both used twice, not once.  You asked why it wasn't "return
safe;" in the previous patch?  Well this is why.

> Finally, what use are the two if()s? There's nothing wrong with forcing
> a feature which is already available.

It breaks is_forced_cpu_cap().

Also, I considered having a printk() here.  I've still got it around in
a debug patch, but I decided against it.

~Andrew

