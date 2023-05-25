Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C674710DD1
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 16:01:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539627.840720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2BWj-00010A-Ig; Thu, 25 May 2023 14:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539627.840720; Thu, 25 May 2023 14:01:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2BWj-0000xS-Fq; Thu, 25 May 2023 14:01:13 +0000
Received: by outflank-mailman (input) for mailman id 539627;
 Thu, 25 May 2023 14:01:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/c8s=BO=citrix.com=prvs=5022a0095=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q2BWh-0000xB-Od
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 14:01:11 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98f5d079-fb04-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 16:01:10 +0200 (CEST)
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2023 10:01:03 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BN9PR03MB6106.namprd03.prod.outlook.com (2603:10b6:408:11b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Thu, 25 May
 2023 14:01:00 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 14:01:00 +0000
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
X-Inumbo-ID: 98f5d079-fb04-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685023270;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Lrt0E0ucrqu2Z7oO5HZFoTaczFhtHcQkEXDGHr248hY=;
  b=Q9qugLWpk/LRncp2GgG5Y5WpCZGkZKkKFLBIri4vYbS4MYfm7t40KYS2
   Twu7+hQx1qyhfMyEncVeUku9TlHIQPsQCi6qMjl6bAVc0HHqiZk16l6HH
   KfHVt2CadXw9ZEgLYq682klkGaYwEK9EM+qcp8OqAS9jvbdPe4jmqP77l
   k=;
X-IronPort-RemoteIP: 104.47.58.100
X-IronPort-MID: 109167145
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4lyKrq0ddi66WXHgRvbD5eZwkn2cJEfYwER7XKvMYLTBsI5bpzwOx
 2RMCGmBPKyPM2rwKNx+Pt/g9UxSvseAzoAwSgZppC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8HuDgNyo4GlD5gFkOKgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfAUdy2
 tYWDRc0Uw2ZtdO4nJWQS8BOr5F2RCXrFNt3VnBI6xj8VK5jbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsy6KlFQZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13r6Ww3yiBN96+LuQyPlnqV/C1G8qVzIVBUGAk/upkmeHcocKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRRwtJWFRHTb8a2bxRuuOC09PWIEIygeQmM4D8LLpYgyilfDS4hlGavs1tntQ2iom
 3aNsTQ0gKgVgYgTzaKn8FvbgjWq4J/UUgoy4QaRVWWghu9kWLOYi0WTwQCzxZ59wEyxEzFtY
 FBsdxCi0d0z
IronPort-HdrOrdr: A9a23:UcwmPKyoSpma4lB3PFFCKrPwIr1zdoMgy1knxilNoH1uHvBw8v
 rEoB1173DJYVoqNk3I++rhBEDwexLhHPdOiOF6UItKNzOW21dAQrsSiLfK8nnNHDD/6/4Y9Y
 oISdkbNDQoNykZsfrH
X-Talos-CUID: 9a23:DuPRFm6dWqMMgAua/dss9GgoNeorV1rk8WrKEX62VUFCSZS3YArF
X-Talos-MUID: 9a23:GtDHkwaLze3nfOBTiTjhrTMzJsRRvIutWFo2o5cWo+C9HHkl
X-IronPort-AV: E=Sophos;i="6.00,191,1681185600"; 
   d="scan'208";a="109167145"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hijVTtZJ4S41np/B2uPlpQzNnfwC4C/RL3/KfywUIp6Y646Zt9jP0QykmRyHSVj3aIOz4sYPAwJeT2lDvDTqmH2Xqnzc7cf9Oxcj8k4TT1MSXt4wtfBmFTDbHGzmaBCr4fSy8SGSo9glzqm+Y1bd8CGkA8gqdQopU6CPyKJARIz5Nem5Iu1BLkgL9tNoLR8I6ri4aYmD+IACnY/0P4G9lYqVZ/ZwGCEuZfEpjN4W36qOY06r1/pZDTtVPZ0Eu+hoZaD7o6GaXPWeSZjmTA8ZxK0Wgt5JfoPaT4XfvuEAUywssv5X/xdv8zlJEZPwFYeFUOzIHGV030jWHKtw5ugAZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SmCC61FQej6WVTmQKC1u6F0PZYCpXnzW0MgqGQaydAo=;
 b=BluSnaSj1doKK3ABsFEe+cW6/0T9pCb8v3a1x5/hmiwoIhqlba+cLqV07/lYl9Ca2e5YYOv9LxxuOE+jqd/yntMEstmdH5EMf00YGISUDBgBtY7DGa/dWT6w48qFIu9qiXU3Htn7Qg6nkjuQi4E/F94bzIgEZDlq/66FjNUxwX9gyGhB3vJXYgzPNfdDJuAk6bLuxSMPNCvnH4zjbLcNV1+M7Qd2bRYBOJc3XXmV5Y443XoN88cMz/L0gpcNjxV+/19KWaS6Nf4dw8K2489K8aEvkL0eYE7B0LZPbZ9L3laXxW46Z2MQv2yr8Tyk91laVrXQmNFDZbLTeHE7P9XmKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SmCC61FQej6WVTmQKC1u6F0PZYCpXnzW0MgqGQaydAo=;
 b=Jza6VAif7SydCToMLXkOPUpBOSmrmNmE64ZH9Ayzrb1DPXZr74uDWETKYs4rMOnmKF6zLTyzceIgTQ3sSRzymbHadY+2zuv/knCVeVxfABzTgMbY26/iq0c1FEo8LmE0tPlcz4zA5mrt3pilHh+mr4Xw9/2x04LZKIgGJclaqEM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 25 May 2023 16:00:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v3 07/12] x86/shadow: OOS doesn't track VAs anymore
Message-ID: <ZG9qFg+NoGx7H/c3@Air-de-Roger>
References: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
 <834a38d1-6917-7aa8-c560-0c943abb44c5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <834a38d1-6917-7aa8-c560-0c943abb44c5@suse.com>
X-ClientProxiedBy: LO4P123CA0598.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::22) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BN9PR03MB6106:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a1794b2-58ed-41a1-6c5b-08db5d28782c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RQ2WejiAMcOWf+KUxGe5e+ZDP/RxQTZE6RfVWVQ3SpC49wTsWCYnnlP5A4Ax3UJ3RyHwpLNBlkyEXzsUVFcJCIkWw7/YUIYGGU611CFMp0eClHguPRmIMzGYMJqn5YTCSyPm/taDLa1v0gVwjHyRsR6i1+Hpi56UlVPEB6Ae3sK8rvqMj9Gw71FQa85AW3AXUWbTWGFfnxxpiVyu2YLHM/xsFlBjs73PGZeGKMrIjnWdNSJeVoDmDHNvcKQ+QTHdaDDkP0pVqBckglu3Fj9Z8Z4NfxX5MvSDfmRADjPzjCoU4XNssxNA2pcotOyBYN0B2IJmRurann9MNoJkF39k83hKE/zzxtL3u1CfzSGEMtUFCwOcmea5sZ3/4XX9VipzSgbW/qypBdcCkTQZHpLik8Wx7SXoAiugrM7lSLsOVoyK4hwilNqc7SOTzm/DcZlEzWxajbYS2WLlapO5I9sLDQ3zzvFDX+raJ/byaq45XjL8vNHRVFPMMtonSnDfSFX8/cH+5kNk13d0ckOkAGk4GjvsYRForcK/F+YJMy+iuP6b4CCBxou8hGp9RVLcQ61Sz09OsB0QybXN74vsin7y//WYc3BMI3zlXQn6erO4Bzs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(451199021)(4744005)(2906002)(186003)(6666004)(4326008)(86362001)(41300700001)(6486002)(66476007)(85182001)(66946007)(66556008)(26005)(6916009)(316002)(33716001)(54906003)(82960400001)(508600001)(9686003)(6512007)(6506007)(38100700002)(5660300002)(8676002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akFkN2c4K0J3SEx4UzNzVUdyMkl4OXlMNFFQcFd6UUN2Q3F5N1A1aEh6Q3Bj?=
 =?utf-8?B?RytXMHUzMVVTdzlnZHdHcjlpMjlJcFlreFo2K2JtNklSeEEzdnJUQnBOM2ll?=
 =?utf-8?B?ZVhOUjFSSVRkM1dHem44S2JDSXVadjVpMitSTjFkTU5CaEk3RmtqZHJVYzE0?=
 =?utf-8?B?bTlGMFpabDFEVWlYYzVDVThzQ2F6R05yNU5NOGI0K0gzSFN6bU9WN1pzcXRr?=
 =?utf-8?B?SkpzdzdRU1BZUzR6TUd0RkhkbGRZajQ4RFRlTjgwckkzMFpvOHYyUC9YOHd0?=
 =?utf-8?B?M2ZjdnhRTUlqMzJhQVoxNVNTdnZIWmlRYWJOaklNSFhiR3h1RlBndWdzN01M?=
 =?utf-8?B?NlBDUEppaCtSV2g4OEdZTWpoeWsraGkrcjNGUHlSRS9vTWdqN0N1cGQ4WTkz?=
 =?utf-8?B?QVQzTlJpSDFVSmM3MXluMmlHVEw0dzN4b1EwT1l2bWlCdk50M0dndCtUMG5x?=
 =?utf-8?B?RUwxZ2Z3WmJOZGw3MXNpY0cxOFJHYzQycnI4REU3RDRBZmR2UWZKa0R1VzdW?=
 =?utf-8?B?a0ZuRDVCRnllWTNUMFpXVi84THlka012V0dEQW52c1NScDRnaTg0Z01LOHpG?=
 =?utf-8?B?UWZScmx3TVV0L29wZVhzQm5aQXZHTDY1RXVpS0VQUXd2SmhpTXhOMmh0emQx?=
 =?utf-8?B?eTFwckZDM3AwTldxWWQrME8ybG9EUi9LUEdPcEtIRTdBSVhzb1lmaEd6Q0Zx?=
 =?utf-8?B?b3FBZ2FTL1dDMy9FV3ZsTFFTdFdjL29nbFd3aEJZVndtQ0d2VmFrQUhQTDFJ?=
 =?utf-8?B?VVNYbHJZck9vTnhTV1lWdWFnbERqNVZzNHN1UlFmczRzSEhoaEd3ZEZzMEFw?=
 =?utf-8?B?N1RtWGJycmZURnZ6VWhydkJEOU4weFRYbEFwQlFVNzhwN2lZZ2o5M3ZWaGlr?=
 =?utf-8?B?V3JtRnk4aU5oR1lYVkQ0TXZRdmp2YkY4QktkNE55TitqU3hLWmNHSUt4eWNz?=
 =?utf-8?B?d0MxSmNUQzltOEI1RURGSEpOUXFPclVxdUdmUnlNWk9jTVNlSjZwNkJnTUht?=
 =?utf-8?B?b1NLcnR3VkpldzhUUmRKUVlWSjlFdks3SFZ3eUh1SnVyVllBZU1seFgvaU9O?=
 =?utf-8?B?QitOOUZXZlRyMExkNE8vLzRPZVNUN0h6ZU5QY2VxVlJrMWNvd3RaZjJUcC9D?=
 =?utf-8?B?RnoweS9VZThHWkhCd0UzR2dtMW9JaTAyOFF0bVhzNlRDZWt0R3c2bGg4NHA0?=
 =?utf-8?B?VEljRExxQWkxaEpudyttUFpwM2pwVmRMRmRlZUMvdlZoNEpSMitvU0ZnMUFX?=
 =?utf-8?B?eUNjaGJTMjY3ZVdMd1Z0SC9DVVh5SHpzOUJYcWJDZU1zcHE0RjUxMVVqS1FJ?=
 =?utf-8?B?eWV6Y3h4UE5TVzlrRzVWQkRRYWVLaGZhbUtZR1VtWU9PYUsydW5kNHJYc0Fk?=
 =?utf-8?B?NFNEbTBlWE5WTUZRV3Nzc2YwRkp2dXBlZ2ZTQ2ZtSUg3L0pPZmZrWDRmZVlp?=
 =?utf-8?B?VXUxekxNc2N0Umo2WVRyMzhGdUlzd0w0T0RDbDBuVi9oc1lrS0QxcEFWNzV3?=
 =?utf-8?B?bU9taTNtZHBMVVdEMXQxSFpwVWhTTkI4RTVXYUhaZlFENFl3Z0lENXVKREdn?=
 =?utf-8?B?NVVsV3o1WjBFZkpxL2FNblAvOEZQK3cxSmlNUXY3bXpxOHE0dXU0RTVkRnUx?=
 =?utf-8?B?WG8weVp4bTd1MjhpVkxBZ2hyTVNiL3JKeGs3QjdzV0VXbk5MSHIrNmt4ZVlv?=
 =?utf-8?B?clQ5Z3FTTU5QNkdHcmowV0FNNnBmZmlpeGNrdGhHTmxWSFZKWFI4ZVhBTFBv?=
 =?utf-8?B?TU5ZNjlvU0VxSk9iMUU1d3NXNzdOd2JaY0g0cHVxUVlWSlNXeUs4RlgvZmV3?=
 =?utf-8?B?WjU1a1NoYWdzOWdBVHdqSGw2STRFVS9BUzloaS9FS1Z1UXExUE45RlZrV1B0?=
 =?utf-8?B?NVZONWt2OWQ0aHVwcUt0RmIrNFJaVUQ4VGtwd0tDMkpKOHZSWVhkcERVbTVH?=
 =?utf-8?B?eUFSSTVZdkZwVTE4NjFiRWRscGpWcUxoM0oxdUJOcjdrRHhEc0VyaEYvd3Az?=
 =?utf-8?B?NFZadWNGZTdENkdLVGVrOW5mcGlQZCt5VWVJV0FSLzREdHNFYmF6Rm9xZnZo?=
 =?utf-8?B?WmxNWWtTbE90R2UzeW0zVzlrZEVvdzBZZ0ZOOWphRDNOYkhuNGdGcHhpL3VF?=
 =?utf-8?B?VEJPei83RGRHd1hYZ0ZRM0ltb01MMW84Tlo3b0dSYUZiMEJxaWgyeWZ2Q3JS?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YTM+GDjz35fCn1+DPLilAu2KtUP7GT26/u5dWACJ67FajDu5ts0KXX2A7FvfyR5oZ06YltsvbQIIVTSblCCF4J1Kj+xx1oX74O83cqzK3hORBHBjFiEyJbxdLBSk/4ULNb9uEGvfuxF5JjebZueIhIB4NSc/DRBD6VZyUJtF0fqzHp3bK52XaoWo68xCOnO4obkT1FClrJF1S/7fZ+k0yaFP7MyHqO6ppPSdLCpiCTT9P4eyA0+5j6S/xVgHmuFczh/DtY0FQJ6SM3+bX0TRwSNaArQ9FwtO1ImIrAeUPa96kpEYM0Tgy6ZIvmDkcxHz8s2Kk9WB9Ge8u2Ti0+wEwOAb3YZO5488gzWkS+v3AcqaLr71ViqK6FokTsJQ/UYjLCqLrCsiGk6imXoXZ6r5Ek1c7TTsUV9blV03UpsVSBOD2hdPML1RWve7l5ih8QdxJgBdXq9EoWSrDWT5sQ1cX5UyyoVQpqll7i3W2BG6numz0ITsksCcfG3xj60t0jiVgFD7N6Pa6/OL83PBqr9z/ykQoOwZt1hllFw1Y92DWc8uWooe/omUwZ2pNSwooAlMwmsp1/UArF2BmJb/1SKzqBaoq3PNrSQFWPVUmzxuM0pxBLj6MJhfxJG3zoJmutmZR9yOqC/eJVCak/J69rOHCBZ8aSDkzEsiKXMVnTWMTUNblIzZPWl441uLkklAheyCU9Pym58BQFfsmXFZcwgoXe6qcgYx6wgL5wsFm/UEtJr1BzHaf5+cMDLmzNOXscEIUAzEktxZEhq+fiO/PPVxbe0c3FeBvQMN8OCPusPa8Y7HeZuv4id29h59R/P4M2CB
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1794b2-58ed-41a1-6c5b-08db5d28782c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 14:01:00.2082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2p/fMKsF2pyC/WtDR6ts60gDNheXiRcoeNoyxCsgl7jaHz4MvszuSJu2SpG2B53pzDfPHOv7aM715DuH24qAtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6106

On Tue, May 16, 2023 at 09:40:50AM +0200, Jan Beulich wrote:
> The tracking lasted only for about two weeks, but the related comment
> parts were never purged.
> 
> Fixes: 50b74f55e0c0 ("OOS cleanup: Fixup arrays instead of fixup tables")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

