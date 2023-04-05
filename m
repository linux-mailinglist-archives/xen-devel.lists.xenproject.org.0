Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C696D898F
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 23:30:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518648.805407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkAhq-00029v-I5; Wed, 05 Apr 2023 21:30:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518648.805407; Wed, 05 Apr 2023 21:30:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkAhq-00027Q-Er; Wed, 05 Apr 2023 21:30:14 +0000
Received: by outflank-mailman (input) for mailman id 518648;
 Wed, 05 Apr 2023 21:30:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gV66=74=citrix.com=prvs=45279ec78=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pkAhp-00026F-4u
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 21:30:13 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a8137d6-d3f9-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 23:30:10 +0200 (CEST)
Received: from mail-sn1nam02lp2048.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Apr 2023 17:30:01 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5571.namprd03.prod.outlook.com (2603:10b6:208:298::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.23; Wed, 5 Apr
 2023 21:29:59 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 21:29:59 +0000
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
X-Inumbo-ID: 0a8137d6-d3f9-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680730210;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sTRVs8W4txYmej4nd3N6tY1exzKR9taNf+gzQBtLPVo=;
  b=O0LHEE+sRWz7hd/L0z4W4FbVJXqTNuNdf+q++mQsIwMzqXY69c4ZOW1E
   8BQxMvZ8Xtq4SJdVNDGEDWkTFwp4zJUf/rIg5oASQmDghdwM7vB8khN5m
   6U9g5A0IAnHD05w3frKEZBe4ma34MeXRO87QGoEsFB+IpBJEtxdBe+7qT
   U=;
X-IronPort-RemoteIP: 104.47.57.48
X-IronPort-MID: 103269853
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jbOo+KA9mGO32RVW/wviw5YqxClBgxIJ4kV8jS/XYbTApDwj1zNVm
 2VOXGuGOa3fNGSgftxxPIS/p09QuZDQy9FqQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4G9A4wRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw2918I0hPz
 dckCjE9U0+jlqWY3qyaVbw57igjBJGD0II3nFhFlWucNtB/BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+uxrswA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE37eUx32qCN9JfFG+3vpj3VOtxVVUMzk1el258d6rqk35BPsKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHr7m9WX+bsLCOoluP1TM9KGYDYWofS1ID6ty7+oUr1EqTHpBkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPuRENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:vta1F6FCXnJz1zInpLqE+ceALOsnbusQ8zAXPiFKOH5om6mj/f
 xG88536faZslossQgb6LW90cq7MBDhHPxOgLX5VI3KNGLbUQ2TQ72KhrGD/9SPIUPDytI=
X-IronPort-AV: E=Sophos;i="5.98,322,1673931600"; 
   d="scan'208";a="103269853"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYGOxAOOWHIdvloJefrYBtaAhHuXf8l7JYgFSyTm/yiCsBdl3uEnls+Ev3v7y8MpK+7TTmph4uJOIz4cLg4d2I4Uts0YHGLNLIofw8mHdC6bx3qZ1nhsOhfZrVKgHCS5LwTVlVlohvwizQzCvpXXqSC2DhrU5F4G04TJxcx9ZCldCaUHsqAtrMsE1S0rpc3u2sdEo6u1bZjqh+PH5kwwJ5KxdEdgdLYSSs4491GSqNGSkqU5+0EfzJq99yvBHUiRGmVam9tc8rZlWK35KCOdVsIS2pBUr34J4kP+oDUzOHLGcFWwuyibZ7HlZd/L5Im0t1jwjB8UYyJKmGgnus2aKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SmF1t85NoXdJcE5Z7Mh+1yNn5WUeBPvZXB5ZnLGE/I=;
 b=a7Po7biwbrjOZ+rIvS/bK+ti4/m2DNSmxvdXeHm3bySw9w2hzU7hYB+pXWeVTUVAi3fHVvAtwNfKqcH2COkEohOeGg3MTFpAGiSJYEGrr0aWJT4fDpOTnqDi0kNMognAKrJ5R1xjzpPLa9N5qNsV3/0hv/sOvNIdwr79FZLjL7q/KlBj4grb266GwAhfm2CicJ5lg+SuHK/2U5604OuvfIrIcBdRQGmTlsouCnPy+IZ93LIEGTIBYrVi96aK/uvCdejOabu02wM6UIoOXPrRozongVFvw3w615jt0hs4cPuAZwMBK98ZR6QTMz1v0kbal+Zfy+WnZpncr1dmUVnGvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SmF1t85NoXdJcE5Z7Mh+1yNn5WUeBPvZXB5ZnLGE/I=;
 b=GhaxCfszrF6aWD0EUhmV5YRzVX9uBnF8a9S0YNQAql1A4krC9qUrB+yCRVym6okEyx0sb6F3RwyiIs4mLmhRxuEmyT1c8W5+/aFReXEoPAQFBt8QSXw4PyJlV/IF7PF9L9Tve1gJpfGdcpLbbXwzU0VBskndp6MK5FiRjeZRksM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0c249d10-02c7-9d76-bc3d-2b3e2ece38a9@citrix.com>
Date: Wed, 5 Apr 2023 22:29:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/9] x86emul: support WRMSRNS
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
 <0c2ddae9-3222-9755-b6e1-35e51410093b@suse.com>
In-Reply-To: <0c2ddae9-3222-9755-b6e1-35e51410093b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0302.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::26) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BLAPR03MB5571:EE_
X-MS-Office365-Filtering-Correlation-Id: bf6767de-4960-47d8-3306-08db361ce854
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K8E90IrW6uGg7cejCBDcHE1JBzh4K9Gvd+blQAlHvoW/W8WhFGo+ZEADMywBwq0Sv3JG6s1GL7E+TrjiShOy1E+5ZdXZTGWrcuvcmapfzPjBDl17SETg5vm0TLbbYM/L+ndrMsrTwR9vVzsX9gWAJPDgKJmKqfvbHiOqudasXOYxSJqWFsfZf9E4Uh8rOsAqogkLai6X8jmNaV4Ym9kEsN5D1s2/dGd7GKF0gWPFXO7q3iNZKxWQz2ubGWpTEeoGkWAJmyvgLxqDqtiTNwCcFMfs0+L46V+/ug6a2X8ixHSl2hGNmvz4xBRm2wG2Q6ZvBgFsbmbVt4tRORD50zErazI/nEhwzOPiH5Xsmntdfu0JectPP837sH1I5xb9fw8p4Zq5BQadhHplg7/Cnxwu5XUqXXv5yZhDrBrFSBH/bKZ6ofsBCjXk/7Im4QI2da1qsBpcJfLdhnF4LQchvtrp/Ijwt/zc3pf5AFVrpZ2uVSUEhPusqZKCvJVlXsXh9/S8F5DIkHt076+uSEsaFyjXhzUBqwpxMifikISQF+qHjmhRlIaZcZ4zjWuHLkBgKBDhXELwf1G7YXq/xa9rnZRdYiDxIveGnxOyExPIcSYzLEsoPvn+aRejvmLHvvGdt+wwDpXTEtflwg0R5HZxbNHOqw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(451199021)(8936002)(31686004)(107886003)(53546011)(6666004)(6506007)(186003)(31696002)(6512007)(86362001)(5660300002)(82960400001)(54906003)(66946007)(83380400001)(26005)(36756003)(41300700001)(110136005)(478600001)(2616005)(6486002)(66476007)(316002)(38100700002)(66556008)(2906002)(4326008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGFiWm9abzJXYTFtVGUwYmErcnhzZElsY3RFeVJDdXAyblp5OGdCblVRTjVX?=
 =?utf-8?B?M0VoMFpWOHE5Y09TK1MwaUJORlFzRi85d3RFK1NSUW51ZzlzNmlSY1dBUk5I?=
 =?utf-8?B?NFl3WjAxVWoyb2V1U3lBUkVwY05abHM5c0wwWk8waXEvM3U4dzRvODJhSFJk?=
 =?utf-8?B?U21yNk9HdHFidEFJUUZOTmwybTFjWEZOZXZiVG41U0dWUkJRUmg3YWV2bEdO?=
 =?utf-8?B?NjI3QjBRd0ZhcVR0Y2FiZldRWFJlbWlNRllBMHd4ZFFZaVdUNFhTZnUwRVdW?=
 =?utf-8?B?bDByT1k2SDJEQ2VGT0VESG03UzBybGM5RlA3QnZ2MHA2UDkzYXViYWxCTi81?=
 =?utf-8?B?VkZOZThrWXRSTW44bEQ5Tm5QNG5Cb0NKU1FkMUlJNE9zSUlaM1NaUFo0MVBp?=
 =?utf-8?B?WlFudEl4RmdGRDBzYVEyZVkzdGRIY1F2YU8rVnAzM0MzTjhWUXJGeVhXd25J?=
 =?utf-8?B?S2ZOK1ZZZVlxMUVOYWJIUys0VVZRYzdLaFloRHFZRXpyNUwvb25YUnlIOGIw?=
 =?utf-8?B?aUJBQ0Qxb0NZdTRHbXpubk9OVkVIZjFINFFmTEdpQi9OdFQvUktSQ0szUjBJ?=
 =?utf-8?B?QWJqeFU0dGJkZkFJSFFFdUlDc3hhWk8rSkt4ZVBoeHl1Q2g2SnBwNUJtYlFW?=
 =?utf-8?B?WkFDMlNyaGNwaWZka2YrR3YzVVpWdUttMFVhSXFGK1VqK3JmRzZ1YkRJaDIz?=
 =?utf-8?B?QTYySVQvUXJ0QXRHY1VSVTFabEVSd3p3ZU1BTDBzSGoxTDcvWC9mWUllc3BT?=
 =?utf-8?B?WFVyWE9kc3E0aVZPNE5KZ3FXbStwaDJxaS9xSEZBNWJrWUxTM0ZRSW9OVzBM?=
 =?utf-8?B?VDJlSGJHZnRpa0FlSXdoSmJVTTM5VEVWeEdvRDV2VGJ3QjBKY1JhZWtIMTJW?=
 =?utf-8?B?QW9YNzdpbFpkRzBza2tBL2FUdWloT2ZMeWxaLzBkdzQwcVBGSy9VTXRTZVAx?=
 =?utf-8?B?V3E5YXpkOWh1aWsxdlN6NWJZL0h3S2doQ3JpcG5lR0RUZHJoN3h2c2ZxcGZu?=
 =?utf-8?B?SStadHpQbUdZZGEzOWVDWjFRT0owV2MwSWFUa2J2Vk9OMjNBM0RUUHdRWGpE?=
 =?utf-8?B?TUFwUGZqMXo4dzIvdm8rM1Z4N2hzZU9JbEoyZzVOWEpQVHNoKzZ6S1lXV1dY?=
 =?utf-8?B?aDFKMnRpNmdySDc2RUEwRjNQemY0UUNONkNoY1RHT2JFSkZQT1BwUmZiNkdx?=
 =?utf-8?B?em16ZS9DVjFmZUtkdHdGYy9tUGtkM3hLUU5WNGF6NmFGMWFUTitmYkoyeUEx?=
 =?utf-8?B?dEM3WnJpeGlxTi9HZVpqSUpmS044eHFSMTVaWUhNRE9LSmpBdk81SEhyMk95?=
 =?utf-8?B?L2kzY1QvN3JReGFhMTErV0NjTUR2RGlTY0Joc0YzdmpqUXNZNFhxSzFLUVFk?=
 =?utf-8?B?MTJpcXUrdUNiekhGREU1TFVETXlqL2hMMTRxQ3JINnFVekZBaFpmYzR2aXVF?=
 =?utf-8?B?OWhzaklHTVBZUjFSVnZxTnFWREJIRzNxaklKRittcjYyemhRTWh1RHhpY1FZ?=
 =?utf-8?B?a0dyczhMV0FhUG5uOVdWTjdMZ1VRUTBrMFJHVGRsUmFqSnBzRWlPaFVCQ3NF?=
 =?utf-8?B?amJwTWp4OWdTeXplc1lTR2IxQk9uMjVINW5SVHh6SUt6SEYyY0VZNFNpMDZT?=
 =?utf-8?B?UmZWU1pUSTNZQmYxZWlGY0tNcmdJZG01S2x0RVg0aXg4NEhDS3F0NWt0WHFD?=
 =?utf-8?B?R0FPTUpmbzRoaTRXeG12dGdrQ1RpZXBLRFIzV05vTTc0a2llR05DTVd6THhC?=
 =?utf-8?B?TllOMTh4M21WSWpMaTVMU0l6Um4yOS83NDRKZlJWNTN5cTZ5d1NSM2piMis5?=
 =?utf-8?B?dHRzdjdoL3VaeUR1V1pyRXBYSnlBbnVpKzEyRmp3QmtRbWViNFVENmU5YkNR?=
 =?utf-8?B?emJXaGZuUUdKVU9XSGJoMnRWOU5SOUk0SE9wcms1NjFJS1BST3FOQzJhaFZj?=
 =?utf-8?B?NW5Vc3VsZVA3blZUemY5di9DcHZZLzFqSFhWVkdkVFMxT245YjdkdjJEM0pG?=
 =?utf-8?B?TjROZFZmK1kvUzFuM1lFMm5QQlE1YzMxVlNzRXVyZEh0dUIwd2NhRENDOTZs?=
 =?utf-8?B?WS9udWZjNExtNmlLNDJlN1RETWk2c01YZjkzRHB3aEVvS1Avazc2ZDhZZXdM?=
 =?utf-8?B?TFJ6ZnlDNitHMXpCY1ZHeDhyaURzdG4raHpVWVFsMHNjcGVodW9HalRJWmUr?=
 =?utf-8?B?SVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mUcftL8RAyeoPAqm6CwXfS07o0Y2S8wcLh160EGO/6xrMQkLBS2XA5odtpY8WGkERgx4YPMf4wFtBCeGtCz9en3o5cAQPjhXOhh27gFILbh3to3fE+tm/OA909Cq2dmv2I9rOeEmVPReV4s67QIGJLUSlweWXY+o9sHG+4tiwWTxs1nKnGHQCIs2bzyMJSrZMSPXyXTEUMxIFjNvX67iyLrzHeJIORJqHDPDnG3m6JbpBPF4XWi71UG+t3g+lhk8eRb6m5H9haElJcWMeSVxuhhIE1pBeNflJx/Rj3EheMNfhUONvsQjKIpr5RdTCw9m7QyU6Kvyy4z3TsSFmVGTXF1kP74d2f43LXlux4g6Jdfv9XcMRmnYzITkQglBzKnwdGtJAQwFbXQIYbOYeU1T+al5kFRTO1fzvNXKWEudtqxzDG8a2MH/k/Frt017N/7EIYnkk483B8COUMtOqcxTkLCngFnTRRmAxYdDWkLhxxd92AGLg+su1Y+cZK7OsAbo1y9qpEBZ6UbN6b1iosOnYwYzynQjevO++JLFN0cEgIaDlEmNNZ8lpUhn8EGQqWRsgUu408V/s2VZOKIHGlGdA5t2RqRM6Dy3rJbdMXCSmELf2R/PCapwjnglzaIp7HCbnfT2BgoLeSFTdEwJF4ZaURpYIjYfEEvAdxwjm2TEt4LsJFeuvARp8VI2p1Jgp06pQb5Jprtpmn+Iq20gaf3RYj5cg0MGbx32ajaoTrmnpCX4r+hOO7qorXj0MRyHKJjgLAQ7r/usTsW7jup/Q1FlFw/0ux2woFmFZ80LjJ/wxTcOzKBxNgZulstsaW0H6QJC
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6767de-4960-47d8-3306-08db361ce854
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 21:29:59.2309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7O/ibzcGGUSipEkeVCFEoA1zATkMRLwSk+GG4V8cK3YK10Ir47V957gGKQEC2Hk01+2uYFELfz0VECqdaMusEQ+yMeXw/H2dzFUKKniSSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5571

On 04/04/2023 3:50 pm, Jan Beulich wrote:
> This insn differs from WRMSR solely in the lack of serialization. Hence
> the code used there can simply be used here as well, plus a feature
> check of course.

I have a feeling this is a bit stale now that 0f01.c has moved into a
separate file ?

>  As there's no other infrastructure needed beyond
> permitting the insn for PV privileged-op emulation (in particular no
> separate new VMEXIT) we can expose the insn to guests right away.

There are good reasons not to expose this to PV guests.

The #GP fault to trigger emulation is serialising, so from the guest's
point of view there is literally no difference between WRMSR and WRMSRNS.

All code is going to need to default to WRMSR for compatibility reasons,
so not advertising WRMSRNS will save the guest going through and
self-modifying itself to use a "more efficient" instruction which is not
actually more efficient.


But, in general and as said before, I feel it is irresponsible to be
continuing to add slow guest-fastpaths without introducing a real fastpath.

We desperately need HYPERCALL_pv_priv_op which can take an array of
inputs, and has an sub-op for each of CPUID, RDMSR, WRMSR and whatever
other ops are trapping because of no fastpath.  Perf testing routinely
shows that #GP/#UD faults are only 2 orders of magnitude less rare in PV
guests than #PF, which is an insane wastage when guests are supposed to
be enlightened and use fastpaths in the first place.


The emulation implementation is fine, so Reviewed-by: Andrew Cooper
<andrew.cooper3@citrix.com> but dependent on the PV guest changes being
dropped.

~Andrew

