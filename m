Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 468307656A4
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 17:01:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571164.894365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2Ti-000642-VS; Thu, 27 Jul 2023 15:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571164.894365; Thu, 27 Jul 2023 15:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2Ti-00061j-SZ; Thu, 27 Jul 2023 15:00:34 +0000
Received: by outflank-mailman (input) for mailman id 571164;
 Thu, 27 Jul 2023 15:00:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RhFg=DN=citrix.com=prvs=5656f8b89=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qP2Tg-00061d-VE
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 15:00:32 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5335e8e1-2c8e-11ee-b248-6b7b168915f2;
 Thu, 27 Jul 2023 17:00:30 +0200 (CEST)
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jul 2023 11:00:21 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB4973.namprd03.prod.outlook.com (2603:10b6:208:1b2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Thu, 27 Jul
 2023 15:00:16 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::edfe:6f64:4048:74c5]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::edfe:6f64:4048:74c5%4]) with mapi id 15.20.6609.032; Thu, 27 Jul 2023
 15:00:16 +0000
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
X-Inumbo-ID: 5335e8e1-2c8e-11ee-b248-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690470031;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cX/TwmOH3U2EY3VWjFijlxuXPAN8eGdmB4MT2ynspNg=;
  b=iKFhd/R5WSoysBi8TlS72zWGPKDq+1l0U/+yUeOSoDHaBsgOC43pKPAV
   CIYf2QzIkyq7HPTvxacO7iMybdbrCWVtbvVbob67UBDuG61c1tmxs7vrZ
   xmuGAgLGcgtW4pVhb4LRKP1AhRPbKdFBICIHNxHU+j+GX5U97327BT5uQ
   k=;
X-IronPort-RemoteIP: 104.47.66.47
X-IronPort-MID: 116949815
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ZwDZi65zJGH2vh1gz5ydTAxRtIPGchMFZxGqfqrLsTDasY5as4F+v
 mpNCm+HaP/bMGqmKIhwYY3kp0kEv8SGmIIyTAZlriEyHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35ZwehBtC5gZlPa8R4weE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5ms
 qYaKDQ9fhy5rsGT5ZyFQ8Q1xcciI5y+VG8fkikIITDxK98DGMqGZpqQoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Nkkotj9ABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdtMReHppqc36LGV7m4jGkMranW6mPq4tlG/ef0BB
 Egq+gN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8ywCYDW8AR3hfZcA8tck3bTY32
 USEmdyvDjtq2JWOUm6U/LqQqTK0OAAWIHUEaCtCShEKi/HmoYozhxaJScxxHaqdh9j5Xzr3x
 liivCU4hrxVl8cE1qy39FPAnhqlo5SPRQkwji3eT2ujqABkYYe/IYyh7VTW995JKYrfRV6E1
 FAPnM6F8eQSDJeCvCaQT/4AGr7v7PGAWBXDhXZ/Ep9n8C6ik1azcIYV7DxgKUNBNscfZSSvc
 ELVoRlW5pJYID2td6AfXm6qI8EjzKylEMu/UPnRN4BKesIpKFDB+zxyb0mN2WyriFIrjaw0J
 Zacd4CrEGoeDqNkijGxQo/xzIMW+8z3/kuLLbiT8vht+ef2iKK9IVvdDGazUw==
IronPort-HdrOrdr: A9a23:74gBXqlL57fmSD234Bl9lShdoCDpDfKB3DAbv31ZSRFFG/FwWf
 rOoB19726TtN9xYgBGpTnkAsO9qBznmKKdjbN8AV7mZniEhINHRLsSkbcKgAeQZhEXz4ZmpN
 hdmtFFeaPN5DpB7foSkTPId+rIm+P3iZxA7N22pxxQpENRGsNdBmFCZTpzeXcGITWua6BWKH
 O03Ls3mxOQPVoWc+WmDT0/U+DYodqjruOdXTc2QzAm9SiThneS5LT7ChiV2Qp2aUI1/Z4StU
 bEji3k7eGZv/u60x/R0HKWx5lag9f60LJ4db+xo/lQBDXwqxqiIL5sXLCPp1kO0ZmSwVsnis
 TNpB88P8J18RrqDxGInSc=
X-Talos-CUID: 9a23:A2pmoW8CkveaMk7e6pSVvwlOGMAhQm3R9l7zBmqWN29EEf6WSFDFrQ==
X-Talos-MUID: 9a23:L+1/1gRy1zLqIGc/RXTutCM8CfhG4p2tCXwSkLcp5eaACyxZbmI=
X-IronPort-AV: E=Sophos;i="6.01,235,1684814400"; 
   d="scan'208";a="116949815"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JCeUF54if/TqhqKzWTpS/iGrV76Z7xCE7eru0KIe3ZttdYVO4cQuYIVdT0PLobwwNcA1X1RHOSJXUjpiIHHZhV68pXCkDvJ/aSfJsCUHE+Mhe10kD4JBPLFDyf7JXjnR13E5a1ni/ozv6b7gx8HINXesl5fn5ORArHsKCgB/DGXuYVt+iuS4nQ6+TpE5T6CVUVwc2fNa618fSDKdS715jwvlRKHbUht2IXCTzR2QcvBZEpVQWaV2PU0vrZjWfb1WxLRsHolR5ik2pEoIpUxq70uWRL98kfSCRymuyr1XIGBPU5K00fP79FZLCnhJUfFS5NA4+yHOWyWt5Wfh7e2BPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQcYL0+3nv9q3I6i1DSxYcispTEsFXUpuUha5WTQ3Nc=;
 b=VIujeSr4xSkrDTLUzj/UcCHEMrgXLb2xJVAyn+1QPjb991TyTpVo/xOEGNtmbTX1PViuEHJSxWu61+5WkzRPMp+FSVYs+SmRogHgBQ9CbLwqoygMzUF+vn/krmqPi7ja6sPJ/S0inKIk2VgpydXh42ZO7I+okRe7uJvV8iaOLcysaI2LNl1VpmiSA7uGZ3/STGF1QvTXSKsp+nYqR9XUObUc0pxaPXpdPa/lKgLTq3eKdn7h6iStOkQGBz/K6ozVnokln9mXISuX8AO0lt5q/iHDwf/6YC/tiXHIyXoUHvO5Avg5BbyR9bdEM6RLJm18aRA8SoOOnfsvepJ4zyHdtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQcYL0+3nv9q3I6i1DSxYcispTEsFXUpuUha5WTQ3Nc=;
 b=UpWee6kjqCnoHp5JrQBX2gXofEanB9K7D/6C+dLWOVl17obbpUmzGD9MdH6FEWGr/f6xgJ8FZuVxhbFBR3+qQuUv9u03AZsuWYgaomJqPUUSignDI7ZfhRFS/smHFOXEvoGGVYO+/7Nl7dQ+uhuFssDxuUk/c+gR4eueQXEAj2U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <40b2fb63-463c-2f9c-dc46-572cb0925807@citrix.com>
Date: Thu, 27 Jul 2023 16:00:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH 1/4] x86: mechanically rename to address MISRA C:2012
 Rule 5.3
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1690449587.git.nicola.vetrini@bugseng.com>
 <614dd6fe03ab82db83eabc430b27435b19096791.1690449587.git.nicola.vetrini@bugseng.com>
 <604b915b-e07e-8985-87f1-300568d0259f@suse.com>
In-Reply-To: <604b915b-e07e-8985-87f1-300568d0259f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0034.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB4973:EE_
X-MS-Office365-Filtering-Correlation-Id: 30cc83c1-fbf8-41c0-6ad0-08db8eb22fa0
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yvG5tgvsOyiZPWP0Jy1c7MXt5EdU9rlCD5jpIxPOfPBGiiu0YEWt18suZHywJlrZ3XKIjWdVhFDiMKf2oUYVe8ZUcqS2VwdC3vl7XJDQDgvfchbhGuB/X0TMte18Wv3snqbl8E0R8Ig85wdTsnLxfTqrlxGr1DVhDa/rlH70fqoTOiPRcbq/xYP6W3QXJNUO6DkhsIPjfM0tg8FEgXz4+nHfcoLZDboxgo9TqyxuraiqLoNIVQRanaf5js3TWFUGyWF8HmvGSAni76/8z7jtamAwZRq7UATLKfRqpgsxgobuU/WhzzR3b9EqoqVvL2aboCWqsc74a5v3cOJQ6FNGdGlLfZqkWbv2sWgucrzsAWGTrF8TChfR1jz+kRAHRmO81pN7hnG/tTP4B79QZHqhjh/lFCrtuKMlZSJNFp1rlD0yv0mG4huYZEf20kdLWhpkZzeg1mdYqPPD/FOHSrhkGnSMFQOQiuzG274mAKLqL68YIIKxSnCiOdHcsQhokXbzjRnjjOtllywu3V0HnBxM46kPAK4HEqlJVNIzxKbDNcqIGbQevI2zj3kl1NJ0FuPrC6MwzkoiAy+GmPkg7M1iV5DGwuOcXhZm4eC3diLQpVjf7c0OBf522yHr9MK5BsfF8p+bst13Oee8M2vZl8CHKA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(451199021)(316002)(41300700001)(2906002)(5660300002)(8676002)(7416002)(8936002)(36756003)(31696002)(86362001)(6506007)(26005)(53546011)(6512007)(82960400001)(478600001)(6666004)(6486002)(38100700002)(186003)(2616005)(31686004)(66476007)(66946007)(110136005)(4326008)(66556008)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2FWYkJzbzRMZm1ScFV0dFBIclljbndFdEZQVE5XTVJRVXJ4ak1mOVk5TzVX?=
 =?utf-8?B?bDZSTkFYZVdEZk5Ud1pXeC8rZXNCc2ZDWTZmL09zMFFHUnNoQzN4bkl6WURS?=
 =?utf-8?B?SHFFcTZRYzdVWkVmZXkvaGdEemtPN01WdDdTVncyVGFuUW1VRWt5RmxVOUpU?=
 =?utf-8?B?ei9oWHJOMzdQbHBLZmpTVEdqT0MyN1VCSUE0cDVyem9oZ0h1VjdOczZaVzB5?=
 =?utf-8?B?cTRlcnNZZHErYXJOMm5KZENRNElzSElNYnZUU1dKa0RNRzRpeWJoeWJrYW1P?=
 =?utf-8?B?eUl5VFJrekNrR1JiNFJaaDM1OE9KcHdNSjAwZ0RYaFNFL3lWRWo4VWxiSU9E?=
 =?utf-8?B?UGZ5RHcraytqSUsvd2YvejkzUHNOUWV2bVBSMmpHQWg0VkZvV0JKbTZibWxJ?=
 =?utf-8?B?dEtJZnhBZDVvT0xIMmdyNXVMemFpbFJCdk9XVWtJaG5VMEQ0OTg0Y3B2UHo4?=
 =?utf-8?B?ZzZaRStUUGFjSXAxY0VENDVYdjFHTmRqeGMrNXlISTBQZzBnT3IwZlFLVllj?=
 =?utf-8?B?NnhLamVHdzBFY1NHS0xqa0VxalF0MDBQcytYZ3p4bElqdnB4aGtiY09RaGY2?=
 =?utf-8?B?UGQ0RlhVSUxWM1FVaGRmWHFOOTBRSGxhU0VTN3RTWXFVdHA2WmFEQVdKQWx6?=
 =?utf-8?B?RXoxYWhQQ3lyYWZldHJzUEhZMCtmOUU0cmhOWEpQUnVEampjK0d3blNFRmk2?=
 =?utf-8?B?WWd2ZjZLclhBdzRwVG82dXlXY2YrZ2FBUWlGWE0zM2VBYUwwNjQycU51VnhI?=
 =?utf-8?B?NnBXd1J1bU0wM1VodC83anY1WSsvbEJJL2dSSXNpbTJ3YVJyWjhuK0taK3NN?=
 =?utf-8?B?Yndsd2toS3kwODdxRS85Um1jMmN0bVZ5M2lGd2ZtMUdHWmRycUltZXc0UmV4?=
 =?utf-8?B?aENFRW1XVEVwMENzbUdFTTEzeWhaY2lsR2NldjZwZGE4dERYbnJCSjZOR1FG?=
 =?utf-8?B?WWRmVG9DQmc0NzgvZmZEUjlGcGptbUtFNVpNQzljMXlxUGNrRzNmSEpsSDlv?=
 =?utf-8?B?UWhpWlNiR0RmVGhKTU5UbndJZGh3MytubUc2YTl4cEYxZTJybzhoeHRHWWhn?=
 =?utf-8?B?UmpJTVVCMWVObW45aVFHVU16NnN2MW1Na28wRStUYm9GS2YyYXhESVV3cUtm?=
 =?utf-8?B?RmFVVnVXQVBoNjZ6ZUVnY1o5WWx1QlNzd29yOWhhekZZTzYrQzgrU3hGSkFl?=
 =?utf-8?B?Z2wyMmo2YjZyWTl4OVJhWVRHdTBiWkVxUUVSRHk5d2lCSFIyNVBWamo5NHpY?=
 =?utf-8?B?QUFRYks5b2sxb3hXaGJlQWU2cXZNV1E0cUNGR3RYOHlENTBnVzNReEhneWp5?=
 =?utf-8?B?WVdqTHlsaFJzWHBXSUNWSE94NDhON1JXbFFMbjFpMmNTbVZiZnE1YzVSQ09T?=
 =?utf-8?B?VWZsSklhdFVTNWxPSENDaDYrWGhnekNhL2hhQzVIWXZzTjFvdE1tSE9ZaUE3?=
 =?utf-8?B?S1BBcFVyYlJNMTllR3pKQjZrVTBQQkZKN0l1TUluS1hsQTZvaFhVTEkxanRQ?=
 =?utf-8?B?REREYTJTUzEwR0lEUi9RdFRJQ2d0Q1JoSmswTXI5Sjh0bk54Q2QwRkkxSXI5?=
 =?utf-8?B?SFlGa1VPSkt3bWREVEVPZzk0R3dicEtUMDBQRnkyY0dBWEd4RVV5bXBqc2xx?=
 =?utf-8?B?LzBJY3pDRzBGZW1BVHg5MmpUZ3V1WTliWnJxVHRJekJnS3dpU1pBM1kxaTFY?=
 =?utf-8?B?dk9wRlBhVndQUVdCTUVUL2M2b3U5UEQ4WmFOTmZzZHA1ZkhCRGtJV1VucHQx?=
 =?utf-8?B?VjZjOE5wVlJzbmdDNU4zeWw0a2lRUDZEdXNkZmlpTThnR0tBZ0YyRjhLeEs5?=
 =?utf-8?B?UU9nN1l2NHA2bk1KampsUlJzRFdFMVBBOGtXWGJaaHdZTDJQMFdqWnR6Z243?=
 =?utf-8?B?MjlUVGJ4SzNRNkxSRThtTzdXWm1DT3E2STdRejgrMXBIVVhGZ2xMTkZYdmNU?=
 =?utf-8?B?YjFQeHdaZklSUmdlMVR5NXdLZEtGUFhOR213RXh2K0YyOHYzaXU1U3VSVjdO?=
 =?utf-8?B?RUdSbWlkaW5hWTdTaGM3aGxKYnIza2M0VHRQUHo0ZXBKQjgrRWh1aUYxVUhS?=
 =?utf-8?B?ekgzbnJ0bUJicTZETEE3ckJ1UFV0NGFvaEZFNENaNk9CU096MFFXVk81eU9r?=
 =?utf-8?B?NWVsaitIZDEzUUwxY09ILy9QWGxhQTRjSDBTUTNGdzNpbFVEMVl0NkdyWEtF?=
 =?utf-8?B?N1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gkTo0vehdAEGCqv33kPimEXbtsSInEyOOKNqA89kGxNWKYCtuzYxbZuo+MDOB4uAAgRh+u6vQm1SpBNh89UqQDimRZvL0/DzsF6h39tKJP91azREDXvYJBV4TpUE2ZdhF8WNxMLiSwcIqzOvVxkieFhoD4oFOvgJqVtxyBA48qXe8Hrq6ImHxhIWdVGr7n2VVSnqV0CeO435LD1zvEm7wxqQLb6ciw/xIqykR0eoKsTXnDPWJwtaL6Of1wK9lJX4+CojoMJHylus08NK9fIt6izbaXZ7OJEtXjPiugfOIr4PzT6PYIWextGKivkm1vNwbxhg6UFuTWTS19oza5yEW58NHjce+AfkXU/6ZDdO+REQ+bMXVzh4D4Qi4BpPNBkewivcdIb8zsw/biaMxJE65swlgaT31UG1/7eVEKfV+XGlQRNCUFkizgXryxAFKt9zE49zNp0/S/J2eY7IVb9IHCWyOaWVDSlZvORzbViYq4a8ioVxGciRAcsL6a+igNzZfhgGW99ORoy218lB7niwWylIHwrrD/sKbWaEUkOlVenuqUCIwpZKVT+D2X9C3us93+S4m2RqXSWgSik/MVGBsELX5tBdVUpO2uxt0+TCFPaMAnbV4zKv1XvjMtnywTE8BnZ1I7Pm+Bq/d5TM7bZMr+jdeBSMGcBNwfVFsfbauyComRBD6SwLPWiAv8kMMD21H+WSxpPRkmAhDeP36OGlnx9esWMHdaskGOMG0Ukvia+dnu2/DUkPGkJmfsI7BCNVhbfwQZPllGZ9fhpIPR8huZ4sqX7yTFQNuXBcfZMBMZBOFF1f66Q5XOUQdx/Q8DI4UyA5gPmw0vVX8stgjOLgTcvV31E7ev+rluCfH3547Gujv56cozig8rzQXoPcOZ8Ao6UZkmvev+QzBVwWyU/eZQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30cc83c1-fbf8-41c0-6ad0-08db8eb22fa0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 15:00:15.9819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJotY/apVJ4jCOLcxr5zRx6JTqNz3llY/gw6ZYgGZrWDyFA9ApVBzkYMO5AEOlC2tg4/ZpxVDf8HaGw+V23cNS1Xzu6/rdxD3ZqBwBUkhUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4973

On 27/07/2023 3:50 pm, Jan Beulich wrote:
> On 27.07.2023 12:47, Nicola Vetrini wrote:
>> Rule 5.3 has the following headline:
>> "An identifier declared in an inner scope shall not hide an
>> identifier declared in an outer scope"
>>
>> The renames done by this patch avoid shadowing from happening.
>> They are as follows:
>> - s/str/s/ in 'lapic_disable'
>> - s/str/level/ in '(apic|mce)_set_verbosity'
>> - s/str/state_str/ in 'mwait_idle_probe'
>> - s/str/memmap_name/ in 'init_e820'
> I'm sorry to say that, but I'm not willing to go and figure out where
> that "str" is that there's supposedly a collision with. Please can you
> state such right here, ...
>
>> - s/i/j/ in 'mce_action' (the shadowing here is due to macro
>>   'x86_mcinfo_lookup' that defines 'i' as a loop counter)
> ... much like you do in this case?

In fairness to Nicola, that was given.

> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Function 'str' in 'xen/arch/x86/include/asm/desc.h'
> causes the shadowing.

which is the wrapper for the STR instruction.

It's used in a single assertion, and I'd be happy getting rid of it
entirely.  Alternatively, it could be renamed to read_tr() (or
read_tr_sel() ?) if we want to keep the assertion.

We're not renaming every other use of 'str' to mean string just for this...

~Andrew

