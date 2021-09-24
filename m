Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E79417700
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 16:45:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195426.348117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTmSE-00031W-QE; Fri, 24 Sep 2021 14:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195426.348117; Fri, 24 Sep 2021 14:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTmSE-0002yC-MX; Fri, 24 Sep 2021 14:45:34 +0000
Received: by outflank-mailman (input) for mailman id 195426;
 Fri, 24 Sep 2021 14:45:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N27y=OO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mTmSC-0002y6-B9
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 14:45:32 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a73b4ed-7b95-4807-946e-b48f7cc2af13;
 Fri, 24 Sep 2021 14:45:30 +0000 (UTC)
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
X-Inumbo-ID: 9a73b4ed-7b95-4807-946e-b48f7cc2af13
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632494730;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=AJ5YqHnRCrIpw6uryiaWZ6V6v3mtHei2MaDKjURtxGA=;
  b=aqEMr0tye7lGyngd4tw4pnpO8QCDikEd70OLUUSzdgjRpQU8iJmVgvFo
   Ws3PwxPeS9NHQWKRxHdfWYfseu23NAyUnb7obckeaBvqRUWckTXzsHBf2
   /spwj5U0VVnwlAJ4KbOGEMY/8koM+lPBqywHQRp0CoWsbikIclaBI3gkP
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZcmUGWPcInpnDb5NUTQf0gL/MaC0R3+gLOrMSIs6rHQK05QjoI4aysboCC2jk4Q6GA9CnTYQZ+
 3YYv3PU2tnUE2TPN3zdGdefVvN1R4JPpqabd+uKIWc8ywPgWgeGupNRn0/5JT6oJvILngC+Y65
 SnFYm4krubZG0FIxh+VwTEjZ/ss2aB9e65mZeH/HDgRGAiGimjnrjX5t9CNfiWieRcxdbFWdYm
 7JY61tZml2lnoZAdCcp6ctLBCRlJkfIcm6f5QMBPQgNgY+iMAE3hix0nyCqsDItUzES1upa+n4
 loHbsP91JdeA/3bmzc1CDIKx
X-SBRS: 5.1
X-MesageID: 53541331
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:7M/Y9q+TZQLkypaVWYdBDrUDcXmTJUtcMsCJ2f8bNWPcYEJGY0x3x
 mZLWWnSOP+JazeheopyYIq08hlV65bUyddlTAJlqig8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGGeIdA970Ug6w79j3tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhy9
 PxEjd+Ccj0sJ4TPvLwWWRlTFgZhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFh2ps35sVRJ4yY
 eIaaxxdYFPxTyZPK1MMJZgOzMazhSjwJmgwRFW9+vNsvjm7IBZK+KDkLd79atGMA8JPkS6wp
 W/Y/mK/HhATMvSezyaI9jSngeqntSHxVZ8WFba43uV3m1DVzWsWYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQnZKflkdCAZwKSbR8sVzTjPqPi+qEOoQaZj19QdUe9/0Nfzkz/
 1ytx9jjBTdql6LAHBpx6YyohT+1PCEUK0oLaikFURYJ7rHfnW0jsv7cZo08S/Pv0LUZDRm1m
 mrT/XVi3t3/mOZWj/3TwLzRv967SnElpCYO7wPLVyqO6gpjbeZJjKT5tACGtZ6swGufJ2RtX
 UToeeDCsIji7rnXzURhpdnh+pnzvJ5p1xWG3TZS82EJrWjFxpJaVdk4DMtCDEloKN0YXjTif
 VXevwhcjLcKYiDwMfUtPt3sV5hwpUQFKTgDfqqPBjapSsItHDJrAQk0PRLAt4wTuBJEfV4D1
 WezLp/3UCdy5VVPxzuqXeYNuYLHNQhkrV4/savTlkz9uZLHPSb9Ye5cbDOmM7BohIvZ8V692
 4sOaKO3J+B3DbSWjt//qtVIczjn7BETWPjLliCgXrTYf1U6SD1/Ua+5LHFIU9UNopm5X9zgp
 xmVckRZ1ED+lTvALwCLYWpkc7ThQdB0qndTAMDmFQzzs5T6SYrwvqoZabUterwrqL5qwfJuF
 qFXcMScGPVfDD/A/m1FP5X6qYVjcjWthB6PYHX5MGRuIcY4Slyb4MLgcyvu6DIKUni9u/whr
 uDyzQjcW5cCGVhvVZ6EdPK1wlqtlnEBg+YuDVDQK9xedRy0oohnIiD8lNEtJMQIJUmRzzeWz
 V/OUxwZufPMs8k+99yQ3fKIqIKgEu1fGEtGHjaEsebqZHeCpmf6mN1OSueFezzZRVjYwqT6a
 LUH1ez4Pd0GgE1O79h2HYF0wP9s/NDovbJbkFhpRS2Zc1SxB7p8CXCaxs0T5LZVz7pUtAbqC
 EKC/t5WZeeANM//SQNDIQMkaqKI1O0OmymU5vMweR2o6Chy9buBcENTIxjT13ANcOoraNsok
 bU7pcobyw2jkR57YN+Jgxdd+3mIMnFdAb4ssYsXAdOzhwcmor2YjUcw1sMiDEmzVuhx
IronPort-HdrOrdr: A9a23:ymFZAagHz88wOmsiu6zXedEsOXBQX0513DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmsk6KdxbNhQItKPTOWwldASbsC0WKM+UyEJ8STzJ846U
 4kSdkDNDSSNykKsS+Z2njBLz9I+rDum8rE9ISurQYccegpUdAa0+4QMHfkLqQcfng+OXNWLu
 v62iIRzADQBkj/I/7LSkXsGIP41qn2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbdz9U278t/U
 XMjgS8v8yYwr+G4y6Z81WWw4VdmdPnxNcGLMuQivINIjGprgqzfoxuV5CLoThwiuCy71QBls
 XKvn4bTotOwkKUWlvwjQrm2gHm3jprw3j+yWWAiX+mmsD9TCJSMbsLuatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBDjCOP0DkfuN9Wq0YafZoVabdXo4Ba1lhSCo08ECXz751iOP
 VyDfvb+O1dfTqhHjDkV1FUsZmRt0kIb1O7qhBogL3T79EWpgE586Ig/r1cop9an6hNDaWt5I
 z/Q+xVff91P5YrhQ8UPpZ3fSKNMB2+ffv7ChPaHb3WLtB1B5vzke+D3FwU3pDhRHVa9up+pH
 z+OGkow1LaPXieUfGz4A==
X-IronPort-AV: E=Sophos;i="5.85,320,1624334400"; 
   d="scan'208";a="53541331"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESjf9uV81iq9sG523Ttlli6B43SRoVYawd0tTwjkzEcRPTPSi8BInrjqa543TTNsxhfVqxvGdrS1XRGiQX4Nnj7gQPkv+9NEwieiYzo0Z1l5WWffj2AERIsq9y4rGAcTnHhbCTgxTe5ZGT2yHHYc6/DXeObCZcgPsnBH1gAclmzt/pOeg9q4yFZfjRXknTnSQe+nZI+sD0F87g+3RRbQJp9PSHg33vVXqoGqMEyKtT47zLLdC6BGA7/XhTH9Z08JjGiPJbl+hIxnvP0gb1O9VIYazj8K5/k/2IbOBzOOzL4q58IlZAQA90fW1AbGwuZuU2sbERq83UH0QULbA0CUyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=dDQWpOYS7KFKCF6NT5OFbYwfuoN6iff1ZjYEVf9qt2s=;
 b=F9+660ItLvAM4WcUuClnAHbv/NDbGOY7BKqfX7HI1KgTAAoE9pKAaE9/gxR3BBjCFYnQUYdM46nbatAUcWzaGTBYeMcNbPzGZCyCuMnAN97pnw069XgXpgnNwsKnNHVfVqdhP0ZDk56Kk4oOf6ej6Aoifvk4tVnvewLOf8TGeYRM9wRAIh+xFJmvJZMTgaaXHOCDkL2n0qHXAI6ztmE71rgK/clK9Hz+y3OZO5z7oelHqfXuJeyxJ5CEJxjumGzACz5YggyLyhBfAhEzjy7xWlHBE9oZjNzsFsQC/PbnH+XvEEgix/8nPV2jb0uy+SESoareGYt49mm6amD7SeNcng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDQWpOYS7KFKCF6NT5OFbYwfuoN6iff1ZjYEVf9qt2s=;
 b=MGfSce8VPN8SbXqzr548EcZUxR1ZYnBShbAdF9GQQpU+XO3Lt56G7E6AVJ41qj8E7ywDAG+ez44ZUOxGZOC2EpOJ1tAzKMI7bUenS+U4ud1Tq/CZm5gOAp+P9oB5z7TVbCX83OAIzzTXLSsBCp7ZsOr7fpOdgbI/g2tNKWpyeWk=
Date: Fri, 24 Sep 2021 16:45:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Kevin Tian
	<kevin.tian@intel.com>
Subject: Re: [PATCH v2 02/18] VT-d: have callers specify the target level for
 page table walks
Message-ID: <YU3kedkf/mSsGcpD@MacBook-Air-de-Roger.local>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <6d01a401-ac53-d4ca-e0ac-165d045341af@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6d01a401-ac53-d4ca-e0ac-165d045341af@suse.com>
X-ClientProxiedBy: LO4P265CA0028.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3af6e8ed-0385-40a6-0bee-08d97f69edc9
X-MS-TrafficTypeDiagnostic: DM6PR03MB5322:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5322D00597944380D4B668898FA49@DM6PR03MB5322.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UEfZwjSEwgxI5sZXe3r4LWEFBCU4WqcjvMOj/5A8LVEI2y9wrX7x84uYVRarbkycvvumsHrWoI/zmTIVNliEmpH5PHJSWgc9hbRnDUox3OxsKpSm6DnkVjslCAfXlmTg6G3zPoqzMU1OsEump4+QD4aPzi5j7ay/aczeKdGv97YIT5TKShWVEJrgOyd2njhMVoskW96C8Am3fqBvimVVtRYUfAKko0rHnSsAWrSo1Y5fYrYXJD/K3Ps8fwRzCRKNCjjmnKMtFYtbhbIHHLYlKECIVPbTlPimqoNKuXez6Y6qSBLse3IxgYFhwveBCWe/2GQnJx6Q8AezJ3LX7QLsW8S8NsFY57yianXPcBB3RlKjwfwVokzFH5JkiyjrSP6RnCV2AS1eP7QHC4Sy29LVeGq+hlElt/Hy0N4kbgtLD03FfBXVd2IcN+uu+K6XXAz9xeX/EmjgvKcEjIYvLRpN9LHGdsq2RW0RMHhqz6q5s6rH+u2WGRV7Q93/iZ5jaE/NGXl/npRW1L4b1gEamel9FTtNl+VjQFprzMYVQIeURL8P3YQ3eQtEWH1GF3gqWgZ5BxooobxAe5VUrbG3nN/LsqtGVoItXJ2Vzk2VeNSzUGXSKSA8t5fp+UbidZLnJacVMeYoOfP0HHLzlPyJg1BLCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(38100700002)(83380400001)(66556008)(8676002)(316002)(508600001)(85182001)(86362001)(4326008)(9686003)(66946007)(66476007)(6496006)(26005)(186003)(2906002)(956004)(6486002)(6916009)(6666004)(54906003)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFdDWElNUUtwTDdBVnFRYS9oMkJSZDNQSnMvZmI2cTNVTEpKcnpWRisxaDRk?=
 =?utf-8?B?ZHArRmZyMjcvd0VVYmdJdkNtMStDQTNXTXFyUzdJanVMRFBnTGNXcjY3QXdI?=
 =?utf-8?B?NU9GZWpFSm4rR0I4Rm94MzZXeFRvbjdWcnVGVy9PcXdvbkljTGpsYllzczd6?=
 =?utf-8?B?NnVybGJ0TXNjS1RGZ2NoQ3YwY2p2TVJNVkJzTkYxZGRmTy9mSkJpZVErd0FU?=
 =?utf-8?B?Zndzb2h3YzUraXp4dGlXMkNWVTh0NlE3U3lDRXRLY21XVnFMQk9rWlQ3SEty?=
 =?utf-8?B?dFp1RzRqaCtNOGlkWXgvWHYra2hsZ044MWIvMExJTUltUHp1RGxGdkxRcTZC?=
 =?utf-8?B?ODBaL21MbndUaWJZcCtnYmowVXdSSE04VTBMbUUrMGV6NnI0ZE9QSDJFWWlO?=
 =?utf-8?B?ZWtMaktZYjZiK1VnMFdKWk9Pc3F3M1FncTZPdTlDUEgrZHIzV0ZLSCttVWlt?=
 =?utf-8?B?dkZlZ0l1cnJXdTBRYk8vNVBla0dyYmFrWGFVRVJGRHZ3RUkvOXpqb3JWdmVu?=
 =?utf-8?B?cTJrUHgzTVFMWVBuS1ZSMHJISm0zcHRmcWFqNWNtcXk2SVQ3SXVQQi93NE1E?=
 =?utf-8?B?eUp2R0JZOVIrbGhPQWNOM2c3MUxFRGp0SkZBMzN5WkVJc3I3cWFOUWUyMHFX?=
 =?utf-8?B?cTRWR2pMeENJVW9GWS9jZ1VoUmZwVWZaTysyNjU4Z0x3WVdRQmhkTkRYeEc2?=
 =?utf-8?B?MU1KTG56Uy9kSVFQRGU1TDlJbDBDVHIzM0EzN212WmlJdmhlanpqdEFBanhG?=
 =?utf-8?B?c21FeW9OTkdmQ1I3azdSUjRGcDRBVWg5STJhMDBZdElENHFEMEFNc0pZWUhM?=
 =?utf-8?B?c0FLak9pNDBGQSt0WStUZzE4YVJqWjJZblRTS1lreC9TNkVrK1l5NXhoaEhq?=
 =?utf-8?B?Y0QyQ2EzUWpWVTFEdlZ1WUFrWU5nUWdmYVBLTHkzM3J5UjNidjExWTlVNCsz?=
 =?utf-8?B?L3Fodm1DWFAweXU4N05pTXVHTzlCT0E2Z0QyOWVNd1BrWnIyNE1pVno4K3BM?=
 =?utf-8?B?azczcHhFZkNVeXJZdEJlUWlrRk1UWFJqeHVHd3p4cUxuVExsa0o5Q2x6OU5L?=
 =?utf-8?B?dzB3ZGxCdzY5YnBYLzFhc1JyMm1hMVdQVUZCTVRobXNrOU9HT1JMZ0xvcFJW?=
 =?utf-8?B?dFBsM1VJODdScms4NG9keGQ3eHAyWFl0cndZWjFWZitLUEhGNlZIWGt2a083?=
 =?utf-8?B?emhmaGdaRTd6Ris1THBTR2V2TklvNkVXeUJDckV4dzZBdWJnNitXQnRUK1lz?=
 =?utf-8?B?alJxRjhCOVVuSFZhQTdwU2xLSllIRGhpdHZsRko4YW9EOU1BZ3JmV09zQ2t6?=
 =?utf-8?B?bG5BN2ZYS0hFYjhjdnZGaXhkaEhPTUJ6V1hyTzM4TXVyYmFQUUI5RnZEejB3?=
 =?utf-8?B?K09QdmFQVVNpUlAxWjlRbStzMGgydE5zV2RlY0k0SThSQnoyZy9QQTN4bFJX?=
 =?utf-8?B?TzBUdzh2K29IK3FMUXYrTHB3bi9UZGNaaWpPdEFMQTZSMlJ4bEVIRS8rUzlL?=
 =?utf-8?B?bTJGS2FQaUZ4YXB2dHZLTE52ZnM4NUxJa1h4bENWSzFYOWFTYXQraVQyTmpQ?=
 =?utf-8?B?a0ZEZVhKV1F2cUFFVmc2QmhvY25xWXVsbHhPNnRDWEhqRDBWVHovV29nTFhO?=
 =?utf-8?B?MUxmdFloeEprU204K2Q0WWJLSjg5bnhMQm1tSmdXQjZPTE1PamNrblNaWUFm?=
 =?utf-8?B?TmpoclBjVm9xREV0RmplemdSQUhzcVROUFMyejFlU3BicHdQVVJIdEVnOWdk?=
 =?utf-8?Q?59XHDe3Skhu/JlZsgTwjwRjkMQAmOreyfkdB6Xn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af6e8ed-0385-40a6-0bee-08d97f69edc9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 14:45:18.8619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gPSTnePVwbTWtrZ+Fh7vz+HT48M3DusVy5R7GPXDrV8iMMQAMtQ+VJf5jpU6fhh4Cb4DKTbDXFmeD+SAw7+x7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5322
X-OriginatorOrg: citrix.com

On Fri, Sep 24, 2021 at 11:42:13AM +0200, Jan Beulich wrote:
> In order to be able to insert/remove super-pages we need to allow
> callers of the walking function to specify at which point to stop the
> walk.
> 
> For intel_iommu_lookup_page() integrate the last level access into
> the main walking function.
> 
> dma_pte_clear_one() gets only partly adjusted for now: Error handling
> and order parameter get put in place, but the order parameter remains
> ignored (just like intel_iommu_map_page()'s order part of the flags).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I have to admit that I don't understand why domain_pgd_maddr() wants to
> populate all page table levels for DFN 0.

I think it would be enough to create up to the level requested by the
caller?

Seems like a lazy way to always assert that the level requested by the
caller would be present.

> 
> I was actually wondering whether it wouldn't make sense to integrate
> dma_pte_clear_one() into its only caller intel_iommu_unmap_page(), for
> better symmetry with intel_iommu_map_page().
> ---
> v2: Fix build.
> 
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -264,63 +264,116 @@ static u64 bus_to_context_maddr(struct v
>      return maddr;
>  }
>  
> -static u64 addr_to_dma_page_maddr(struct domain *domain, u64 addr, int alloc)
> +/*
> + * This function walks (and if requested allocates) page tables to the
> + * designated target level. It returns
> + * - 0 when a non-present entry was encountered and no allocation was
> + *   requested,
> + * - a small positive value (the level, i.e. below PAGE_SIZE) upon allocation
> + *   failure,
> + * - for target > 0 the address of the page table holding the leaf PTE for
                          ^ physical

I think it's clearer, as the return type could be ambiguous.

> + *   the requested address,
> + * - for target == 0 the full PTE.

Could this create confusion if for example one PTE maps physical page
0? As the caller when getting back a full PTE with address 0 and some of
the low bits set could interpret the result as an error.

I think we already had this discussion on other occasions, but I would
rather add a parameter to be used as a return placeholder (ie: a
*dma_pte maybe?) and use the function return value just for errors
because IMO it's clearer, but I know you don't usually like this
approach, so I'm not going to insist.

> + */
> +static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
> +                                       unsigned int target,
> +                                       unsigned int *flush_flags, bool alloc)
>  {
>      struct domain_iommu *hd = dom_iommu(domain);
>      int addr_width = agaw_to_width(hd->arch.vtd.agaw);
>      struct dma_pte *parent, *pte = NULL;
> -    int level = agaw_to_level(hd->arch.vtd.agaw);
> -    int offset;
> +    unsigned int level = agaw_to_level(hd->arch.vtd.agaw), offset;
>      u64 pte_maddr = 0;
>  
>      addr &= (((u64)1) << addr_width) - 1;
>      ASSERT(spin_is_locked(&hd->arch.mapping_lock));
> +    ASSERT(target || !alloc);

Might be better to use an if with ASSERT_UNREACHABLE and return an
error? (ie: level itself?)

> +
>      if ( !hd->arch.vtd.pgd_maddr )
>      {
>          struct page_info *pg;
>  
> -        if ( !alloc || !(pg = iommu_alloc_pgtable(domain)) )
> +        if ( !alloc )
> +            goto out;
> +
> +        pte_maddr = level;
> +        if ( !(pg = iommu_alloc_pgtable(domain)) )
>              goto out;
>  
>          hd->arch.vtd.pgd_maddr = page_to_maddr(pg);
>      }
>  
> -    parent = (struct dma_pte *)map_vtd_domain_page(hd->arch.vtd.pgd_maddr);
> -    while ( level > 1 )
> +    pte_maddr = hd->arch.vtd.pgd_maddr;
> +    parent = map_vtd_domain_page(pte_maddr);
> +    while ( level > target )
>      {
>          offset = address_level_offset(addr, level);
>          pte = &parent[offset];
>  
>          pte_maddr = dma_pte_addr(*pte);
> -        if ( !pte_maddr )
> +        if ( !dma_pte_present(*pte) || (level > 1 && dma_pte_superpage(*pte)) )
>          {
>              struct page_info *pg;
> +            /*
> +             * Higher level tables always set r/w, last level page table
> +             * controls read/write.
> +             */
> +            struct dma_pte new_pte = { DMA_PTE_PROT };
>  
>              if ( !alloc )
> -                break;
> +            {
> +                pte_maddr = 0;
> +                if ( !dma_pte_present(*pte) )
> +                    break;
> +
> +                /*
> +                 * When the leaf entry was requested, pass back the full PTE,
> +                 * with the address adjusted to account for the residual of
> +                 * the walk.
> +                 */
> +                pte_maddr = pte->val +

Wouldn't it be better to use dma_pte_addr(*pte) rather than accessing
pte->val, and then you could drop the PAGE_MASK?

Or is the addr parameter not guaranteed to be page aligned?

> +                    (addr & ((1UL << level_to_offset_bits(level)) - 1) &
> +                     PAGE_MASK);
> +                if ( !target )
> +                    break;

I'm confused by the conditional break here, why would you calculate
pte_maddr unconditionally to get overwritten just the line below if
target != 0?

Thanks, Roger.

