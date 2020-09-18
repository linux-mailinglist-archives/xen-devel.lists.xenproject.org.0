Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 828A5270114
	for <lists+xen-devel@lfdr.de>; Fri, 18 Sep 2020 17:33:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJIO4-0007yi-7d; Fri, 18 Sep 2020 15:33:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WmPg=C3=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1kJIO2-0007yd-Oc
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2020 15:33:22 +0000
X-Inumbo-ID: 9ce706ad-6b3c-4020-907d-25941dee431f
Received: from USG02-CY1-obe.outbound.protection.office365.us (unknown
 [23.103.209.68]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ce706ad-6b3c-4020-907d-25941dee431f;
 Fri, 18 Sep 2020 15:33:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=VqXNl9CqaBB9+/HyHvNcjb7ww1U4b2cmadC/j056f2FDXQ2HrPYQcjpgdRNpuSjNu8koerrlzQs0kMK4qFS1yL3YezO6GmwuQJOGTGFEk1so3pAwg6VoD3xtKvqd4xVrYoWTxkcfwt7oFfwdhCxkQJNP2tfRshOSJbBzqj5Y+lnMmaGeQ7RSdBx+rxujPS8I/ONJukVYtoU2oYkpzD7FUxKt50rPjv83J+P42AOfi42DNDBKrtK64rQ6BL3GRBlAJGQrnYjH597y60A8AEFZ91egvUdHJ6kBh6CXKH+XXJlf7Pdmedmeh75oTiTdFdMISi0efiLKrp4AN2LahD4vmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YrmwW5iUXJe7YkYIYXEoqzHEz6YUv6DVBvabcfn/+Wc=;
 b=RxnGcjy1o57yihv13dBsBNS2q6ysIKN4tEpUI5qJhKRsKUVWcieHhkDSZna+HLJrOrsOEcGreCPiEqCew0cR9esTA9qxhV8YBUwJBDcnw2AsQhz6qM0asDgZTf5HaMCCKncUBcIvQCEzASdDqAsx2F9RAVLUW2C9o/TuHbxWAhsgrunYpETrKLaWzYiGddF7I0Dam7oqO23rSjlvG00BYWLx+jmqp+W7NO5Gkb+xPbOEa5SvPvCWRccQDvk0LhtNPxCOWct0X/MqB9skQhV22R+uZQnvGZSh7Pig5lkuM4lSNIwXZ7ASqrXuZHmV9QPgg4WwwHs4jqzJQGKvNRRSFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dornerworks.com; dmarc=pass action=none
 header.from=dornerworks.com; dkim=pass header.d=dornerworks.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YrmwW5iUXJe7YkYIYXEoqzHEz6YUv6DVBvabcfn/+Wc=;
 b=JwC03tUKpPc/K4Oddl9F9f6Gdizx6Zz2Nn02FCkfQwVmyymlNsZ6T6zRLp4NzGl1hlBiZ45rB+cYuWuGR6nceOKjvoZMQaBtoHTwRJJec4G57bbSd0LyDXPJeZgUbbt8CgZRWtl3VugoD+hM9dFWLTBDoAPODjDiI4IfqUPYeOzOXqNpvoUwapGQqNvmMklAwjVWeTVDnROmb70UlKpEh6t2xAk7Y/bzgQ6zUaJ366kenrHTwbf9qPMSd2GBSblM3JQvru3EnbT8Bztfv7GaJjz/hYTHhi3OGLGJDrPtgwQx6Al1dLn1GADN3FatmjCHJJ6NdLnT/Pes8oQrB4ROtQ==
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=dornerworks.com;
Received: from DM3P110MB0331.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:411::9)
 by DM3P110MB0522.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:413::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Fri, 18 Sep
 2020 15:33:16 +0000
Received: from DM3P110MB0331.NAMP110.PROD.OUTLOOK.COM
 ([fe80::a1e8:92c7:27ba:7230]) by DM3P110MB0331.NAMP110.PROD.OUTLOOK.COM
 ([fe80::a1e8:92c7:27ba:7230%10]) with mapi id 15.20.3391.015; Fri, 18 Sep
 2020 15:33:16 +0000
Subject: Re: [PATCH 1/5] sched/arinc653: Clean up comments
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: xen-devel@dornerworks.com, Josh Whitehead <josh.whitehead@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
 <20200916181854.75563-2-jeff.kubascik@dornerworks.com>
 <d91dfe61-5d7c-fe14-1015-71ed7177da7d@citrix.com>
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
Message-ID: <e2454cd9-6bd3-8b8b-2138-ad77e46717b9@dornerworks.com>
Date: Fri, 18 Sep 2020 11:33:31 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
In-Reply-To: <d91dfe61-5d7c-fe14-1015-71ed7177da7d@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY1P110CA0046.NAMP110.PROD.OUTLOOK.COM
 (2001:489a:200:400::16) To DM3P110MB0331.NAMP110.PROD.OUTLOOK.COM
 (2001:489a:200:411::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 CY1P110CA0046.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:400::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.17 via Frontend Transport; Fri, 18 Sep 2020 15:33:15 +0000
X-Originating-IP: [207.242.234.14]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ad69152-6521-48d8-c520-08d85be829b0
X-MS-TrafficTypeDiagnostic: DM3P110MB0522:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM3P110MB0522F947FD33FDBF1AE3C2FDE93F0@DM3P110MB0522.NAMP110.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3P110MB0331.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(54906003)(5660300002)(4326008)(956004)(2616005)(44832011)(66946007)(4744005)(66556008)(16576012)(66476007)(53546011)(52116002)(26005)(186003)(86362001)(6666004)(508600001)(8936002)(36756003)(2906002)(8676002)(31696002)(31686004)(6486002)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad69152-6521-48d8-c520-08d85be829b0
X-MS-Exchange-CrossTenant-AuthSource: DM3P110MB0331.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2020 15:33:16.4705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3P110MB0522
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 9/17/2020 9:24 AM, Andrew Cooper wrote:
> On 16/09/2020 19:18, Jeff Kubascik wrote:
>> -/**
>> - * Retrieve the idle UNIT for a given physical CPU
>> +/*
>> + * Retrieve the idle UNIT for a given pCPU
>>   */
> 
> /** is also acceptable.  We've inherited quite a few doxygen-like
> comments, and there is currently a plan to move some things formally to
> kernel-doc as part of the automotive safety certification work, which
> also uses /**.
> 
> ~Andrew
> 

I didn't realize that was the case. I can switch these to /** if that would be
more desirable.

-Jeff

