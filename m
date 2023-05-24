Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB1E70F9FD
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 17:23:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539137.839729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1qJw-0006LA-UZ; Wed, 24 May 2023 15:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539137.839729; Wed, 24 May 2023 15:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1qJw-0006I6-R6; Wed, 24 May 2023 15:22:36 +0000
Received: by outflank-mailman (input) for mailman id 539137;
 Wed, 24 May 2023 15:22:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q8ut=BN=citrix.com=prvs=5011a8a4f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q1qJu-00060I-Qv
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 15:22:35 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cccfdb45-fa46-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 17:22:32 +0200 (CEST)
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2023 11:22:19 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by LV8PR03MB7472.namprd03.prod.outlook.com (2603:10b6:408:18f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 15:22:17 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 15:22:17 +0000
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
X-Inumbo-ID: cccfdb45-fa46-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684941752;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=o76yZ4k497HOZQhx8YNmmMYxCb66VFuaVaseEYwZvWw=;
  b=dn65mXJ9/ycP3W/5s5FU3CCqaby88my6tDsGb5Xh5zrHt+fhr9l0oe1F
   lIkxyd/w1T2rCl4cytlf3FYQTeoPHi2E2UZIyIcgSzO4ULl8fU26rVof/
   R2RMGO3lf1ikhLycOAmrYwuIJrLOz/vi4+l4YYouHc+H++Kt/AzHjcXJ3
   o=;
X-IronPort-RemoteIP: 104.47.66.43
X-IronPort-MID: 109567907
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:51bo66KKseUoK6FHFE+RzZQlxSXFcZb7ZxGr2PjKsXjdYENS3zVSx
 2AYUWiEb/7eamX8e9p1YY6y80xXuJPVx9cxSgdlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4wZiPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c50WnlW9
 tE1BgwgMEGyn7yumo3qR+dV05FLwMnDZOvzu1lG5BSAV7MDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/RppTSIpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyr927GQzHukMG4UPOGU1NQ1n3+y/TZQUEYvDFSmr6i9zUHrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAHQyBAbpo6tcYwbT0sy
 lKN2djuAFRSXKa9THuc8vKRsmm0MC1Md2saP3dYFk0C/sXpp5w1glTXVNF/HaWpj9rzXzbt3
 zSNqyt4jLIW5SIW65iGEZn8q2rEjvD0osQdvG07gkrNAttFWbOY
IronPort-HdrOrdr: A9a23:bXVz9a5l8iSwtuSMzwPXwaOCI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HjBEDmewKlyXcV2/hpAV7GZmXbUQSTXeVfBOfZowEIeBeOi9K1q5
 0QFJSWYeeYZTYasS+T2njDLz9K+qjjzEnHv5a88587JjsaEJ2Ioj0JfTpyVSZNNXh7LKt8MK
 DZyttMpjKmd3hSRsOnBkMdV+yGi8zXmIngaRsmAQdizAWVlzun5JPzDhDdh34lInhy6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATtMr9xsBFDMmsjNFQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30l8dFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdpXf4u8T2SB8zFsIE3OtiA1LkwntlmOs5/L
 NA3mqfuZYSJRTcnB7l79yNcx1xjEK7rVcrjOZWpX1CVok1bqNXsOUkjTVoOaZFOBi/xJEsEe
 FoAs2ZzPFKcWmCZ3SchWVryMzEZAVAIj62Bmw5/uCF2Tlfm350i2ECwtYEo3sG/JUhD7FZ+u
 XtKM1T5f5zZ/5TSZg4KPYKQMOxBGCIawnLKniuLVPuE7xCE27RqqTw/K4+6IiRCdA1JaMJ6d
 X8uW5jxC4PkxqEM7zM4HQLyGGBfIyFZ0Wi9ikEjKIJ+IEVR9LQQF6+oR4V4o6dSs4kc7Pmss
 aISe5r6sDYXBTT8P5yrmvDsrlpWAwjuZ4uy6IGcmPLhP73AavXkcGeWMrvBdPWYEYZsyXEcz
 E+YAQ=
X-Talos-CUID: 9a23:tMFRDGP3f82iO+5DW3J/7E05N+4ZXyOM/W+OOxWHWGtncejA
X-Talos-MUID: 9a23:yNlMKwnMV+4dFOrFAu1Bdno+GOVCvLuMKXtX0s1dgpCLKCIhP3CS2WE=
X-IronPort-AV: E=Sophos;i="6.00,189,1681185600"; 
   d="scan'208";a="109567907"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KsRf5++0xf5A+sk8HxU+DbQz+3tF3tOe5pjRdABYP1nmAOv0+LtJlsomJpZxdZtaiN577t5kklZXC/fyn4Vz9WN4/J6PaBzSMgFaoXRn7bKAJ+P326/yRU6uwwR0ivmc02pEMpp81DP92+Jwu7+uvjhajwF98aMVYeP4Y/mboPXMr8ae6pZkl1Ax0gOYA3zTIVpanfwGSCrNC431Ea+1oXhSHMu2XavS2XM8fCGhN08frVe9WowwTkJAHUXr6PI8Nd9G/XJJiTK6dsXR20A9iGbi1dI/6NmRQzsEsG4szcXztK4VjEc5ndGMgPR+giWUHZ3Mrhk2ok8mApEk1LWEdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30ru+lLePwOyS4uvchiCqk6eSxy4Oc0C9zDO72tKQss=;
 b=FfjddFRe46QMf5MIKEHJIIyzS25SoM0VvbAGbX2vQPxxfihqF2ndELV5W9mWWeVFCHHwbo9ZtOmDdecX4Jby7dKoHXK9vMZ3ERLIJPX43Wo85Iy3rkAaUf+NApbpunU3AuZUOxckBn0MzxKFuoPRHmJL8gLD8GrWnf1erQpTJQfr7SPxHY3ZDP0EZnQnp5F6h/Wz+oiU7wB1Qb7XfD/XJvZRyhHFe/7HJEn9n2Lon+gvzFdwhEguijnqdbiyxRJZp6kEOfuomM4MTJDjdeJWZ6opawLpjKxfA/SMYFULCwfQPhQ7Wu6crJBQCcwcyGjONNhvwcxuGpiqgjgw01bZYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30ru+lLePwOyS4uvchiCqk6eSxy4Oc0C9zDO72tKQss=;
 b=sESwpvZrGW0hJ/QkSJDIlulWghC4YtdONy5WzbkUYSlyX5m2V8pBYRg8Wwe24R4ZLFhKHj441K/lUROZS5lZ6JgMPBQ8jMz6IBd7YCRv+Pgo56AxYw0ZdO1rVPMFEp0XjhDqznEpjgkM+ee+LI1gNfEEiIVCXCUtKY+GyV+fV8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v2] iommu/vtd: fix address translation for superpages
Date: Wed, 24 May 2023 17:22:08 +0200
Message-Id: <20230524152208.18302-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0164.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::32) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|LV8PR03MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: 630431e9-139c-4744-e7ce-08db5c6aa874
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8nzlfNSFzuxVyZ+QAUUm6PXy1flwqXjDF767tDZAy8L2kYY85+r/M9BIjzB5hFycOsxfLB9qvkCeFbk7kz7aYjhN7z4h5U7ESAc5yAX9fQpeeNHRFWGjpCM+bPRm5E/Prr7GZoqsEuW9FSxRox58jbFvlyvk5gGwhSe9kXAg6viJQGiwAqBFw8kNIRldqF+Ugjn6ZCkvGPRM4okAbF/y9SjVCgmsdjvxI+VX7vzJ1ZbnHuTIUwgtFJ05QVjtW8hBMggvYkNLe430DTeKs67bc4M5TjZrG+dif8YZFfpxJvxBQyFoDbb3J1ruHLor6u6IN0ZjvQEk5Ol7tUunyRENqbR9EpSOUAFmYMtbEfaDn0gqeLZV6JeUJijb8Lp1m0L/Fq7Vmz5UifxL+MmqG5rd3ffr+nAqDNAygZnEVtQiintJ3JTeDEY/Bq9+DeLQflA33H1z9LbNuM9ve/R2e8q0em59cdSbelmi7zr8jduvNjUVV0+hTIGPIHo3OqGEhPt++TdYCBxj3Va5ZZsJ9lyAL1DVRHhA8cq9zM5p+irx3gu1GdlU0BcaTJ7vlbsd5fBq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199021)(41300700001)(66556008)(66476007)(66946007)(2906002)(26005)(186003)(6916009)(1076003)(478600001)(6486002)(6666004)(4326008)(316002)(5660300002)(54906003)(6512007)(8676002)(8936002)(36756003)(2616005)(6506007)(83380400001)(86362001)(82960400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWZIR3ljRExVdUtuaDFmeEJ6Z2o5WXNYMVVQUWFQa1M2aSszcWh1dklSK0JY?=
 =?utf-8?B?TlQ1VTEzQ2lFU2h6RkZqbnVYT3M4aWlIZjRQWSt3RVkvY0dWNlVBVjBSMXF0?=
 =?utf-8?B?VGtjSWZDSnU2MEtScXAzT0hZZk92N1VXTitjaEhXbzJyWXN4TE5GM3d1dFJP?=
 =?utf-8?B?QjIyZHN5Yk5DUHlyQzRkcmIwaEZ2ZWlUYUVVUGw1TFBwb0E1TzlDWEhMZVN6?=
 =?utf-8?B?ODlyVjhReUZOTWZpWGwxSXo3TjRNVGJHek93a3Y1WnUwQ0VQUTNIV2wyYkFM?=
 =?utf-8?B?eHdVWU85MHpuTkU3aXZqYUhxNFNCWFNJNGx0R2prNk9KSExtRkxCQmdQZlJx?=
 =?utf-8?B?aEJOY1dxU21saDRJbU00RmtaYUFBK25HeWFuRllySEgxeEh3Ry9KcUtHb3RM?=
 =?utf-8?B?WDljV0o3ME1HRWRXOVZLanRFSk9MUGY1YmIvZkl0ZE5WWUNjVVZCRFV6czFq?=
 =?utf-8?B?RGtORk1UcktLMkQ3YzlScTZtNmU2a3dqR0IxV1lSYWVyemUyZmhHeXBMNVFy?=
 =?utf-8?B?dGQ1c29LVllrVGlEekFCTXhpbDhWZmFaaEIxSkdaMG4vdXlhbld3bXpHZ1Rh?=
 =?utf-8?B?WkVLTWdtcDFTSzFDc3hzQlFaUnJYbjVLZm9rSFEwRjFqTUJ4dmhxUzZERkZP?=
 =?utf-8?B?RlVEMzBRSVZxK0k5VFY2VytPMHdzcHNDQUxndUVKZVQyWnFXaEVDWkgzQnRj?=
 =?utf-8?B?ek8yVGFTVTRqNkZ5VFo4OXM4d0ViVEd0NlI2M0RyWGRsc3JEV3FjTnlxdksz?=
 =?utf-8?B?S1ZER2h4Zm0zWUdlcGZUQlNmVGJIVVl6WXF5MzdBdy92WE5UYnJTMmlRSS9E?=
 =?utf-8?B?N0k5VkpEVlZoSnNDbUY3WWNGTzhTVFF4QXh2cDFtRVlrSUwzZ09tRUN1SkVz?=
 =?utf-8?B?WkZDTW9WajBZcHFoYS9zTWxST1JBVVk3RjgzQWVQSDRIVkxRWG1JSC94S2V5?=
 =?utf-8?B?VWpJcXBIMC81c0N0SWhuVEdWanpWZldjVDRPcFBUQ1h0bWRWSEk5cGc1WFpM?=
 =?utf-8?B?Ri9hSFVxVWxMWlhUcU9JcEZOaW1QckRDNE9nOFZsSm9zU1ZVQ1BNYkNUSnJj?=
 =?utf-8?B?bWo5Y2YrQktiYWgyWmNuaHIwcVFCd2pGVHhFTkNSYzRsaHFIRnVZMG43My9O?=
 =?utf-8?B?bWJ6VWNFQk01MEdEaDFJMCtkdVZhakxjbEptS3NiWXN0ZFZvV0NMNGgwQTlt?=
 =?utf-8?B?c24xYXpMRHd1MHpWOVNyNXZSeGYxNDhoN0l0U2RhemJaUFh6bnNUaEc2T0N1?=
 =?utf-8?B?bGVRejBjMmdJZkxTZHNia3N0anU1K09WRkg3eW1vcUF6cEp1Um5LbUQwem9K?=
 =?utf-8?B?YUMrQjZnYWdnK0JESzZQQVVYLytkV25FUUx6Nm1UUktGN1d3ZmxicVlEeEZN?=
 =?utf-8?B?YkdwQk53R2U1ZmNwVUlBdzlHRER1ODZxQWdlSXlpZks1eG11WlRvK3Y1Nm9v?=
 =?utf-8?B?aW9CaUZpM3Y0L1ZocFhXMHhuZkVQQ01Pc2MxRlI2RncvTmhERGtvVHd2c3BN?=
 =?utf-8?B?SWVBQmlWajljOUgvOUpaT29rZkR1TVkzN3Y1ZFB5RmxBZldkUFJYVUV5VDR3?=
 =?utf-8?B?UmRmN0hlK1V6dy9MQjVoL0NydmJzWjNndnI5dTl6ZUpMTndUeFNpUTZVUTVi?=
 =?utf-8?B?S1IrbFRIYmFEeFFzOVR2K29DZFFjZm5NMURXMCtFV2hrU3AyV2Fnbmh5Wklw?=
 =?utf-8?B?eDJOUE1XZFNhTFN3ZEh0Q2dQcThHSDV1eXJyWDF5R1JwdjF2bjJ6MHV2ZGlt?=
 =?utf-8?B?ekNNc2FkMVdRNFl5cDhTdWlidFA2T3dRby9CWG81YlRyb1A3UkZlN01ybkgx?=
 =?utf-8?B?WEZJYlRpM2VtcDdZM1dtN1NoZmhid2NFK1VOTUJwV3VkVE1KSjlRbFJUTHJu?=
 =?utf-8?B?RG0vTEJzdzNIZW53ZlV1a1p5UnJtMFN4MjJWTmRIbUxaSTZYcFY1RFpTdU9t?=
 =?utf-8?B?V3NjR3RWS2cxOG0zeWMwMzdQcjgvSWFZMlBzMVVTRGxJWUxwSVhxNTBmNUt5?=
 =?utf-8?B?amFFZzJLblJWSFFuY2Z3TWVsZDhGb3BsS1R3a1J2ZTgvMnRmL2M0UTArSjdV?=
 =?utf-8?B?MW9LWGxmaE9tcE9UOXExSGFUQS9nWHl4MzVPRklaZVFTN2VzWWRFMU9wL2kx?=
 =?utf-8?Q?qA684X8imkm78sA3/VUsuM0b/?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6/SI3eXurq9bb04URCGQkumCu1k394xGBtF5jz1eZdnfKuOs393aJ0bwuGoYHJf4SLXiUpqegbZS7YfOQKmLynSyLN4sR+KKFH6EnHHNgml5kCVXGI2RjCWAfl05jfkpZxmOrZsUl76CdbsEqZPPS7KIAVmrc2eAujYEWmMrlrRGimjGqc3wR7LDsfTTQwcLROiHTSozYBKrBx+jy4N8h6aNrLOhlKjzqF0cmcKfbMNUccUpqrRkNkCdP8CcjXDuUQy+LsbWGJtKKwrlHDS8ob2hIX4ExFrBsoZuu71qVtqNHFiyfzxpeCnXhp/CGugHlh2+5IjhhlXknz4UzbssaRo3euSmCeZRztvDx/8cWNaiKe9p7qppZ1xRbDRRX0b30Z3LNsXuUh1I5t21VdzQ2XNvMl5ck5fqeOQPUQluvT9q12puqOIRcFuHxNNbmFMj4FYTw4FnJye92FzlzAcNWeZDnHSMltAy2UMzwUGiNPnHZcydDTgnzB3pv/pUJ47X81YhqgYvswsibgmmD+6mDWL3/Ji1NpWw97M0jHMdNH7e2D2cPUhnVx/BXYNx2SMVZ8zj6EpR2PVJlZJYWAD4VMhDwahGbmEGqm6PFjYUN41pcc+3Au2yJhbv1kQHN5InxHcjeaCh+PyY+sZxD1RHSrizyU4oxDilimi6RxtQCR8qwimB6UvLF2aoJc0eZAbub1s+gpcf+maEa4nsJSQHd/Uo6tw6VvsfOcWN1tD/IuKPEwqsIubLlEva02/en4k2yGAAMF2y75AR1xUEnAIJXOcxOuqH+qs5gRuvljAEFXWnjW/62yS+ictxY/lMryMk
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 630431e9-139c-4744-e7ce-08db5c6aa874
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 15:22:16.7951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oL4qMSaMqmiyC9Hz10RY+d4KKmWzGImBeiDwY+nze1xuNYnw1Hz7fwuhhKHIQMbfu3mOfa11RN+DatGWR9JjJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7472

When translating an address that falls inside of a superpage in the
IOMMU page tables the fetching of the PTE value wasn't masking of the
contiguous related data, which caused the returned data to be
corrupt as it would contain bits that the caller would interpret as
part of the address.

Fix this by masking off the contiguous bits.

Fixes: c71e55501a61 ('VT-d: have callers specify the target level for page table walks')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Return all the PTE bits except for the contiguous count ones.
---
 xen/drivers/passthrough/vtd/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 130a159cde07..d7ba9a9c349f 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -368,7 +368,7 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
                  * with the address adjusted to account for the residual of
                  * the walk.
                  */
-                pte_maddr = pte->val +
+                pte_maddr = (pte->val & ~DMA_PTE_CONTIG_MASK) +
                     (addr & ((1UL << level_to_offset_bits(level)) - 1) &
                      PAGE_MASK);
                 if ( !target )
-- 
2.40.0


