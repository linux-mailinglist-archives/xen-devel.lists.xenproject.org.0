Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A6A48AD19
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 12:55:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255713.438264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Fk0-0005qE-Gc; Tue, 11 Jan 2022 11:55:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255713.438264; Tue, 11 Jan 2022 11:55:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Fk0-0005ok-Bz; Tue, 11 Jan 2022 11:55:04 +0000
Received: by outflank-mailman (input) for mailman id 255713;
 Tue, 11 Jan 2022 11:55:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Jw/=R3=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n7Fjy-0005oc-CC
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 11:55:02 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ccfcfed-72d5-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 12:55:00 +0100 (CET)
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
X-Inumbo-ID: 4ccfcfed-72d5-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1641902100;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=U0hbscrPaGr91yvLJWfEfZZhO2yYxbmVyt3J4grZuNA=;
  b=BdQKY69PpOiRBkCuot9N++HoE32a6yg4dT5oMuuwpTGWeMeN7h3dKTtE
   hb+gUOTQeAiLjXSQHaEqcAntDsG6cELQKFNKkqOg5gdSacPfDOC0mU5T3
   7YIB8PShungusJmGxvnQtion07lO6eHkVTJgOLR71zQ1VPMt4QHlASfnC
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5etvdTkrEgQG4yk4DFN8gvPJy08tiNvAEDMfEsLnIoZJe+f3W8Pla3QCqqlzD8IDzcKUgKGofz
 0xSxBEQA9XiPPA9wa5H1BajBE9XzxQU2rmPieD4x3B2Dznjw94MJqPkOUW9zolfeXcJMPC8rz0
 0Ri6srSdWWwVB7bedxEljbsAH+hjX3lbw8K8uobaZk+OzxuI06W5GOHVo7ECmnLdEcJHNed6th
 QXaCIFmJtRscdOztIbMru5WAmPI0fMHjU8TEn/nvUIkpHtOXLRrwrgE56ZlaovVbgLdKf0jxn/
 F+Lse3XHFw9YMvnYEJi2omii
X-SBRS: 5.2
X-MesageID: 61651203
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zKXm36lDaMt48MBjlwvA8pPo5gwMIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNXzqAP//bZjfxKNt2bo2z/UgCucPXzNdjSwFu/i9nFyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh29cx2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 Phm5aKhSzUkArPjhuoBaCYbTihMGpQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glp2J0XR66FD
 yYfQQdCMi2QbEMXAV5UOLNisNqFh3jVcgQN/Tp5ooJoujOOnWSdyoPFMtXPfceRbd5IhUver
 WXDl0zpDxdfONGBxD6t9nO3mvSJjS79QJgVFrCz6rhtmlL77nMXIA0bUx28u/bRoky0Vs9bK
 kcU0jEztqV0/0uuJvH8QB+QsHOCpgQbWddbD6s98g7l90bPy1/HXC5eFGcHMYF48p9tLdA36
 rOXt/7CVQJ+so+YdWyy6LmIlgzxZCEnClZXMEfoUjA5y9XkpYgyiDfGQdBiDLO5g7XJJN3g/
 9yZhHNg3utO1Kbnw43+pAma2Gz0+vAlWyZovl2/Y46z0u9uiGdJjaSM4EOT0/tPJZ3xorKp7
 CldwJj2AAzj4PiweM2xrAclQenBCxWtamS0bbtT838JrW/FF5mLJ9E43d2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPa8TIS5DqmFNoETOvCdkTNrGgk0PiZ8OEi3wSARfVwXY
 8/HIa5A815HYUiY8NZGb7hEiuJ6rszP7WjSWYr633yaPUm2PxaopUM+GALWNIgRtfrcyC2Mq
 oo3H5bUl313DbOvCgGKod97BQ1bdhATWMGpw/G7g8beeGKK7kl7Va+IqV7gEqQ495loehDgp
 SDiChQGmQum1RUq62yiMxheVV8mZr4mxVoTNi0wJ1e4nX8lZIek9qAEcJUrO7Ig8YReITRcF
 JHpou2MXaZCTCrp4TMYYcWvpYBubk3z1wmPIzCkcH40eJs5H17F/drtfw3O8igSD3Xo6Zti8
 uP4jg6LE4AeQwlCDdrNbK79xV2GonVAyvl5WFHFI4cPdRy0opRqMSH4ktQ+P9oIdUfY3jKf2
 gvPWUUYqODBrpUb6t7MgazY/Y6lH/EnRhhRHnXB7KbwPi7fpzLxzYhFWeeOXDbcSGKrp/nyO
 bQLl6nxaaRVkkxLvoxwF6dQ4Zg/v9a/9aVHyglEHWnQawj5AL1XPXTbj9JEsbdAx+EFtFLuC
 F6P4NRTJZ6AJNjhTAwKPAMgY+mOiaMUlz3V4ahnKUn2/nYqrr+OUEEUNBiQki1NarByNdp9k
 +smvccX7S25iwYrbYna3nwFqTzUIyxSSbgju7EbHJTv21gixVx1aJDBDjP7vcOUYNJWP0h2e
 jKZicIuXViHKpYup5brKUXw4A==
IronPort-HdrOrdr: A9a23:zNYmqqtR8rhCy1ICQxqpXGND7skCkoMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK7yXdQ2/htAV7CZnidhILMFuBfBOTZsljd8kHFh4pgPO
 JbAtRD4b7LfClHZKTBkXGF+r8bqbHtms3Y5pa9854ud3AQV0gJ1XYGNu/xKDwOeOApP+tfKH
 LKjfA32AZINE5nJfiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvF
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfomoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A3eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqeTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQ/003MwmMW9yUkqp/VWGmLeXLzYO91a9MwQ/U/WuonlrdCsT9Tpc+CQd9k1wg67VBaM0o9
 gsCZ4Y542mePVmGZ6VNN1xMfdfNVa9My4kEFjiaGgPR5t3c04klfbMkcAIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.88,279,1635220800"; 
   d="scan'208";a="61651203"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+sEabg0ie+/ehbdkUp2MkQEieZOPoSL7qiGJjajctkwx8PwgfCg99F+gNYcvcmu0z8xM9TCNXNVM8uYeorOiygK7sisy5gARawrWY+D29+UrCqHAqRWx8WKRJigMpzssP8B1STjYXaV69M3xWUOxYn1rOuJLztTedLKvz8Y5W27KJvsG6QNzX0DTpxAvH1sIVLhJu0ryADnTfueBCT4TBGAica60ZT4RCj0CaI4wrsFKUCHyVvR6DhXWw7VZwDm+kEVad8Hs8Gf0pYDf61Z91PvUVH5DQ0keDvr8QPcbKFFVMWMpteGWgIY9amkBw1+iBFOlmhxQv3hgDLXvArLZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZ0Cbvz926NTgRTrvdLHHHZ+5J7ACoMO4n/b9B0ZPp4=;
 b=dDW40jvJpnJOxaBo9wmnS3GOtBRM9k0WpAmwSBRlPQa/DfG1YFfbvz07CwhxFS+t+qxfUTEi95ffrUMS2uD2cOT/Ri0piRGdIZ8cda4cJ5PpAa8cTpGW9ltSpO9f9DV+XCZWfbti37aYZn3ltWPg9RrpkoScRRPw1ahVI5/6KoDI3UJ1w7F3g5YtXC3EeGbflTSrTcm5BMxIV54ctmIXQ6BYstMp51Wby7s45J1I6z+hQN+o8zQgK72LzGwWEyjQDyG2wrA79wEl08gHnUVQmItnpDDVH6YdNf3qDeFFH0ehI0eprc032Y9y7MVBxBP2aapwRcZfLNquwy272Rykew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZ0Cbvz926NTgRTrvdLHHHZ+5J7ACoMO4n/b9B0ZPp4=;
 b=i86908GdAdsTEIjELKuQpH+xg90uUqbiZNhI6KrXZ4VAXmHe41iG847qCSkc7t98IdgAqHwSZ8m7CjcRfQCDh8QY/MWIJWNDpuPoAYIeTwnYz7fbvQvgzH5HgYPDZSs4j+wjOj33tWaPBjkVQJouPXvOXfbX31GJa1Lt+zOdpHQ=
Date: Tue, 11 Jan 2022 12:54:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 07/12] libs/guest: introduce helper set cpu topology
 in cpu policy
Message-ID: <Yd1wCLIthiFIaOR8@Air-de-Roger>
References: <20211129153355.60338-1-roger.pau@citrix.com>
 <20211129153355.60338-8-roger.pau@citrix.com>
 <205f13b4-6f2e-7937-7fc9-f1ce7082ae3f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <205f13b4-6f2e-7937-7fc9-f1ce7082ae3f@suse.com>
X-ClientProxiedBy: MR1P264CA0080.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4ce8753-730c-4f60-c9c6-08d9d4f92e32
X-MS-TrafficTypeDiagnostic: DM6PR03MB4299:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB4299787CF56D54FDF519F2A48F519@DM6PR03MB4299.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9xVBIdWgwJaDc3/blGSxyuhlXIl/3Hp/TSKvHKHCOQd5oLG6AdOO4BDzZsyg/D8ZvyJoRNj2vjYIYXvqGqtd9aSUw7sz9hLwwOp+2Xll7ZJSs+zs7W5cCFTSz2vCi3u5aHacG2kf9LSTd6rwDnMr3We3gZQkpBbc9Q49jTLxltqf1SyaQTeKMgotK/CgGqNg2HfVZh02x/f3SUwlbRYyjaq7jPFurB33bi3gvg2+/iuOv1gV61BY/WTAKGGAsb3zT2Pk0XKWB7Wo22jw1F2eFya83J86cjt7XCxX/GmFl9ZVj4hwhMUJ0xjLO1gf+nydqndJoer3D+P52bBkFKSELU/A7dhDOaxAx6z/0pcA7+rGEVs2QFAuORsMHFMS1JJYcCTsKNiq6rl7y8r0S08t/njNwji+j4EqUb5e3pPxGc4nsCyO5eiR0T2//SFodvIRISOqjibx39mQ1mpGSA8g/mqdZXHW1d0KwkAZWZ5RG8K4H0HNn3/hwndupIVO3QFnT1x04q9ZSrr6ujKyIum5NwnAO6JqktxofYb90z0q4OLaAYzsOHwfg1FBj06c8UyrIi3l0CypoGNtXB26Vt2gccnGISml6u6sB7SN4nuDkL5kcqjieK8VCnSSQ6xoVz/wEg53OJWbIPezGnrwv0MrXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(82960400001)(8676002)(86362001)(5660300002)(38100700002)(8936002)(186003)(316002)(26005)(33716001)(54906003)(4326008)(508600001)(53546011)(6506007)(66476007)(66946007)(83380400001)(2906002)(6916009)(6512007)(85182001)(6666004)(66556008)(9686003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXBma0VrZkhNeVV0NEc5LytWZnJYaDZ5N0hCRXRoZzJPSzYrcXpZZmJxNm5j?=
 =?utf-8?B?RFhMYUhKenpYeE9uaXpweGVjRy92cE1PQVM2RE1pc1pRWTNsSTI4c0NDVXBS?=
 =?utf-8?B?NnRUaUFlMk5HdUpJYnpUVVBFSmdOU2VqZEhUY0dBT0wzRy9rZTI1eW1jdG9X?=
 =?utf-8?B?cGs1ZjNGS2lDcHo1RmpvSm1BeDFjbDJJdjBHeFpqOGR5NkV2dzROSEtiVkFB?=
 =?utf-8?B?clZST1dHL0VrQU9SVmRtMERPdjBXVGJiSmpxU1FHV2hUQkFnV2FVcE93Vlhz?=
 =?utf-8?B?UVFqT1RiOC9PN3ROV1lLbFh1ZkxDK0F3ZVV5VUYzTTkvaHg4RHR6ZVU5MTZM?=
 =?utf-8?B?MTVRbEZjbXhMM2d6WnR5bXg3Y0RVSGpXS2tmMk0wZERGcnZ5T1pLUkFLdTZT?=
 =?utf-8?B?WkRZN2hRTUxrNnVVMG5JcDcvSHFzck5sMys2L2NFdVN3bVBWK2hBWkdlRW1N?=
 =?utf-8?B?WVo3VmVoR1BleGRFU1N6TU1JSzNiV2Z3T0ZRaTB6enRFL2JMcGt4ekIzczBW?=
 =?utf-8?B?NG9SYk1qbXkrRzN4SWZMN09mMTV5YlVyWE11Z2MvWlNtUlUxWTQvWWI5Vk5a?=
 =?utf-8?B?eHhjWVBxeStkeHMxTms4SGFXWVhISG5UZ0JFNEZsUmZLZHJJNkF4THVaT2tz?=
 =?utf-8?B?T2xnZGEvaGdSM0dIYk5takFNUmVGbUIwbmFkeFpNbmpDVEhQU3U5Z2xxSUZp?=
 =?utf-8?B?dGVVZ3FoaHlFVUh2V3FXTlp5cG4wMVE2dWZPa0RibFpPczBucis4TE5Lc3pI?=
 =?utf-8?B?NElPN0ZjODZ1VEdNeUoxLzlYN29lWnhqSTdjSFVjSExKRDM2UDEyYWJ5VDdP?=
 =?utf-8?B?K2pjSmhQYkdua3RydjA2b1BMalRFcWlrbWh2MzcvM2wwZy92bmFGaUZlNWMv?=
 =?utf-8?B?akxOdzVQQTJnamIxL3dwT1F3b1l0YVU0TlcwSDMyVC9mc3pseDVxZ2lMMnVT?=
 =?utf-8?B?TFh1T2ErQjUwaHN2aEF6ckhkTk1xWU8vUzRPNElST3RkQkFaVXhxNzVhWjBP?=
 =?utf-8?B?aHJ1T05GcnMrQ3JVSERIdUI0c20xM245R0ZFeDZrbVVGU2FkbUkvQldpZmM5?=
 =?utf-8?B?bmc4Vjk5R3pVbmNPWWVPSjdGT09nYUxIZnFOMVBQWVA0VUhYbGZ3YlZXb01o?=
 =?utf-8?B?MEZFdzFSeTRPUFVPQkw3bTNtS2tiZnF2VlB4YTBoaC9pbFJJKzhhbzY2QnFh?=
 =?utf-8?B?NTRtai9SNTIyK3R6dVY5a2hLOUdMRjZCVWdVZEFoRGxYRzQ1eSsxSlZDU21M?=
 =?utf-8?B?NVJSNXUyWGlrUU5md24rQzVGaUpqaVEvanIrSll0VkNBTmZhSVFpQ2QwZW8r?=
 =?utf-8?B?S3dQaXRpTkRueHN1eEl5MW5qNjU0SlFrenJEeUNudnFTdmdVYU1oS2FoYWl4?=
 =?utf-8?B?dVY0bTRkTnBGb2ZsMytaUllmMm9OMkJtVjhZeXBTRlBxbW5oZHRIcXhqRzdr?=
 =?utf-8?B?WjlXT2xUdWVvSFp6SU8rblpTQ0VWODM2WW9IRGVLYWtCZWg0Tm9XRzc0TjJ3?=
 =?utf-8?B?RFpCSEJiRlpVMG8rMHQzTmdwZ2FzVWJXSXcyTThoSVo4MWYxVjd2WVpVUzBw?=
 =?utf-8?B?ZnNIeHFmejFyUUI2RDYxK0hlUGVJNzY5U1hqT1VNL2dzYk9DbGN6dUxaanBB?=
 =?utf-8?B?anB1bTloQjdlRnRNdVZVWU1DOG53bUg5MjNUQnhZaGxrQUIyZHFQWkRidHI0?=
 =?utf-8?B?dHh0SlhqY3JVSEZ3SE5CTWJXY1dhUjlReFUyb1V5VnFqVEFwMzNVb3JYcGxT?=
 =?utf-8?B?YVhoQ2NQY25aa2lURlV5K3JVN3Bqek5FZVliRmJVRUllSFUrOXYrQjRhakNX?=
 =?utf-8?B?TjBTOWYwMzBoSzRTWTF1SGZsSXVrSmM3VENHUnhpOVpWcjVrblppRHNlYkFQ?=
 =?utf-8?B?OEJlSzVQanJiWWN5c2FEOHdybktkTFlRaW9nbzZBb1ludnRhM3FuRjFOdDV0?=
 =?utf-8?B?NzMyckNsYmxqZHAwTlpxSHA2QTRmZnhjTTJiN1JaallkVkVIZjdPOXQ1Y2Zx?=
 =?utf-8?B?bzFlNHgrcDBaZU1wemMzRXBOKzUwcWlzem1heEQxNXRyaEFOeFQ5S0F0ZDBL?=
 =?utf-8?B?eTBEcm1xcTBGcnVUZDU5UXBRMVQwUHdEcyt0ZFQ5OHNZcGliSXhPeS9QbzRT?=
 =?utf-8?B?dWl4Y3VCUWJnWVJzUjdmTTNTSG5rdzF4SHNZVUtRSk9XT2xUaUZOanF1b25N?=
 =?utf-8?Q?igjdbke3XsbJ+pF6TdG0kpI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4ce8753-730c-4f60-c9c6-08d9d4f92e32
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 11:54:53.8536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: py/qEwmHQNbSxlQli3jDK9Ao9r0+GgCxXGKlCptDss8BrLPLuI3OrcqxySeMcysZK7SNg0YVgiI/kpovYpH2ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4299
X-OriginatorOrg: citrix.com

On Mon, Dec 06, 2021 at 05:09:42PM +0100, Jan Beulich wrote:
> On 29.11.2021 16:33, Roger Pau Monne wrote:
> > @@ -458,22 +456,6 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
> >           (p = calloc(1, sizeof(*p))) == NULL )
> >          goto out;
> >  
> > -    /* Get the host policy. */
> > -    rc = xc_get_cpu_featureset(xch, XEN_SYSCTL_cpu_featureset_host,
> > -                               &len, host_featureset);
> 
> You go from retrieving the host featureset to ...
> 
> > @@ -944,3 +865,98 @@ int xc_cpu_policy_make_compat_4_12(xc_interface *xch, xc_cpu_policy_t *policy,
> >      xc_cpu_policy_destroy(host);
> >      return rc;
> >  }
> > +
> > +int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t *policy,
> > +                                  bool hvm)
> > +{
> > +    if ( !hvm )
> > +    {
> > +        xc_cpu_policy_t *host;
> > +        int rc;
> > +
> > +        host = xc_cpu_policy_init();
> > +        if ( !host )
> > +        {
> > +            errno = ENOMEM;
> > +            return -1;
> > +        }
> > +
> > +        rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
> 
> ... retrieving the host policy, which afaict is a larger blob of data.
> Is there a particular reason for doing so?

I did that so I could assign from one CPUID policy to another, but
will revert back to using a featureset since it's indeed smaller.

> > +        if ( rc )
> > +        {
> > +            ERROR("Failed to get host policy");
> > +            xc_cpu_policy_destroy(host);
> > +            return rc;
> > +        }
> > +
> > +
> > +        /*
> > +         * On hardware without CPUID Faulting, PV guests see real topology.
> > +         * As a consequence, they also need to see the host htt/cmp fields.
> > +         */
> > +        policy->cpuid.basic.htt = host->cpuid.basic.htt;
> > +        policy->cpuid.extd.cmp_legacy = host->cpuid.extd.cmp_legacy;
> > +    }
> > +    else
> > +    {
> > +        unsigned int i;
> > +
> > +        /*
> > +         * Topology for HVM guests is entirely controlled by Xen.  For now, we
> > +         * hardcode APIC_ID = vcpu_id * 2 to give the illusion of no SMT.
> > +         */
> > +        policy->cpuid.basic.htt = true;
> > +        policy->cpuid.extd.cmp_legacy = false;
> > +
> > +        /*
> > +         * Leaf 1 EBX[23:16] is Maximum Logical Processors Per Package.
> > +         * Update to reflect vLAPIC_ID = vCPU_ID * 2, but make sure to avoid
> > +         * overflow.
> > +         */
> > +        if ( !policy->cpuid.basic.lppp )
> > +            policy->cpuid.basic.lppp = 2;
> > +        else if ( !(policy->cpuid.basic.lppp & 0x80) )
> > +            policy->cpuid.basic.lppp *= 2;
> > +
> > +        switch ( policy->cpuid.x86_vendor )
> > +        {
> > +        case X86_VENDOR_INTEL:
> > +            for ( i = 0; (policy->cpuid.cache.subleaf[i].type &&
> > +                          i < ARRAY_SIZE(policy->cpuid.cache.raw)); ++i )
> > +            {
> > +                policy->cpuid.cache.subleaf[i].cores_per_package =
> > +                  (policy->cpuid.cache.subleaf[i].cores_per_package << 1) | 1;
> > +                policy->cpuid.cache.subleaf[i].threads_per_cache = 0;
> > +            }
> > +            break;
> > +
> > +        case X86_VENDOR_AMD:
> > +        case X86_VENDOR_HYGON:
> > +            /*
> > +             * Leaf 0x80000008 ECX[15:12] is ApicIdCoreSize.
> > +             * Leaf 0x80000008 ECX[7:0] is NumberOfCores (minus one).
> > +             * Update to reflect vLAPIC_ID = vCPU_ID * 2.  But avoid
> > +             * - overflow,
> > +             * - going out of sync with leaf 1 EBX[23:16],
> > +             * - incrementing ApicIdCoreSize when it's zero (which changes the
> > +             *   meaning of bits 7:0).
> > +             *
> > +             * UPDATE: I addition to avoiding overflow, some
> 
> Nit: Would you mind switching "I" to "In" at this occasion?

Will do.

Thanks, Roger.

