Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0C64F627C
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 17:01:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299960.511341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc7AH-0004di-4u; Wed, 06 Apr 2022 15:01:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299960.511341; Wed, 06 Apr 2022 15:01:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc7AH-0004bi-1f; Wed, 06 Apr 2022 15:01:45 +0000
Received: by outflank-mailman (input) for mailman id 299960;
 Wed, 06 Apr 2022 15:01:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3N7O=UQ=citrix.com=prvs=088976f43=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nc7AF-0004bc-VJ
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 15:01:44 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7684c38a-b5ba-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 17:01:41 +0200 (CEST)
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
X-Inumbo-ID: 7684c38a-b5ba-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649257301;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=vIA1ejVbSNjFC85HbrXcdNiNQJzi4iuVdaDmkLfJNhY=;
  b=cdpp5uK0UGXeOk+GXPOBxYoUfeLzypF5X5H18bkgRe0L/iteD/Xp3x4i
   MSHsKGM3VsBXpj4o/3T4UyrQD7NGgdHttoiHqV5LmG81HX0LgAel69GDU
   iw/4qfCZZBOfSypfVskssN61eNrj6UbvSef6I1ZexIl+3747iorCj+/N3
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68063133
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:YFjS46K+ELmvFZLcFE+RCpUlxSXFcZb7ZxGr2PjKsXjdYENS12YCz
 mQXWzjVOf2OMDOhKYh3bY3k/UwBvZaBn9Y1TlFlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh3tY22YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 OlIp8ygSlcqAqKPudYzXjtdCngvPIQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glg3p4VRK2FD
 yYfQT9RdAvBJCwSA3EGKcM9wuixpSP7bBQN/Tp5ooJoujOOnWSdyoPFMsfRe9GMbdVYmACfv
 G2u13/iHhgQOdibyDyE2nGhnOnCmWX8Qo16PKK83u5nhhuU3GN7IAUfSF+TsfS/zEmkVLp3K
 UYZ5y4vpqga71GwQ5/2WBjQiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6ceRjE01
 1nPg9LgAxRutqGYTTSW8bL8kN+pEXFLdylYP3ZCFFZbpYm4yG0usv7RZupmAv6ljY32JT6z4
 gKkoQo7nuxCjOdegs1X4mv7qz6ro5HISCs86QPWQn+p42tFWWK1W2C7wQOFtKgdde51WnHE5
 SFZwJbGsIjiGLnXzESwrPMx8KZFDhpvGBnVmhZREpYo7FxBEFbzLNkLsFmSyKqEW/vomAMFg
 meO4Wu9B7cJZRNGiJObharrVazGKoC6SLzYugj8NIYmX3SIXFbvENtSTUCRxXvxt0MnjLsyP
 5yWGe71UypLUPQ7nGrmF7hGuVPO+szY7TmNLXwc5075uYdymVbPEetVWLdwRr5RAFy4TPX9r
 I8EapriJ+R3W+zieCjHmbP/3nhRRUXX8ave8pQNHsbae1IOMDh4V5f5nONwE6Q4zv89vrqZo
 RmAtrpwlQOXaYvvcl7RNBiOqdrHAP5CkJ7MFXd1Zwz1hCF/P93HAWV2X8JfQITLPddLlJZcZ
 /IEZ9+BErJITDHG8C4adp7zsMppcxHDuO5EF3TNjOQXF3K4ezH0xw==
IronPort-HdrOrdr: A9a23:EmJt9q065uLt8mmyehFFkgqjBLYkLtp133Aq2lEZdPUzSL3+qy
 nOpoV+6faQsl0ssR4b9exoVJPufZq+z/5ICOsqU4tKNTOO0AHEEGgI1+rf6gylNyri9vNMkY
 dMGpIObeEY1GIK7voSNjPIceod/A==
X-IronPort-AV: E=Sophos;i="5.90,240,1643691600"; 
   d="scan'208";a="68063133"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KzJmeY2jNzvE3yf4q1bg1WU4suGkOCt9U3IkRhLIV/r+7Xnvt0bKYRZq/BDgMgAdwATPXFitwVYaMs3GgGS9aAsUAELphquM4GC6nDmO6OLbfSWWsBw4LBUIXqVSA280bZpdYOQj3PjB9EvCbRgDCAYmWhyR6RWuNS/Okd/8mCeoqYxu5EzYVkcmhNAJwrIzoH/z6QfZtmzOeuA3QJRFa8JJ0EpZmyqFn2BLZ0zbb8xy1AMxpzuen7xkGWvjs8jFJ2p2UAgWMBQU+ftm7RPOlrh1BMq48EVqgKauNBKh4z+Ky4S/30GirJPqilDQIBDG9H5HofHW7He09voXDyP7eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFay5JcOunxrFtlt5m5C+q0vtIX11QnfKQ750bGrSOs=;
 b=Lto9FTBJT8CnSoq1e/ERUWMxYg2l/ZaECNCeaFdncop1mjGcI75+T+o4ocJsdENQ/zTVDAAcCKhh6K9+YSmG24aedSEUsU1gYXGqeiDBvtBjajSW8cDieVvaYZm9jDDf4YkHrVHJ0tXXEv/zV7ALkoUd9tAMC80bnM5ts1Q83VN3A+lXHQL5fBXzGkCKHdcBDZFSItbyAbJzvcsKDGekwFVk3TYUAW+eyqq97LtAw/bu+mIdCaW78VYxlqQgya2kubsixHpictNVAhrAo2xzs67MkMXGC/B2y/Gv95NXtmJCs/oOvPRNyLywYzfjuWWYHzK5BTAB/3NgyRgOcKODQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFay5JcOunxrFtlt5m5C+q0vtIX11QnfKQ750bGrSOs=;
 b=cCOBG92d8cAGL7QWnUAvowGYwE5EV9bhxuqxQbpSPBYlcaKp5DHb2Y55qTWgNwQWkLm6Q2Kwqcx/p8kGrSqbKHpdROcNacJ77QJgBPsMjZ3nEwkAie4MlitL1ieI2NFpVhDWur7fpMSY9yfQv9l8aEhDn1Gx9lCWqFVLggUBo6o=
Date: Wed, 6 Apr 2022 17:01:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Kevin
 Tian" <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"Julien Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] VT-d: avoid NULL deref on
 domain_context_mapping_one() error paths
Message-ID: <Yk2rS+9o2fNkUV8+@Air-de-Roger>
References: <e17b98ee-8d84-512b-6403-26c7b2ee1eb5@suse.com>
 <d232b6bd-17d2-c78f-49e1-67ffc2502810@suse.com>
 <Yk2XcUhUn0BYk3lA@Air-de-Roger>
 <ffad005c-d6b9-9f27-9b5b-4f6d7345c81a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ffad005c-d6b9-9f27-9b5b-4f6d7345c81a@suse.com>
X-ClientProxiedBy: LO2P265CA0292.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 925180a5-c45b-4caf-f06f-08da17de578d
X-MS-TrafficTypeDiagnostic: CY1PR03MB2234:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <CY1PR03MB223477F537D10383A0B479CD8FE79@CY1PR03MB2234.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wATOaHs/5rdIzkB/s9qZ3XZ1NcfusygQ+e0+DELdBovhHOrIf7hUPY8ULhzV2Vt5ht5AFY0XAbIOcEhCZSmETXC2YKqOrGlwKjyx2LmuqYK6GAM1P7Po4iOXqaeRB9+1KopTYidiJ5FSh+toRVTUUAbk5gPPBzRSAdYgoY7w4dWX1yI3um/0U8RP4kP0ikM0vy7WxGM5iBf5sOR0b/479aIiHfW7nnmccbYdPIN4MRB7I5juPTTSrea96ckzcOuE78ZCofJwds6nXfZUxqTe7iGxtpmRv+MJ60cghZl6qikOAZ/cHM/jSxKbsCy0stwi4QoGgEikwSbVqKc1F9VeLMteziFKYOWMlV79KJyM6Ug8ZfDsfsuc3pCvgIIMVXEgWYPaY6ehHJ5/zosDnEbhAiwve3rOQYQF4IhX7Qzc+O5hf2z35bOvk3DwWuRgVJ5V3Vu+ha8CHnpbjdtQFHRauW9gW81ZuCtJLcsOAbIRq8BtAo3fyfOguk2wDrocsiFYt/61Ud61fQCvejt6VTIj6zaXnPa41SodmXfIyluEqcuWr1sKK4YEmZtuRpqCuWjetXtZYTBFD53vM+RMBvEQFgiM6R9A3Oy3/mFL/P62pTAjIlGh0G1ai2K4fjTJF+WNxJ9zBJriC4hLCLSUQvUiow==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6506007)(6666004)(186003)(26005)(6512007)(86362001)(498600001)(53546011)(2906002)(6486002)(8936002)(38100700002)(9686003)(85182001)(83380400001)(66556008)(66946007)(4326008)(5660300002)(66476007)(54906003)(8676002)(6916009)(33716001)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTRXRG16N05tNzc1NXl6REhJa05TVkhYY1NTbmpLT1BPZk5WdTlRd2ZTdVpn?=
 =?utf-8?B?Ymp5cVJKWENVa0N1VnlCUmJyd2xsN2VKNWo1UGJuamlKK2RPSk5qV3J2L2JM?=
 =?utf-8?B?M2JoSzlpWFVxL3VLMTNGcDNoZDM4YkczUkJvc0hSZnZNTHd4YkRTR2w5dVhn?=
 =?utf-8?B?eGRJRTYwUm1NQ2ltQ2xtcUxsZWJPRWhTYmFGZU95WEY4WVVodyt2bWxSVDdP?=
 =?utf-8?B?RWdqUTVIaFZVSTkrcnVuT1RGQ2dONGlPcXZBTnJ4YXZvK2QyUng2U0VyZXY1?=
 =?utf-8?B?WGdHeFlzZWo4bFFSRGRua3NSUjBxdGdMLzBlc1d2YllMcU0rTWNXZmpKcHoy?=
 =?utf-8?B?K0I2VGN5bXI3SFcvT3ZFNHJySkc0L0Jrak9KMUV2eHE5djh3dUtJOHhzRDR2?=
 =?utf-8?B?VDdsSW1IaVlhVTM3VnFKbDgxVm9nZTdqbFRLZk0yMzBmOWM3K2hNdERrU1Rk?=
 =?utf-8?B?YjUxemdCdDBzMEtSQnhXbWlLVkYxRkxTaWxQWlZ3U0trMTBpanI0R092aGt3?=
 =?utf-8?B?RGd4SEh5YVZvZ0x3VmFhZUZtMzN3QUlDSlZiWXlqWlZvUWcyREFDVUp1cmdT?=
 =?utf-8?B?L3k4N0JSYkpHbmw5eEVPVDN2QS83MVdBakI2RzJuSGFBeTgveUpFWXZJVmp1?=
 =?utf-8?B?djhrMitkM0Z6bDV2dDJVWEdUSTBxNUhEd3FZcGZjOFhZMnNwa3BUQlFkbWQy?=
 =?utf-8?B?c2RHdVhEYUNjcHdPY2MvMTR6dW9QdWh4SzNmQnhMT1R3dElMQTI5NlcxY1Vt?=
 =?utf-8?B?RThMNi80ZUdzVHo2d1l6cU9DSFd2QzdwWDZYUWhhTE5la2RwSUcvZkJNa0lJ?=
 =?utf-8?B?T2c0aFFCMUFMSGdFWWd4NzZXMVpBQzBRbUdUTkRZd05uZUx2SXlSWDJSS0ZO?=
 =?utf-8?B?MTF2MDVBTmtnQlRjRTc2d2JvNXJDVnBuTUl2eG9LcTF4b0JDUkFNSWpBUzRa?=
 =?utf-8?B?bzRzbTRPbFRJTEdnWXRnODBlWEZtSDdkbHdKSHJsQ0E4OVJuS2ZuSG1GMzBq?=
 =?utf-8?B?cHdXVWZzekRHQjRRc2dDeDdOQUd1dEE4QnFBNzRBR2h0b0o4S0IyYW8xSlNr?=
 =?utf-8?B?dUJVTnZTc3pzZFF4UUFwTnlzOHFickNvNWhxWStkdGhFUUgxM3ZnQ3E3YUly?=
 =?utf-8?B?dlZJUG16VllKU202RzFEcStrMndialBFVmhEdlQ4VDZSaXRjdE9YcU9BU2FK?=
 =?utf-8?B?SVJteFhSREFrQ3FPdlpWVDVYc2hKa3ZCelFPMWFneUhBQytzWDZ0NlNETlRu?=
 =?utf-8?B?TXlreUIzcjVEK21YMjltNEZTU3V6QWkxY0xTR3hVTG05MlYwVXUyWDIrNU1j?=
 =?utf-8?B?cDFLQmRhaGZpMlB2Qno3eFlzWmZlSXAyMm9nRzBnNGdtSXBvZ1V5alZIQnRT?=
 =?utf-8?B?SFYyVGdtbWd2OWpSdVdjVnhkSk1vUWJQc1hISXFBYWY5dy9FRUlFLzZtTmZ3?=
 =?utf-8?B?L2I5eTB2RmRSRE5pY0VJYUxvYzZZcXd2bG5PVVRJbDFLVi9HdlJ0cUJYczhk?=
 =?utf-8?B?ek9OSkhPeUp6c2NUajJ1eEMrYjBLeFhaTCtWdWhsNWRWY2syT3NyT2dGc3ZL?=
 =?utf-8?B?OE5qUlc4c0FQOUFXd3MxT2FLQUFWVlI1T0tPSlVlSmhpYyswb1JwUTFNaVNC?=
 =?utf-8?B?NzVaTXJqRkR6NTgzNnZUYUMxSm1oSjl5akVXQk03ODlsWlNiaHZ2emFQOGVa?=
 =?utf-8?B?UE1BU1ZIaFNWL0t3ZVU0QlpncFlUak02TmVvMDd1V3h0WjUzYzJqSnhvclFI?=
 =?utf-8?B?YXRVQmdWT1B1SGlXRFh2Qy9RMTNEMUlnSmxaUWoyMU9BWFA1STJhTFc5KzdB?=
 =?utf-8?B?UW5IQit1VEFUb0VUbzM1UnJTSkxvUHBZSUw4aldDdHB3WGZtQ0F4R3p0RjJp?=
 =?utf-8?B?SzZEM1lNSEJwNGZoLzNmdkE2R1UyNzN6M1hSZ29rY3VIQmZ3emFVOVEwUGgv?=
 =?utf-8?B?OXN4eTBPZnBkTy9IS0puMWR4UisvLzRJSGR0Q3NRNEZJTDdpQk1HZ1U5OGRk?=
 =?utf-8?B?NXJFaDhQQUJqRThhOTVIZ2RVM25YbFlJOWpLekdmbGlVT2tvZGxzKzZCTjls?=
 =?utf-8?B?VjExVXVoVzFtNlJtbTlnakpENmtyTllySUVmYko1N3F2SHhzSDd2Q2V0UE9z?=
 =?utf-8?B?cHBPbnAwZ0c0UnVsWUJUZmpJTlI2R25kKzdJZ3ZjMytCeDM4OGF5YlIvNG9K?=
 =?utf-8?B?eHlyQ3RzTkZMOVgyT1k1YmhucFQxNnlvWG4zd3I0Y3FXa1M2c1AxMEZuL1Rv?=
 =?utf-8?B?VVZlSm1TRzhneW94KzFJRE5FTzJPUWlqcTh3Rks3RVl6SW1SeTNXREs4MmI3?=
 =?utf-8?B?RkFaaG5oY0VnSnJoM1NzZThoQ1Jub3hHVDdIcWZWVThNQ0tGWlc1b0tROEhG?=
 =?utf-8?Q?AiGB2SsPHWB931pY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 925180a5-c45b-4caf-f06f-08da17de578d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 15:01:34.7475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tuiw/TEQrbopRwRLqtA4GHjiA4axims9wXtOzTIUgYaVw7Ff5l8hJ3HP7BVbxvte2QCMleUVABL0aVWJgqrVHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB2234
X-OriginatorOrg: citrix.com

On Wed, Apr 06, 2022 at 04:07:24PM +0200, Jan Beulich wrote:
> On 06.04.2022 15:36, Roger Pau Monné wrote:
> > On Wed, Apr 06, 2022 at 02:24:32PM +0200, Jan Beulich wrote:
> >> First there's a printk() which actually wrongly uses pdev in the first
> >> place: We want to log the coordinates of the (perhaps fake) device
> >> acted upon, which may not be pdev.
> >>
> >> Then it was quite pointless for eb19326a328d ("VT-d: prepare for per-
> >> device quarantine page tables (part I)") to add a domid_t parameter to
> >> domain_context_unmap_one(): It's only used to pass back here via
> >> me_wifi_quirk() -> map_me_phantom_function(). Drop the parameter again.
> >>
> >> Finally there's the invocation of domain_context_mapping_one(), which
> >> needs to be passed the correct domain ID. Avoid taking that path when
> >> pdev is NULL and the quarantine state is what would need restoring to.
> >> This means we can't security-support PCI devices with RMRRs (if such
> >> exist in practice) any longer.
> >>
> >> Fixes: 8f41e481b485 ("VT-d: re-assign devices directly")
> >> Fixes: 14dd241aad8a ("IOMMU/x86: use per-device page tables for quarantining")
> >> Coverity ID: 1503784
> >> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> --- a/SUPPORT.md
> >> +++ b/SUPPORT.md
> >> @@ -750,6 +750,10 @@ However, this feature can still confer s
> >>  when used to remove drivers and backends from domain 0
> >>  (i.e., Driver Domains).
> >>  
> >> +On VT-d (Intel hardware) passing through plain PCI (or PCI-X) devices
> >> +when they have associated Reserved Memory Regions (RMRRs)
> >> +is not security supported, if such a combination exists in the first place.
> > 
> > Hm, I think this could be confusing from a user PoV.  It's my
> > understanding you want to differentiate between DEV_TYPE_PCIe_ENDPOINT
> > and DEV_TYPE_PCI device types, so maybe we could use:
> > 
> > "On VT-d (Intel hardware) passing through non PCI Express devices with
> > associated Reserved Memory Regions (RMRRs) is not supported."
> > 
> > AFAICT domain_context_mapping will already prevent this from happening
> > by returning -EOPNOTSUPP (see the DEV_TYPE_PCI case handling).
> 
> Hmm. I did look at that code while writing the patch, but I didn't
> draw the same conclusion. I'd like to tie the security support
> statement to what could technically be made work. IOW I don't like
> to say "not supported"; I'd like to stick to "not security
> supported", which won't change even if that -EOPNOTSUPP path would
> be replaced by a proper implementation.

My preference for using 'not supported' was simply so that users don't
need to worry whether their use-case fails in this category: Xen will
simply reject the operation in the first place.

Otherwise users might wonder whether some of the devices they are
passing through are security supported or not (lacking proper
information about how to check whether a device is PCI, PCI-X or PCIe
and whether it has associated RMRR regions).

I understand your worry here, but I do think we should aim to make
this document as easy to parse as possible for users, and hence I
wonder whether your proposed addition will cause unneeded confusion
because that use-case is not allowed by the hypervisor in the first
place.

> Even adding a sentence to
> say this doesn't even work at present would seem to me to go too
> far: Such a sentence would easily be forgotten if the situation
> changed. But I'd be willing to add such an auxiliary statement as
> a compromise.
> 
> As to "plain PCI (or PCI-X)" vs "non PCI Express" - while I prefer
> to avoid a negation there, I'd be okay to switch if that's deemed
> better for potential readers.

Maybe it would be best to simply expand the comment before the RMRR
check in domain_context_mapping() to note that removing the check will
have security implications?

> >> @@ -1601,9 +1601,13 @@ int domain_context_mapping_one(
> >>  
> >>      if ( rc )
> >>      {
> >> -        if ( !prev_dom )
> >> -            ret = domain_context_unmap_one(domain, iommu, bus, devfn,
> >> -                                           DEVICE_DOMID(domain, pdev));
> >> +        if ( !prev_dom ||
> >> +             /*
> >> +              * Unmapping here means PCI devices with RMRRs (if such exist)
> >> +              * will cause problems if such a region was actually accessed.
> >> +              */
> >> +             (prev_dom == dom_io && !pdev) )
> > 
> > Maybe I'm reading this wrong, but plain PCI devices with RMRRs are
> > only allowed to be assigned to the hardware domain, and won't be able
> > to be reassigned afterwards.  It would be fine to unmap
> > unconditionally if !prev_dom or !pdev?  As calls with !pdev only
> > happening for phantom functions or bridge devices.
> 
> Like with the support statement, I'd prefer this code to be independent
> of the (perhaps temporary) decision to not allow certain assignments.

I was just saying because it would make the code easier IMO, but maybe
it doesn't matter that much.

The comment however should also be adjusted to mention that refers to
legacy DEV_TYPE_PCI type devices ('PCI devices with RMRRs' is too
unspecific IMO).

> Since you mention phantom functions: Aiui their mapping operations will
> be done with a non-NULL pdev, unless of course they're phantom functions
> associated with a non-PCIe device (in which case the same secondary
> mappings with a NULL pdev would occur - imo pointlessly, as it would
> be the same bridge and the same secondary bus as for the actual device;
> I'm under the impression that error handling may not work properly when
> such redundant mappings occur).

The redundant mapping of the bridges would be fine as prev_dom ==
domain in that case, and cannot fail?

Thanks, Roger.

