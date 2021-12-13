Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDC04730ED
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 16:52:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246208.424633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwncD-0007jy-AV; Mon, 13 Dec 2021 15:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246208.424633; Mon, 13 Dec 2021 15:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwncD-0007hO-5T; Mon, 13 Dec 2021 15:51:49 +0000
Received: by outflank-mailman (input) for mailman id 246208;
 Mon, 13 Dec 2021 15:51:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0LF=Q6=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mwncB-0007hI-Kp
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 15:51:47 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 922b16f0-5c2c-11ec-85d3-df6b77346a89;
 Mon, 13 Dec 2021 16:51:46 +0100 (CET)
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
X-Inumbo-ID: 922b16f0-5c2c-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639410706;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=FVKEPeD0WZRvlkYcWYGtMDmimSlGJxxTn2VKPlnOXq8=;
  b=Htfep2EFeJCJI1uBz6RLYjmNYdoZHd4WhVu8YQhQ8fLNzA46BvQVGfP1
   pbATxDEbGVaMLcE4VHG32ryrJMeq+dGV0oV+USUksL4VtvDSJbE048i4K
   KOsp4JIcozkqmmAV8ovMirkXufITBJ2vFjLQgZ3D2qoVa09O/babt1+xP
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jrjN9x6CqAywrHgLCyHowJbKTVOEOpCY0auf1MYuibXBhJecWr8u5v80uhVK4lbX5VZIM5LCTB
 hxUVQqOt9tNP0s34HtaE47yAEjckWP5egzU+V7YYvHIaxYlIsW6fsyfC2DZ5QxeiJej615YSyC
 qM07KQWoizBSS5MnxRaLK/gmepdpwGhSLGcOFveNN/LGQnrmK32ZrwkvN0Z670sc5hV8UXPZrj
 YxmSgfJHWZk4b56hohgiHs7nWEpKttBYNGEo9h9YewCH0Y9JmF7N7mDGocUnCZJ3uLQde1Fcs3
 HaoLZfE4t9t5iLDdLmMTu0WA
X-SBRS: 5.1
X-MesageID: 59401221
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:VHEalq65db8p5Im4e9HLHgxRtNvAchMFZxGqfqrLsTDasY5as4F+v
 jEXWW7UOf2IZWqhfo1yPYS29xhU6JGHzYdmTApurStgHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wrdj29Uw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z+
 dt2766IESkQGbTFg9xGWhNiCDhcFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgWZs3pkUR6+2i
 8wxVWMoRUzeWRZ1B0YwLY5ix/mUr2KlWmgNwL6SjfVuuDWCpOBr65D1OcfRUsyHQ4NShEnwj
 mHL4WX/RA0bPdq3yDyZ/3bqjejK9Qv5Uo8PELyz9tZxnUaegGcUDXU+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yENopTZFBYAWSbdjrljQlOyEuG51G1ToUBZwZud8hvduawUNz
 1aSp4jgDwZ0qZ+8HCf1GqivkRu+Pi0cLGknbCACTBcY79SLnLzfni4jXf44Tvfr04Sd9SXYh
 mnT8XNg3+l7Ydsjjv3jpTj6bySQSo8lp+LfziHeRSqb4wxwf+ZJjKT4uAGAvZ6swGt0J2RtX
 UToeeDDtYji7rnXzURhpdnh+5nzuJ643MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK51gAv8QPbCb3PfQuC25UNyjN5fK/fekJq9iONoYeCnSPXFHvEN5Sib64gDm2zRlEfVAXM
 paHa8e8ZUv2+ow8pAdas9w1iOdxrghnnDu7bcmik3yPjOvGDFbIGOxtGAbfMYgEAFas/Vy9H
 yB3bJDRlX2ykYTWP0HqzGLkBQxQcCVgW8mp85c/myzqClMOJVzNwsT5mNsJU4dkg75UhqHP+
 HS8UVVf013xmTvMLgDiV5ypQO+HsU9XoS1pMCoyE0yv3nR/M4+j4L1GL8k8fKU99fwlxvlxF
 qFXd8KFC/VJazLG5zVCMsWt8N08LEym1VCUIi6oQDkjZJo8FQbHzcDpI1n0/y4UAyvp6cZn+
 ++81hnWSIYoThh5CJqEc+qmyl685CBPmO97U0bSDMNUfUHgrNpjJyDr16dlKMAQMxTTgDCd0
 l/OUxsfoODMpa4z8cXI2v/Y/9v4TbMmExMDTWfB7LuwOS3LxUaZwNdNALSSYDTQdGLo46H+N
 +9b+O7xba8cl1FQvosiT7sylfAi58HirqNxxxh/GCmZdEyiD75tLyXU3cRLsaERlLZVtRHvB
 xCK89hef76IJNnkABgaIw98NraP0vQdmz/z6/UpIRqluH8rreTfCUgCbQORjCF9LaduNNJ3y
 Ogsj8ca9gijh0d4Kd2BlC1VqzyBI3Fov3/LbX3G7FsHUjYW92w=
IronPort-HdrOrdr: A9a23:Hv7bvqH6Z20eOyzLpLqFcZHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcV2/hrAV7GZmfbUQSTXeNfBOfZsljd8mjFh5NgPM
 RbAtZD4b/LfCFHZK/BiWHSebZQo+VvsprY/ds2p00dMj2CAJsQiTuRZDzrdnGfE2J9dOYE/d
 enl4F6T33KQwVkUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZuzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDk1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo90fLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWy2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ggMCjl3ocXTbqmVQGbgoE2q+bcHEjbXy32DnTqg/blkgS/xxtCvg4lLM92pAZ2yHtycegB2w
 3+CNUZqFh5dL5jUUtMPpZxfSKJMB2/ffvtChPaHb21LtBOB5ryw6SHlYndotvaP6A18A==
X-IronPort-AV: E=Sophos;i="5.88,202,1635220800"; 
   d="scan'208";a="59401221"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D4cTf9F+GuY027waYtED0HPDs7i8zrhuUQZUrKjKFMgZ2+Gn89PjUrubq2D6m4Vn0Uz19117YrKcM1bIAjquFiFCCt6BGoA8tzzOsb5vpEPyiEGN4VbQJyz0fxMZslQzmm7YA9V+bvGCJaS3DZUgRWiEu5FzKtNY03p1NIFB+DCZhHUWvSOgKQTFYlSwvbqV1bGs4Sl/cS4G02C0HbDhgPRk1lZPYum8ClRgpw9iatgOInLg5oQBEWfW3vKUfb1o22NRucJ1oCJ8MpTLbPTz5VjeqaxtSs+tX720OFmzBoyZg5LyfD+wLJ7KKn9fLs8p/BFA0xMPsWvuUry0xx0ciA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VD6L36V87ro49bV4GB8XEnLsmUys6mR5KawDGTsNJ/E=;
 b=npcG3pXHtuzkNvE/H+pwfrodpd26rIlw19oRkp3fiDp6s1Fzzb3LkC44SUX44KwakPTyJFFnMg7+VIH81VVCaIO3Ub2GYZszSLBCeMJ1hFYviqe9LNxvwjn3+CUgpgar51OG/WVzY3HkjJlq5Jg8wvrT1flxnWf+6DjryGrl24T96gp31GyBInbJDe0OWBUhj7P5IVmNkpId0Cs1w0jn4bgoWQR72667OxNOFJ1J1v15Fwn4AVDDkCstdQ4/dJEskwedRJkVTHBJz+6yKfbPQXeGqGqLCsnfK8SqCyjq4RjIJNIFjbo2TwKcpvJ5EHCyDh9kK6ttN+kPzfAJq3oBvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VD6L36V87ro49bV4GB8XEnLsmUys6mR5KawDGTsNJ/E=;
 b=h4l6P72wytkmY1gp6EwmXm2hTEnfZPe8JZsuma1UV/pjzBoF+h1V7Hkul3dSaI0oeIooQmeD4/HtE7uDuU8d+nTOwd2URnu+kZwQ163ZNU2QViwgR8olIX0XLwpXd1ptGY7eBMxjM8YF6spNf7pG8ajdPZEgAFDFIVqtnDxL5KM=
Date: Mon, 13 Dec 2021 16:51:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Kevin Tian
	<kevin.tian@intel.com>
Subject: Re: [PATCH v2 15/18] IOMMU/x86: prefill newly allocate page tables
Message-ID: <YbdsAy0huMXBjJe/@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <2656844d-47cc-70c3-d7ce-7d83967d576e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2656844d-47cc-70c3-d7ce-7d83967d576e@suse.com>
X-ClientProxiedBy: MRXP264CA0003.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: caac669c-8126-46b9-ef00-08d9be5074c2
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DS7PR03MB56082E173BA2FEE1C335002F8F749@DS7PR03MB5608.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sG9sNuNDHOeH0YPb8RNerXG12b3YE6pxOEOL2RtmN4jrBbmrDCsHpOO7ZSC/v+g2f+8bYemrjeynYIo1VpR2emWTi5TOktU9+rPfQfo90oQJHYfLbEWv4NEq/3ncCIjD26lhSPqU3sApjUCxkCIG0sgN6Ng4Gc+hCbWUSp9vAahsATsskJ/Rd5m0xwwkE+Rauplu7fY2dTEEkBye44bxCtCETsTssn5iwCf1ZHKB9gma9oYA6JH+FBTQgLpXpJusu02FzcVi03GP/CLH43wcI6i1zhWYNqbYgjVhr+iWSWLsmvtyFPVH+8p/Wi8Yh1qvkH2XmxlT6kyZfvU1tzoHsZmVcvUGnmYb7HzxJmRKi38CDU+93TWyeuxTFywrqZ1jM8v2jG+ul1dGzKCGKJHFv1vtgwfdQGn5tlRJ2w7ty5mVVNDfAbq7Ek5DkoDc0Y8oVpbU3ilO4AaDgRJPHEE+Un+4ge5WjsDzLSjrM3wmYrJE8aX//rM8exkpFzhM3WGJ4yFi+V/eqe84KDPcbe2/jQw/SvbmzeIJmN0YiHvu1FJWDjmKuV/GKZ0mCEnxJHm8+k0jg4Q6KAd8RTt47CZ1xHk0MASicrU4BUJ/ys4HqXYRekkybvS8Mhsxs1oP68YcIu5EY3Yqo8bSpbF7xN/phQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(4326008)(66476007)(66556008)(66946007)(6666004)(5660300002)(8936002)(26005)(6506007)(6486002)(186003)(38100700002)(6916009)(6512007)(82960400001)(83380400001)(33716001)(86362001)(54906003)(9686003)(316002)(2906002)(85182001)(8676002)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXVFSEJEMEZCaEJaOUV2SDJkWDJKbklHc2hQT2RrRU1ZNGxDZXI3L3ZNcGI4?=
 =?utf-8?B?UDA2VVREN3J5eGpiaUM5ZmZqbmNCSk1lbjZpMU1LaVZsOXNBZkdlVlBjSmkz?=
 =?utf-8?B?NnM1dTVQS2RKUmlUWThkWTBReFk4cWw0dVJhYjhTL0VZSU93OFBJcGNsY0l1?=
 =?utf-8?B?NTJJaThxSnJhV2U3M0pwc0FoNE5uSEJpR3Y4UTArZk9lbHlEdEJoMTV0b29J?=
 =?utf-8?B?RU5XakVsZU5KN1VlcVZpZWdIRE9ENTNPVE12SVBzWkxzNkR1NE9TNldjRTJY?=
 =?utf-8?B?NUhJRzNwVEc5UkZ6RGlJNVd2azMrVE5Cb1RSZUVUZ1oxY3kwMDkwd3RrVldL?=
 =?utf-8?B?cGg4dkpvRnJ6WW5nQnQ0VktVT0ozcEdyM2ZKZ2ZrNWdqVENhU3E0K3IyUGFj?=
 =?utf-8?B?aVlzUFZwWXZDTkJNazllckpRWFZ3N3JTVUlXa0thYkl1YUtOYWUrRkZUeUVx?=
 =?utf-8?B?WnowYUZqRW5RNmRjd0N4dU9LUE5EdWxiYWlEOXJDcHdQRy8wellSS24rUzF0?=
 =?utf-8?B?UVI3NW9UWWZmNjg5VnNlaXphYXVIS3RocXhCUnJkdFFiMGtWU2EyZHJFMHAw?=
 =?utf-8?B?L1lyVGpQdDBKZkQ1QnVENzFmeDVlVEJlNUtRVStzcVBucXVIKzIyMG5pL0VL?=
 =?utf-8?B?V2ZFK0dNSlVaMURFQVB1RTJxZFhKSStVVmNZd3B5N0hSU01UcGtXWWNXTjR5?=
 =?utf-8?B?WGRaZXl1OHQrQWVDWkJuNzg5elduRWNCUmJzL0tQank5WHVQbFJPM241TEV3?=
 =?utf-8?B?czFCQjF5UEdjSDloYitiRmtuNWdWamV4VlE3VFlPSS94YmRLeEJRNUdEZjdV?=
 =?utf-8?B?S3BJZ1IrWUVQRHlTcHpuZGJWVkJ2SVBvV1N2SUFaOXZHdHlmN2dNZy9MODFN?=
 =?utf-8?B?TVFEOVV4WVdRY09YN2xFaWM2MDJiYmdHdkl4d3RFclNCNzZWM1ZUTGZEb3BL?=
 =?utf-8?B?M3hzSFVwQXluTFI3TVNwc3A3aUx3OUhWMWNRb0F0ak5sdXNSMmNra1AvQTdw?=
 =?utf-8?B?NVJodnYzOURmMWNBbmxoZGNGelRFN1J0NER4dUhCS3k1MkFJR0ozTUpDcUwr?=
 =?utf-8?B?WjFCSk9UOVVDQ1V4RGs2Tjd1ODE1YkpYY1piTEpqdWNMcVVZRXAvbnlQTmha?=
 =?utf-8?B?SUlGb2lWOVhtdDBORHpQdnh0NlAzVjM0ZHpBbVlSSW1pUTlJajZKbFF3alYr?=
 =?utf-8?B?WW9rRlRYT2t2M082NEJ6TTVxSHhlaXFLRUdGRkxpdVl3MyttYnpWR0NVTTlh?=
 =?utf-8?B?UTErcnBLL3N6UitvRVQzS3YxVG1LN2JVWU45T3NoN1NMYjV3OGpYSHFVZW53?=
 =?utf-8?B?OXhqK1hLTVNENWJIcUVMblhSd1ZaM252M3NrZlBKOUpxaFRVUG1sNld2bDFZ?=
 =?utf-8?B?czFKMXBOb05VeWdFbEdyZDI4UXBQNWpYSXlDZCtKQmt2VUZXM056TzB1SmZQ?=
 =?utf-8?B?eDZ5ZU9nbkNRWDJiN1k4RDRvU3BONC9INTdrZEQ3QW9HRm45cXhtQUZiMGt3?=
 =?utf-8?B?Z01nQ2FGbWttMUxGbzZOTXVhNzFtc0VSWjRrZVFSY0p5MGg4b2ZyU1Z0YXVB?=
 =?utf-8?B?czIvb2EzQmdUL29NNzNQbjBFUW5WS1NrRVJWeGFYRjVUN2tYQmpidUcyS01J?=
 =?utf-8?B?TTMyV2tLWFlNdlFLUkxJcDVoZXI3bzJ4Nm5XM2U2eW8zR0pmUU02QTlWbnh2?=
 =?utf-8?B?Z3lGZkdiWEhXWFlqWmZ4Yk0vYWpvc0tuUGhGYzk3ODdwSlZsRWhja0J0UGlm?=
 =?utf-8?B?VWVNR1BidDZEeW9zMlRjTkhEWkpZem5rTnpYL2pHNzFQRWI5eHlyMHFic2VK?=
 =?utf-8?B?MmxZNVdvamk3YnozTHlBVWNMcW83a1YrQWtaUy8xUHhsWCt5WTV5RzQ0T2VE?=
 =?utf-8?B?alVMNElyaVdlRnJnMEo2S0Y4UkczeU1PMDNoNjd2QTR3bVNMcGRHV1NRZHVT?=
 =?utf-8?B?NVd2bVRwWnlzakdJWlhsZmR2aVpFaDVGdUozUXNmMGJ0UUZncXpHclkybkdW?=
 =?utf-8?B?TmpJbnI1eEdTMXJFN2hwTFhsWkVLQm04V1hFL0FYM0hOc0RMUjBmV3IxbmV6?=
 =?utf-8?B?dTNDM28vSkpiditoSUx1WTVVNGgzdG1qMElKQXNSdWJxQWpTOVBRcXhIWDhz?=
 =?utf-8?B?ZWJxclEzK0o4ODF5TjFZNEM2OUl6UFM4ZURsVjlyZlhhcHpSK0tDSDkvRE9X?=
 =?utf-8?Q?nosceZvUMbjET8nGE0G54Dk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: caac669c-8126-46b9-ef00-08d9be5074c2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 15:51:41.7190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XVNNlqNAAynvIagJDhpcQM9qzK2pRRmV10yb3rvobB5xgJxc5fmQZqXzhtnjuQ8zNyzvQvtk5wdWNLqsMK+ImQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5608
X-OriginatorOrg: citrix.com

On Fri, Sep 24, 2021 at 11:54:58AM +0200, Jan Beulich wrote:
> Page table are used for two purposes after allocation: They either start
> out all empty, or they get filled to replace a superpage. Subsequently,
> to replace all empty or fully contiguous page tables, contiguous sub-
> regions will be recorded within individual page tables. Install the
> initial set of markers immediately after allocation. Make sure to retain
> these markers when further populating a page table in preparation for it
> to replace a superpage.
> 
> The markers are simply 4-bit fields holding the order value of
> contiguous entries. To demonstrate this, if a page table had just 16
> entries, this would be the initial (fully contiguous) set of markers:
> 
> index  0 1 2 3 4 5 6 7 8 9 A B C D E F
> marker 4 0 1 0 2 0 1 0 3 0 1 0 2 0 1 0
> 
> "Contiguous" here means not only present entries with successively
> increasing MFNs, each one suitably aligned for its slot, but also a
> respective number of all non-present entries.

I'm afraid I'm slightly lost with all this, please bear with me. Is
this just a performance improvement when doing super-page
replacements, or there's more to it?

Thanks, Roger.

