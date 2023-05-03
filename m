Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 445096F5D1A
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 19:38:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529411.823816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puGPW-0006sO-4R; Wed, 03 May 2023 17:37:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529411.823816; Wed, 03 May 2023 17:37:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puGPW-0006pC-1C; Wed, 03 May 2023 17:37:02 +0000
Received: by outflank-mailman (input) for mailman id 529411;
 Wed, 03 May 2023 17:37:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZlPw=AY=citrix.com=prvs=4803f4e7c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1puGPU-0006p6-75
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 17:37:00 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19cc0720-e9d9-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 19:36:58 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 May 2023 13:36:51 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6616.namprd03.prod.outlook.com (2603:10b6:a03:389::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Wed, 3 May
 2023 17:36:45 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 17:36:45 +0000
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
X-Inumbo-ID: 19cc0720-e9d9-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683135418;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XQoRvwDsNAbb2Ldv2vsHR2jw0A+eesLTBRQ0JAHIYZI=;
  b=XrQxQ5peAW8sK57BWfAuI00QHm46BVDOPZzx25JrknnG0IpzuRcLuxMF
   ZydkGkDUsKTR5l0LUDl/j0tIBoz1Mek4bY9FjdrHUkVMZVPq/i4V+UNxs
   7I96rzCAob4GkPPYvcn8Bzd7HxhWY/N2N9VihKRcE8WlfBTbW/ilK4AKP
   Y=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 110194738
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:OoV7gKCtUkBhOBVW/83iw5YqxClBgxIJ4kV8jS/XYbTApG8k1TAEm
 2MfWTiOP/+DYzT9fNklOo2yphsEscSEnNNmQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G5A5QRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw/d0uLG5ey
 OUkNxMGSiu4neGMwbCdRbw57igjBJGD0II3nFhFlGicJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9exuvTi7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraWxXqqBN1JRNVU8NZJq1/U6DUtMyQsD2aenMHgq227edRAf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpatYrqcs3TjwCz
 UKSkpXiAjkHmKKRYWKQ8PGTtzzaESoaN2gZfgcfUBAIpdLkpekbjA/LT9tlOL64iJvyAz6Y6
 yuRsCE0irEXjMgK/6a251bKh3SrvJehc+IuzgDeX2bg5AUpYoegPtWs8QKCs6YGK5uFRF6cu
 nRCg9KZ8O0FEZCKkmqKXfkJG7aqof2CNVUwnGJSInXozBz1k1bLQGyayGgWyJtBWircRQLUX
 Q==
IronPort-HdrOrdr: A9a23:kUDlKKunYYPikJ0wxn/YQRyo7skDVNV00zEX/kB9WHVpm62j5q
 WTdZEgv3LJYVkqNE3I9eruBED4ewK6yXcX2/hyAV7BZmnbUQKTRelfBO3ZrQEIcBeOldK1u5
 0AT0FIMqyVMbErt63HCdGDYqwdKQO8gdiVbDrlvhFQpN1RGtpdBtlCe3um+iIffng+OaYE
X-Talos-CUID: 9a23:DN45g28AhDanwNXW77iVv0kvQ+0qYkDE8GjzKGuDMnxqcryXb1DFrQ==
X-Talos-MUID: 9a23:V9VPzQuV9aiXg2sgP82npxpgc+kx3Z+XMhowtKg+4uinMA52JGLI
X-IronPort-AV: E=Sophos;i="5.99,247,1677560400"; 
   d="scan'208";a="110194738"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YO2+CGSKubaWEYAcnbck40Jmvju5UacLj4D9ZcoL3hkyqj3p92FfnekWxBObctA/dZ3XFNpqr/UFtZaxcbLtPvci5SVL/XGnpB4x1r9KfuskQ+KW8V5Iu1J0GBusP7mIr7xxZjP19nJjRu4xPREHg14SEUdzs0owhhacov1b6zv7te/OrNdjOKViCGdyTS6dh7Yvfby7w4O1LFilXccQok+OrytXKIn/cdiqgK4TBMQSffcnuUSNmt0nvyKx6s8876vlGOXAiC4njCKIZM3I2stcEYR4tN1ToqkHnPl5njPFcctTMhhVxpbTHxGQkMg4+xdXy837vRvzERXMgofJDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gth2XfANnyxBojNYe2210OffKWETGMpY5ZLlikIbgls=;
 b=aW5XaTADBXtq4LrjLZXTxPtdqPBA+7gudne83WluH++jME57nxcP9k+UbdkKqf6/AeuBJSaiLBwLzPk5y1JzJ+iXc+zAKOJIA0Ria8lubNuehhkmzvCp/ZzRGsxGNviSbI/TfQtPHrkaYkS4yn2CPE7ep5m4avH9NV8CreXqUswUcj8dCc9vvSmX7Xs0dHC+8KNui7CnprS8h7o4wpxCvVlaZJjC5CIFNxAKPUznwczIS7UsNjtMnlbD18R20JTuBcIhTGLf2WWEhrKi855lQjek9k+BAY5s/t6PHUVE8UEnfSF9dBPqgzM3VrrLrrtPDMuTAW+AR3Q37d1w/BvSmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gth2XfANnyxBojNYe2210OffKWETGMpY5ZLlikIbgls=;
 b=mMP4wjN5qWh8cOVs3fYwsQDQrbwTvKDoNgL92rMt6V2e3hmEGyE06Z97Q55peyhfulk/CNN/XPKREJFsLRa1yN1CeYG2PKflZyuf4R6jEZz367btveXEbNDIp1VDdX9j67i2bwiINx+1ZEoVuGP0NdTOHferiTyDUIJf5u4YZ1A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e21cb410-c227-0cdd-edf6-ffed6d2dc831@citrix.com>
Date: Wed, 3 May 2023 18:36:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5 3/3] tools/xen-ucode: print information about currently
 loaded ucode
Content-Language: en-GB
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230417135335.17176-1-sergey.dyasli@citrix.com>
 <20230417135335.17176-4-sergey.dyasli@citrix.com>
In-Reply-To: <20230417135335.17176-4-sergey.dyasli@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0103.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6616:EE_
X-MS-Office365-Filtering-Correlation-Id: 8987df46-5fd2-4ae5-c92c-08db4bfcf6e1
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/mvLE98wnHuCNj6thre3J8vYFwhoO+4dTfq8JxEO/EzZyQ2ecCKfZsOVe7Ef+2H+yWJcMhAGd62SPhpnhXw4IP4/iteuM/zOwtMayKGVJ3NOTkTZDzz0VqTP6vKFqOXh4dB+yuJZ8Rvpbs3c4BhfmvPPq6335wXUgTVEMoTj2STejqO72pylQQeM304V8KNFElaOfwbx5q45HHuoWusK+UIYZ86xtnN67dvLrfZ4EhvvXH1UwdaVJ5glW6jIA5R8kqM/8/vClYDXozs7lgib/FisQSGpaLBvRdKO5A8kPRiGo0RnvJOOxMDG7D4vKagl7xHYxDPCxSXtS+Pl9wv2gxGLE/H88uE74OMWL0d6qWIHSqkPz7kCSEvhIzXwSgOk4tVaY/J7ADAOP0k/qQS/mkwdk/DTTeqmJCIGE/hnbnekbe7ktJQy5T6cPOB2FDRHL4wpny3BBAh/o6YWPXn3SXduv+nmgmMVAsxuIu/C3XezZkywv6mnkA0kCjqB/z5GDWeEeTfp6zip4Peg7o7fCa5i/Qe2zouEk4AwQ8uOfJbxYSPB9Pt/h91HzKzresA1wcp8WsRH7YxidzsQEc58oUDGzrGFFle0lN04Lo1eQozcbl/oweSEDlUfvWh0zUPOX52PiEPOYqZfxl9ZlJydJA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(451199021)(38100700002)(6486002)(6666004)(6506007)(53546011)(26005)(6512007)(36756003)(2616005)(186003)(82960400001)(86362001)(41300700001)(316002)(4326008)(6916009)(4744005)(2906002)(31696002)(66556008)(66476007)(66946007)(8676002)(8936002)(31686004)(478600001)(5660300002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dU95eWpZWUtTOFF0bEU3aTBJbUZSSUNJWTBYUVZuVEFiY01oRW96Q3FvTFBW?=
 =?utf-8?B?NGo2ZmxITVZnVGxBd2tEZkhpUlJYMmRuQnZZdDdvM3RFU2pQb1ljYmpab25S?=
 =?utf-8?B?S0pGNEdHMm81Q2lOdFVyVXluYy9uNXZNNmt5ODE5eUoxS1NCeG9keVIwMEVN?=
 =?utf-8?B?MlhiRFZUOU9tUHZCUXVXT0M3TzJsTlRUUFAxY1lxVmJDbnQ5SzVJVzFlR3ps?=
 =?utf-8?B?TmFTSkRLa2tSd3B4UDZnVkY5aE1YWUhWVmViL2lmUUVmY1VKWjN0cjZ5bXJY?=
 =?utf-8?B?Vzg1YkpVZWE2am5yRUVaYmkwRjRkR0M4Sjg4TExPbE5EOW9rcUYwUTNyOWRq?=
 =?utf-8?B?SEpUNDVraVltWGRJNnhkQU1YVlhVcTkzUFBkeDVjNVRuUllTQ0lPSCtkanlZ?=
 =?utf-8?B?Mm1paURkU0Y1bWVsRGY0Q0FjZDBvQyt6T0xiMlA5eGUrQWpTN3ZQTngwcC80?=
 =?utf-8?B?MlJsazArVmpVcTkwS1hZbUs5TGszNS9hcXl1b3BYMTJhT211ZmQvNWtyQ2hP?=
 =?utf-8?B?THltUHZvZ2NrVWhVMEhTcXdsQlpKQ1pHcUtQb2xLcFVlcnREOXlPZHY4K2x6?=
 =?utf-8?B?Vk1uSlMrcytCR1JMeHZqM29QRkd5L3lOQXpyci9VUWplRjd5WXpmT3ZrTHAv?=
 =?utf-8?B?RUtUZGZNZ2NMVktoMkVyc3BDOFlkb3JtNDU3UEswakZXdHNrbm1YSkx4TlVE?=
 =?utf-8?B?dVQ5eXBLY1M2MnFmazJzeHFWVVJaWTRaZG5pWi92QUxsNVVZaVFWc2ZYMWRa?=
 =?utf-8?B?TjRWaW13RVJMejlnWWJCZm1vSkVsWm8zSnNTbVJINXVQK1d5RXo1cm1YVEw2?=
 =?utf-8?B?UXNoUTIxelVnbEloYWFZVEdKUWJYbVI3SnoyaG0vZGlsZWlpL3RFKzBGa2pp?=
 =?utf-8?B?OXE0VlR2OGxwNzM4MEd0SzFVRXZIT3R5anBSc2R3WjhrYUJTY0R6WTVvWUk1?=
 =?utf-8?B?dE82bEg3ZUVYTFJhL3V4ZkZiVzg1S1ZCRlUyY3NZZWtkeVo0UXAxcWcxYWo0?=
 =?utf-8?B?RDFhOXVpaDRnUHA5cGYyY0QvT0JoYXYzcml0dmEySmx2ZnA0Nmc4M1FMdWtH?=
 =?utf-8?B?aTBqNDRMWDJVbFdwS3NFZjRHd21wRlBMdnJWcU1GdndFTWpIMjNacUJQWEQz?=
 =?utf-8?B?cTZ4SnRYRGUwM091dHgzKzZieE9KbWNxMC9QLzVlUitVeEg2NW9vNGRGUDdB?=
 =?utf-8?B?bHYrOSs1UGRFcTJYZHc3SGx6cEZoU0Zxa2tpQmxybGhBNjRLakNaa1p0bG8w?=
 =?utf-8?B?bzlGa04yRUZueUFYcU9DUkdwUnJqSXZIU2RiUkdIbll2dmJlRFBnN2FDbkdj?=
 =?utf-8?B?VS9zaFd2c0swSjBFbUZBQ2ZSeUJJM29NV2ZsZHFpbE4xRXlaMjYxejdTRHA3?=
 =?utf-8?B?WE1ZVzFXbTJYMXpZTGsyS3dtblRQSi9xV3huNVN4a0kyLy9FRStxSW9TKzU4?=
 =?utf-8?B?RVRMUWtkdmtoMHRQa1dqYTYyb1B3bHlUTzh3UCtka2pyUFFyNVRBRFYxdlhn?=
 =?utf-8?B?MmNndVdQTjVJQUtIVFRpUy9CbDhVUlk5TDNFUFJid2N1WWdidEVoZHppNE1n?=
 =?utf-8?B?R05SOXI5bEVmdGc0TVdQbzQ4amNUc3JuSDM0QVU5YTMvNTNKclpXSVRLVVUx?=
 =?utf-8?B?UzU5ZythT3UxeENVcE04MjdIMXBZaFVMbXhqTHAzbThwRnNNZjIyL3RIZzlt?=
 =?utf-8?B?NTROWkVlaCtzSE56c0gyQndMZGpFczk1Wjh5ckVTS0ZFaVo5cFZVbnI3SDJw?=
 =?utf-8?B?ZTJUbFJlNmZ3V3NOeTB2QmlrRDNHWWhhK0xjcGdyRFFiMjh4MkMxMmF2eWVm?=
 =?utf-8?B?bVkxelJEUWNib0FrejZ4SldwVjNXbzVJTHA4dUg2bVFINkdiMldKSXRGeUx1?=
 =?utf-8?B?TEhVdXE4Qm83dVIyN2ZncWgyZVBzY3ZlTnhVbHRBUG9aM0tsY2c2MDhpNTRY?=
 =?utf-8?B?V2lWa0o4M01zUGlyeWxZTGtpZWQ1YU04eE1rQjNzdEt5OW9GRDVQbUp1UTMw?=
 =?utf-8?B?L3pxbTRNeURFdUJIVnVaNlBGYnlUZlArMlRxVlVsVFhwL0FHbjNLeXlmbjUr?=
 =?utf-8?B?WHBmbHVUNGU3bjRteVlWeW1MQWNrTTk1em8zVkRTemZZT2RPQ1hVcmZGb0Y5?=
 =?utf-8?B?bVhSdjZUWnNRMTN2U0Nqd2pjdmxlQUIzVFBHMDlueXhhVHo5WDI0LzQzOXMz?=
 =?utf-8?B?dlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XBu/sw2V3JaD5oAP+cIDlB1s/UP6SeBGenGQxDOtRhFcIurx2e3KyBCZ1QpgBSz6GzLWi9TusnmVU9/rmZlPZbiaJAMSDrvdYo2pM6CWYOQo8kaTdvAZpgKfoZ5acv7TMxs92s0s+UQuipIHhd5qo3ma9dG7eh3pphFk7HkOZJx9617+V7SOJmGLdvtGObO+r7m6vqng6emLzjeFdghEi/O7n1d0sD/sFyQJgYw/VIOGVfsa5C3s27RseBoM0CQQq5LA6gYC6bMsWeIoXQ0Ia3dO8AlwKaG9eg52LVYkx+VkkPUFPaC8TKjIS0vcU/VaVaQWKostKhHdm3l1VLRNkC1M4awUPZDNJ7GHR2iab241Upd7YV2RVrPqxWPW9PjIUMiRveBGTlSRsG8yjBF6iGrzwhJgFAX1/4BJJDv2rDNdTnInOMkQNVD+JS5bpc1UVRqTqb8lNz3eyNmaHx1RPvXHq/DWhToz4/MeWOEw+qLsbDOQCgEmCwCHlwSB/Moqwo9OEDIkUqM5a96iWzkoiTXTKwlCZ97aGWHhA6dBYlJQeBwvI5wtoWcIq6qvthqSupFRgXL5AYqQy5xRs+OEf70NWEre9ezvgoEZilCAuQLB8s9B2imZ69cMD+4ZdzFFQyOWzXTJGuly9TB/HYS+syLqbu9P2Id4USrGcF/EoRocc6J8KsMWZhiuGqFG3PnJ3l4VxEQc7ALE4zJfpihCnpaED2meilOrBakc0R3+Nxec+PTwOSBAfkcsiwuAcfggo0A4VoN4ixHJ7bW3lVfewTGlfnDIML0LqW5kydJPJ/hH2kXvjcqo+y7MVCjeelW4qcHQZGWb6Zh9TMFQiBXQZ6vdN4MTqNfAFfqAgzssD58=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8987df46-5fd2-4ae5-c92c-08db4bfcf6e1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 17:36:45.3250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wkg5dfYukcSrV4rL4LfSDE2+CUE3+NDQZxbtMpdxUdw21EBC3MabB2HfJqsfj47web0djbWDueemVLzZPQtBQAg6i036xMNWkFfUdbKQbk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6616

On 17/04/2023 2:53 pm, Sergey Dyasli wrote:
> Add an option to xen-ucode tool to print the currently loaded ucode
> revision and also print it during usage info.  Print CPU signature and
> platform flags as well.  The raw data comes from XENPF_get_cpu_version
> and XENPF_get_ucode_revision platform ops.
>
> Example output:
>     Intel: CPU signature 06-55-04 (raw 0x00050654) pf 0x1 revision 0x02006e05
>       AMD: CPU signature 19-01-01 (raw 0x00a00f11) revision 0x0a0011ce
>
> Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

This is good enough for now.  Incremental improvements can follow up.

