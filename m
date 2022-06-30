Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDAC562077
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 18:40:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358609.587885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6xD0-0002Ii-Fz; Thu, 30 Jun 2022 16:40:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358609.587885; Thu, 30 Jun 2022 16:40:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6xD0-0002EO-C1; Thu, 30 Jun 2022 16:40:02 +0000
Received: by outflank-mailman (input) for mailman id 358609;
 Thu, 30 Jun 2022 16:40:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPik=XF=citrix.com=prvs=1738a98a4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o6xCy-00028B-Qy
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 16:40:00 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 473098f8-f893-11ec-bd2d-47488cf2e6aa;
 Thu, 30 Jun 2022 18:39:59 +0200 (CEST)
Received: from mail-mw2nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jun 2022 12:39:57 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MW4PR03MB6539.namprd03.prod.outlook.com (2603:10b6:303:126::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Thu, 30 Jun
 2022 16:39:55 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 16:39:55 +0000
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
X-Inumbo-ID: 473098f8-f893-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656607199;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=5R6mRy+Zdw9vyz7I7XPM2XxjevfYuDk0+bpDss0blLA=;
  b=M73CucYKe5zVZoS6VP1xKvDhuWRQzO0bmLq5d6oMwhaKft4oV/ua3l+f
   wVk2FtXuIFfFAuxYtzCIop5VO2rxuqvBANULkC8THVMJmEAoCP8o7wkOH
   YOgWxw7pQB/XtnkrA0HQWhYW4M/8U0Rw0Jg2HfPiwwzmSKq/dLxOiNct9
   Y=;
X-IronPort-RemoteIP: 104.47.55.106
X-IronPort-MID: 77384986
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:oW28M65BogXUBpe0tk8PcAxRtEzGchMFZxGqfqrLsTDasY5as4F+v
 mMaWmjUP/eDZWDwfI91O4m09kkE7JXUmIBkGwBsrnwyHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw03qPp8Zj2tQy2YbiW1vX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSRWxh2DPPlwdgZaCh7TCQlL4t856/udC3XXcy7lyUqclPK6tA3VAQTAtdd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiXo4YAgl/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2IH8wLJ9Pppi4TV5Fxw1+bVbPDZQcS1HIZOrBiZr
 UHH3GusV3n2M/Tak1Jp6EmEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24maccd9CL
 00f+gI1sLM/skesS7HVQBmQsHOC+BkGVLJt//YS7QiMzu/R/FyfD21dFjpZMoV+6okxWCAg0
 UKPk5XxHztzvbaJSHWbsLCJsTe1PitTJmgHDcMZcTY4DxDYiNlbpnryohxLSsZZUvWd9enM/
 g23
IronPort-HdrOrdr: A9a23:BGSG6qE8dQaBHpTYpLqFc5HXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHPlOkPIs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YbT0EcMqyOMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPH1XgspbnmNE42igYy9LrF4sP+tFKH
 PQ3LswmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZXbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczKgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxenkPK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesaMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO21GkeKp
 ghMCjg3ocWTbvDBEqp/lWHgebcFEjbJy32DXTr4aeuontrdHMQ9Tpr+CVQpAZDyHsHceg02w
 31CNUXqFhwdL5nUUtcPpZ0fSLlMB27fTv8dESvHH/AKIYrf1rwlr+f2sRH2AjtQu1C8KcP
X-IronPort-AV: E=Sophos;i="5.92,234,1650945600"; 
   d="scan'208";a="77384986"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jxO9Ygnf9M4rb8QYwVU4tIDrWtfPzfXh7kDAALXIYAyOQdoOHMkRtAhTOJkEOybKuP6hmjF3/MAGckrmCn2qaR7k/GGuVKvsWYe9Il10+ySVEoJFnBzu8qI1EI6Mta1AlkNmHVhQ2EX43g5WcfcPKAZXBBzdfgfLICf/Nowcl+Z1IpOwWBSJKMlBqjDNSEs+RyU8l9BDC/nihxkToBJuUmlCurKMt2FNPCdNQfhTM4tz56Hg4105xxmxEkkJC0O2Q9qFry+F9+/1KKnmWSCOw1ju7s802jhdh7FEkIfNC/NZ9j6FYdifHGJtzVjAG0tzZSa89JLhh2ZZ0aXGISStqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9JDgQkCJ8TUJba+XuzjE+dL45nQdMlCa1F+//oCj2HA=;
 b=U2munDzErxkySHN7k1Wuk+y1T/X6agMYEQvHrR5EJh+wV8Cli76C9+fc/2rY2Q9oh4Ygrnd/dHDzK1i09FOH8eIqBhNAAlep1DWEjSglMlqRP0O+BevDs/hntdQSVubpzdEqzV6RPRbgQM9Oys5wMkucRLBa5wEsDvApV1TICGp1xjjyQcMbgK7ziocuFyYel08BtEH2MNsmQ6X83EIjL/lqledj9eeZRIRqpZGPFxvHl9mRfJcFta8TE0fWvyAiRu4tIZZnDj4ptiyG3U/zmJl6FxVJ3A/SGh8VFEUxO08al6bbwaNDvM4mxc/pGLbSUoTU+SNuy1nILKwjCpNeKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9JDgQkCJ8TUJba+XuzjE+dL45nQdMlCa1F+//oCj2HA=;
 b=ciZAaI4thGBoz2pzUBTPbRS3eJ/4PhHW4njaHkOw52EAMfX1z6uWA6HMQGsQ/dxsZ+6mGtJWIadRJrkll4+1E6RrR9TGpqqMq0+OE6GvTan7cPHdiHH+wI/etzbQ8iJ2IPeL9nzYOUJnYxAYokyEp+aGneRHKSXc3qDrHBKn1Ok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 30 Jun 2022 18:39:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/2] x86/spec-ctrl: Only adjust MSR_SPEC_CTRL for idle
 with legacy IBRS
Message-ID: <Yr3R2M5P4saCVz5l@MacBook-Air-de-Roger.local>
References: <20220629184508.15956-1-andrew.cooper3@citrix.com>
 <20220629184508.15956-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220629184508.15956-2-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LO2P265CA0299.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f71a4988-3cde-436d-b0ba-08da5ab729f9
X-MS-TrafficTypeDiagnostic: MW4PR03MB6539:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tclNokUCJO2zOpSjDVTHUrqnZMg9h/ZMqdNnUHxOzMEA9gCzBa2JDK7djr8UXKAQbZcJ0TP64PsSTINBliTDKjVcq+fDqKxYIuZRy6Jt1To+Ww34mnPnArajHSPJQXFhUa4w5Qu3nMKhVyd7j++5wkTPohkMWp8dVdwMOdtNWdUyAr4kgbHnyyE6xEpXdphCSr2jv768NJEuVWXI8kJEO99k8TuRk8PW2FXa/nqG1KFjAp9SCG8WUHZi8sp91jY7FaBsrXUqujgU4hwGjJpbW18QusNyx6C0VD2+bpcOn2OAVrjbsTcd1AqDylDLL17uEzGC3ncGs8l5srFLPpLECgls8HFq8n8RP6UW52FuKxvN/Z9JjxpCdEGVuqT6oNsurE2oHInLwnSy78mc+M3BNd+rHVgyJ/a7lXyGNFvF/efIwwFZiEXh+1UFhcgbfDn4CvLbvo1lsqbe5zVWMtytf9hEL0W2NNzK8rsUi78UY4eWin5HKv9h6tKpaymY0fpNzNlS/nkKNB10RB48x063NPyzjGvmczxWFJT+bZaBVhtDySWfJgW/bevixURah+ojRWvR09Grjom29+CPLT9HU/pF4bCg8HDeFt6syci5QVhtnjLYTSuY+8l2no/hFN7LEiYYVv/oHsw/H4PpwmzyQCbGWmPSsbD2otO1Lo2ukqP/PT03MnBvG3c8oiWcaFDqZ+queZbgCw0c5wzEtNUxeLDnCsmNJ12/4RKjo+d9Ob1m6Ax6ofjDV1zrdIWHXOkq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(82960400001)(85182001)(66556008)(41300700001)(86362001)(186003)(5660300002)(478600001)(6506007)(38100700002)(8936002)(6486002)(2906002)(6862004)(6666004)(54906003)(9686003)(4744005)(6636002)(4326008)(66946007)(316002)(26005)(83380400001)(6512007)(8676002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDkzRWEva0YxcStBWURpYVV3RGlncWZDUHZzMndsai9BU3ByYm4xajBqY2Nm?=
 =?utf-8?B?NzF1cWoxS3dhMXJVeStSSnBRN1NsVlN4dzFyc0lpYTNlQi8rem8raCs2VXMv?=
 =?utf-8?B?M1VxVWdmckNldUgyekRDVlg0dGI1Nk1tck9XdU5Weis4YjI3SEMrbE1PTDBt?=
 =?utf-8?B?eWorOGRWckhkaEt0QTFjVlo0Z2JJenZMTWtrc0NRb1ExYUF1UXc0R3BEMkY4?=
 =?utf-8?B?R3JSRlg1ZFJnRWpRZWJwREVkUllNOVRZQUtCRDZUNS94ZGg5eFBpd2YyZFRD?=
 =?utf-8?B?N2FjQ2RBSlNMVEMyT1BJQnN2RWRwYzhxOU01VytydkI5Wk1CZFA4WnliM2E1?=
 =?utf-8?B?Q1dwcE1UMXRVWFBSaEhBd0Z1Q0wzTW83MkNUTTZhdCthNGVtVytySFBLdlR6?=
 =?utf-8?B?Y2p4MXpLeUg0SVJ2UWdqb1NKb3ExZk5NZ2RaL2NHOGNZQzFKcmdKMitMMy94?=
 =?utf-8?B?bVZTL0NHeTI4TEZCa0NramJTTktPakdvVjJzeXlaV3o2ZmVQOTFUbW4rUXpt?=
 =?utf-8?B?RmlUY1hkR2NxNDNuaERlNkNyck5ZRlNpYzhma0JUam5la1hWaDF2dkxUUTlo?=
 =?utf-8?B?dzFmSXRpd3ZHa1RObHJ6UFN5cWpwODUzNXF4UkFsZHVqbnREMmxHK3hQanB5?=
 =?utf-8?B?T21zNndFVUxpMkV6WjhoWXRvRmdaRmxJZHdRR2V6aW5sQnUwQXhUaEd3RXpB?=
 =?utf-8?B?VFVqMFNTenQ4dHptUUN5SzJDK1BNWnByd0UxQkIzS1JDUlhzdUVid1RodUUw?=
 =?utf-8?B?ejJrenEwU0R6Z2pCU3dFNFNtNzY5Q2todnlQcGlzckdDODk2NDZvVTl4aWhF?=
 =?utf-8?B?SDI4c01peFRKSS9pQWJEQmJHY1FINDJBSEtsbkZkeXRSUmRMQmhXTWRxQ2c3?=
 =?utf-8?B?WEZoYmh6U3Y3YldMYkxJWGlOOXk1Y2xkK1JKK2ZYbTVmTUVOVDdOUmxOcHQ1?=
 =?utf-8?B?cldQOGo1aS94ZndxaFVaRjJyQXFyMG55NSsvNzRpQTUzT2VvU1NQeUJsczM5?=
 =?utf-8?B?dm5aOHR3ZWh3VnZ0SFRoNHllN3ZLNnFrRmh3M2xYbnNiUEk5ZHJOZE1YbzdM?=
 =?utf-8?B?QjR5a0FVRC9UdUZJbHE5OFlSalRnaXhYRmw0dTlBLy9LcWg0emR0T1c4Nmhw?=
 =?utf-8?B?Kzl3dUZlZjNDMWZGTXNWZmJyYTVSUFk2MDFxK2tWLytIUTBEZy9teVhSWUcv?=
 =?utf-8?B?VU5TK0x1ak1KOUk0NzRuLy9sb3VibTB0UHo3cWw2dWtwKzcrRTZRQnRhMFFB?=
 =?utf-8?B?N0o0Y1VPNlArWGtXVjJoQ2QybkJmeHhJNlhISVE4QWNVQktBVXNISnFjd0tX?=
 =?utf-8?B?b09nUzBFcC9rUDB3aEs4TitQOGVVWDVaKzdqOStrdWJYYUxwMHdzV3dWd3ZM?=
 =?utf-8?B?YVJvQzhaVmhxbElhQVRvTFd3STI1cHNDQjFMTElDZFFoYWVGMm1ibkc1N2FS?=
 =?utf-8?B?U1J4QUZVQXpWcWd2bmk3S2hJRnlGZzZQaDlTdThuODBrK3g0cXpQcHhidzFX?=
 =?utf-8?B?TEc4OUthbEFxN1FLbC91bEowcm5YYVBRbGhESHI3eFlPcFNPRFdnTTdTdTQ0?=
 =?utf-8?B?QW52WVVkakJZaUVrZkdkVC9GVkVqUEJpSzdvVjhYMVZCY0lSdzIzZEVVd2p2?=
 =?utf-8?B?QnY5SFBHTTR2S0lnQ3lENEQ5SzkrSmFCb0Q5NDA1NkRTNXgzZ0w2OVpKRC9t?=
 =?utf-8?B?UzdkTCszUjBrVWtSSHBjeVV4emcyV1puYzdPWjNCUlBVM3FqYWRpbEVQYmkx?=
 =?utf-8?B?cGdZS2xkelcxcjQ3OFZYME93R0VSTHdqUU9JTXVpZ2o0N3l1VVdZdXBPa3Nr?=
 =?utf-8?B?WEVNZFAvK0lpa3JOM1ZSbU53dzJrNTVJcEErWGtxbFpmU2QwYlBTendCQjRi?=
 =?utf-8?B?OE9oaEVBeVZ6WExpWm1NSG00TmFpRG1BUlVKOE9XTUZZVkd3RHRTT3dkL3pS?=
 =?utf-8?B?emE1U01lUjV0VW5ldTU3VitJUU41OTdjRWt3aVNCaExzQ2RBOEdKQndTT0w1?=
 =?utf-8?B?bnljZDc3NmhqVjJMUUpJaFFqL0dtMVZWaGNPTUJqdnVNWTVocnErMS9meWtQ?=
 =?utf-8?B?NmFrQmh2ZzdaUXVXYjZ1ZjJnMHZITUI1Rmsrd0EzTGRTdlEyU3c2SUkwOFMr?=
 =?utf-8?B?M256bG9LU0RmOE1hQnlTVm5zZzNzUFg3aXZ4ZzFRcERsMkFhMW9XU2Y5THQ1?=
 =?utf-8?B?Qmc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f71a4988-3cde-436d-b0ba-08da5ab729f9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 16:39:55.7198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A64Dta6xQap1xz+eCuMI1G8clH3r28+iyRFeVjy3m5jjdKiJVEwqLxxF4oGWUtIWumb8jNKeyIedKtVQIiCW9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6539

On Wed, Jun 29, 2022 at 07:45:07PM +0100, Andrew Cooper wrote:
> Back at the time of the original Spectre-v2 fixes, it was recommended to clear
> MSR_SPEC_CTRL when going idle.  This is because of the side effects on the
> sibling thread caused by the microcode IBRS and STIBP implementations which
> were retrofitted to existing CPUs.
> 
> However, there are no relevant cross-thread impacts for the hardware
> IBRS/STIBP implementations, so this logic should not be used on Intel CPUs
> supporting eIBRS, or any AMD CPUs; doing so only adds unnecessary latency to
> the idle path.
> 
> Furthermore, there's no point playing with MSR_SPEC_CTRL in the idle paths if
> SMT is disabled for other reasons.
> 
> Fixes: 8d03080d2a33 ("x86/spec-ctrl: Cease using thunk=lfence on AMD")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

