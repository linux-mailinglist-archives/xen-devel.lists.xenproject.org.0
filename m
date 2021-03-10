Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CB9334164
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 16:21:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96186.181764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK0eV-0007zv-7z; Wed, 10 Mar 2021 15:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96186.181764; Wed, 10 Mar 2021 15:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK0eV-0007zW-4e; Wed, 10 Mar 2021 15:21:35 +0000
Received: by outflank-mailman (input) for mailman id 96186;
 Wed, 10 Mar 2021 15:21:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RhJS=II=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lK0eT-0007yq-6T
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 15:21:33 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d761b26-ad07-42c9-993e-186b275fdd33;
 Wed, 10 Mar 2021 15:21:32 +0000 (UTC)
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
X-Inumbo-ID: 6d761b26-ad07-42c9-993e-186b275fdd33
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615389692;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0lw+XttI/U+q/0C1takvXkcHR/ueXJ4eOCiTQ/mA3ZM=;
  b=d+iAoh451IdUuw03F7MgRAO1Zr5v0mg/GyToZYo9i+ujJbtU9IfL/LTi
   26zYvXuMcWylloM227gyG0cLZeeJG84vrNpxPv/Gsj8crdztKfZcoPB+N
   r6h2D3dsVOKRuJqNek13oa1zpGzvvuH3WkciB3tlFr7UXYGSAkyGfIGJd
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jfqrJkF57zbpyDiou5eauw2q4i4uhyPjNG6iCKLatSD1+jkbfNCWiHrTThud5QwsNSnmPdbpKS
 AYnSl9xgFQYZd0maVox1zg10QgYRacV/HAod+yqjX4pMQJxzp4xCmAGMHIDvjw4Zg3DlUjqian
 aC/ShkaTgUqBjlw28jW4LcfE3/4ggnUT8iMwb+LqTvXz1c/XqGrLmkgf0Tksg6jhEefWoi+fsM
 +cF35hflepRUHIAaMiyzAPEpZjOCmFktZBze54iJBiofg7kNdh51glRxFVf7R1pncY2yE65b7e
 wPM=
X-SBRS: 5.2
X-MesageID: 38959254
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:VKG+la1TRzd/UsZAiIG/IwqjBR13eYIsi2QD101hICF9Wvez0+
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/BIyKErF/OHUBP9sGWlaLtj44zr3iH6F0TFmdJ1/Z
 xLN5JzANiYNzRHpO7n/Qi1FMshytGb8KauwdzT1WtpUBsCUcFdxi1SYzzrdXFebg9AGJY/Cd
 647s1IuzKvdR0sH7qGL1MCWPXOoMCOqYnvZgQICwVixA6Fiz6p77CSKWnm4j41VTRTzbA+tV
 XUigCR3NTej9iX6D/5k1XS4ZNfhcf7xrJ4ZfCkp8AJJlzX+32VTat7XbnqhkFNnMiO7xIQnM
 DIs1McOa1Img7sV0WUhTeo5AX6yjYp7BbZuC2lqF/uu9bwSj5/K+cpv/MgTjLj50AtvM5x3c
 twtgrz3fcnbmKj7VDAzuPFWB1wmk2/rWBKq590s1VlXZYDc7gUlIQD/SpuYeQ9NRjn44MqGv
 QGNrC42N9qdzqhHhTkl1V0zMfpdno+GQrueDl5huWllxJSnHx/0nICwt0eknoq5PsGOul5zt
 WBHaJymL5USMgKKYp7GecaWMOyTlfAWBTWLQupUBraPZBCH0iIh4/84b0z6u3vUJsUzKEqkJ
 CEdF9Dr2Y9d2/nFMXm5uwLzjn9BEGGGRj9wMBX4JZ0/pfmQqDwDCGFQFcy1+O9vvQ2GKTgKr
 SOEaMTJ8WmAXrlGI5P0QG7cYJVM2MiXMocvct+c06So/jMNpbhuoXgAbXuDYuoNQxhdnL0A3
 MFUjS2Dt5H9FqXVnjxhwWUdGjqfmD54JJsAInX9+Ue0+E2R8lxmzlQrW78ytCAKDVEvKBzVl
 B5OqnbnqSyonTz3Wug1RQvBjNtSmJupJnwWXJDogEHd2nud6wYhtmZcWdOmF+OJhp1SdLqAB
 dSzm4Hv56fHti1/2QPGtinOmWVgz84v3SRVaoRnaWF+IPDdo4nCI0lHIh8Dx/CGRAwuQsCkh
 YCVCY0AmvkUh/+g6Ssi5IZQMvFccNnvQutKclI7VTFtUudoskrbmABXyGnVPOWhQpGfUsQun
 RBt4skxJaQkzemLmUyxM4iNkdXVWiRCLVaSDieaJ5sgbDtcgFoRWKsjTiX4itDI1bCxgE3vC
 jMPCeUcfbEDh54tmpD2qjnyl9ya16QZll9cHx8rI17G1nXo3ob657/WoODl0+qLncSyOAUNz
 /IJQEfJQ5j3Pib/h+YkjTqLwRq+rweesjmSJgzebDa3X2gbLCSnaYdBvlO4dJOL9b1qNIGVu
 qZZi6YJD71EPkSxgSQv3opURME8EUMoLfN4lnI/WK41HkwDb7uO1xgXagcOMzZwG7+RfqEua
 8Jxe4djK+VCCHWZdGHw62MMGIGBRPXvGKsT+Yn7bpTprk/sbNvH5/dFRvEvUs3qikWHYPRrg
 c5Rq8+3ZXqfqlIVOYWczhC/lUomM+URXFb+DDeM6sbRxUVk3TfP9m1+LLGprokP12ZqGLLSC
 6i2hwY282AYjCK2rEbAZ8hOGh6aEAz73J54eOJHregQTmCRqVm/FCgNGW6f6IYYK+ZGa8Iph
 IS2aDFo8anMw750hvXpz11P+Zn9HumW9q7BEapFfRT+9K3fXSKja3C2r/9sB7HDR+6YV8fn4
 tLaAg5adlCkCAriMkP6ReJI5aH6X4Noh95+jFollnkx4ig7iP6JCh9QHzkq6QTeyJSPHiOhd
 nC6s6C2h3GkWN45aU=
X-IronPort-AV: E=Sophos;i="5.81,237,1610427600"; 
   d="scan'208";a="38959254"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhgYR3tqGq/bXzstD6SNwkGODcJNqt59pcL7uY3/QgRXu8puI8ITRtUrVHxuxfyv80GKHLmvmiM+8/sxAEmno/HWCS1NqdG7UzAi/m85lh1UyqJU5dtZr44hhVRayLy5Q064jdH0RScQDaDw4LIgSiEf7ocVJpJiaqf6oqfANSdskJDpw+og1ht6Cg4D7OXfWwo69ruD4iu6WYB+vmPFPgDj5qsOLQbglx15AWIJ2rPvJVYZ4qr/xAA224mYJKrc4C8t2eYQxRQe6VIr5bZDzy4/V7q2bSrGynXq8bTaRhpjWSrI5smd0FyHmBhu2A4qwXkRA1s5aqDUkdsEqasskQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6+eE1L6ahTfk9aniyrLBSNW88CqnafowSvsmYjkTNE=;
 b=oBM18A4Hn7zZtNFi5UkQdWuOSZECEkHzQxCnZkYUPEpUY4jE+a5FZe++RwKEuuMOS7MRglhrTzL/TBII5AADp/8ZEAoS+7XC/7TG0/DvP8AkexOJLkxYf+VnzTDCvuahIpturzRbP9GO/Kc9LWtHvuBxbvy3x1okPsSmBBwrVywpbJn5ARtWa7xpEgveUPLM4ZtCIF2kuFmcg4cgxOrduIJEFoGqk1v/SSoFweWsNnijyEpoIjqllYCa+gcnhmxybGE94GVCvJ4Q+ccHy6mFzdisAaCNeN70xDzeqN43LskgED63VOWF9m/7QgibuWykV4aRIQTHKUxn0gD50VPm2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6+eE1L6ahTfk9aniyrLBSNW88CqnafowSvsmYjkTNE=;
 b=qOsre+o0H1yV3xfVEzxmBfa1xaoAQEubnXH0aWca5oYiEwDFrY2ZjVi7EMUCwimNneo39O36awB2AqPQ0w5l33v2fFeom8NAarbPOjISy5A7tKnn3GWNWT5HjxHy6fxQqvXjQfua9mIKh6x2TNtA9GCMwEYMjFV6sUCGDBZC+10=
Subject: Re: [PATCH for-4.15 v2] xen/dmop: Strip __XEN_TOOLS__ header guard
 from public API
To: Ian Jackson <iwj@xenproject.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
References: <20210310150722.27194-1-andrew.cooper3@citrix.com>
 <24648.57971.488443.593050@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <04a54768-e1ae-4fc4-caf4-50327920a4e7@citrix.com>
Date: Wed, 10 Mar 2021 15:20:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <24648.57971.488443.593050@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0482.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4090e78e-2ab7-417c-09f1-08d8e3d81d9f
X-MS-TrafficTypeDiagnostic: BYAPR03MB3989:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB39890EC429BA4E708E448717BA919@BYAPR03MB3989.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5j84QCZ4VA+0iP0TLzei/W2gXdSomSemMFUvrxJJGhox4V2obO7WHKtaBFe5XePyHcE4J4xQaL1L5U7UG8SXPqJNzCh7mRbDrb6FjtJh/rQDpPXPLC7FTvFz3vOCRW+SHcwpom9h86+ScNXpK3ZPf2c2qhXsEM/dkqEip+6Zic6KpwTZqOj3rvAjf1b96WV0onQwGiyoGqLDN2mi7JUdEIuvzxhri0WFFDtdpAzFrG3b0SYCoQlvfdSxWIarz4DnWaX6vK3UNRvvYPhbc+dkXB3W4p+SdOukZ4LyWK7A4Vwfo2KzJoiM0g7C7KsAnsXEfbrfFkkmaJEOlU+EhIAxdx1jO2r6+5E4eSF0F3GSphpm9Y1oGvarqcAh0DPwFWI2zpBQM8gbtouIZPOJq1Nuhdh1avdYPMQcriDOl47tjpWerNy3DMe2aQToeokr+DnHQFN/ZZXFcXBVgWcV4Z6ttsSx0sPzweu5FesRiVsiVhWeavZLSJqr+eRCWsnv/wFZXvHtDpy/uwxKUPFeCGHoJphPJTi40DwT/zx1k3kO5ykRI3mYAnH/efoArF5UIJlTeopdQyOsx6iczZkqR66i1VvOwaP/JDC4wmBEHygYAzw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(6666004)(26005)(6916009)(83380400001)(31686004)(86362001)(16526019)(36756003)(478600001)(53546011)(66556008)(186003)(2906002)(956004)(66476007)(5660300002)(8676002)(2616005)(6486002)(16576012)(316002)(4326008)(66946007)(31696002)(54906003)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Wit5SlIyc1NDRE56SDhWWDZ0byt4Yitja1RONVlSTEl4MVYrYU1sYjNVSmRl?=
 =?utf-8?B?RjNydndNSlh5ZStRRzl3N1lEby9UVzAwa09GWUY4cTk1djRaRDJCQUc2REZs?=
 =?utf-8?B?YkVpYXpETU1sTERHa29tbW1UTWRCMHpRTUluN042bk9OUHcvQW5xY0lrbG8y?=
 =?utf-8?B?K1RORktla0d6UlYxUmVRaDVQVGc2cExkSWdNWDJvK25IeElnRkNuVUNqUWpl?=
 =?utf-8?B?UitHbTZKYVhFWEM2U0RaMkJSUWsvZlhXS2lXTm5VV2JDWUZMaTBkWnBhOWJE?=
 =?utf-8?B?eGtmTk92K3ptRzdDNmZjU2FaM24xYWp4QUJEZ0JQRy8rbGtDSDdrTEY4Uk1s?=
 =?utf-8?B?WXhvanBMd0R4VXd3TDdGS0I5a1JFanNFRXNwL0ZpT1lDTXNLU1RlWE91dm5M?=
 =?utf-8?B?YzlqTG1IVW12empwdWQyTUEzKzNjTXlPTVZaeXI2U3hRVC9oakFZekJoWDhF?=
 =?utf-8?B?aHN6VE05Z2VtVXlndDBYUHAvYWRrbWxnaVpESHNSSWVGRE9vWWExeWQwUTln?=
 =?utf-8?B?RGx4SmJWY0ZlTnhiSWE4VFM4NmE4MHlrTkV4ZldzclNXNWErZ1NLOS9mdXhz?=
 =?utf-8?B?SkNvbURMOHZrTnQ5Yk0zSEp0MHcrc0lMTVFmUGxuTWZXNG5pYlN1Z2dDNDZ0?=
 =?utf-8?B?R0E0M0dDZHFSTTBnN0FnNmNyK2FCNU9ndkl5WVRCbjI4ZE5TaXFUZXNzU3BD?=
 =?utf-8?B?NU1SVU5mejRhemR2aUZYY2xibXoydllha2RmYTdObDc4OHRQQWhYTnpxY1FC?=
 =?utf-8?B?dnFLMWxnRWw0R29tK1Qxa1V2YzZITThyMWVobk50ZUJtL2ZXSjMzeFZNTkN2?=
 =?utf-8?B?YUxZWFZIa0JQVGNKdFh0ak5vSFdpZ3hwK042ZHhNRENMaHQ1Y2ljNGVYSy91?=
 =?utf-8?B?aVFycktTb01GemQ2dE84Qmw2anN4ODlnNllXVGdmWFdPelBrUW4yaTBaY0Qw?=
 =?utf-8?B?UTJ1cm9YNHpRd1dZTnF6NDlPRHR4TEhjcWxzOEg3NnhUTjEzNjFLVStlS1ll?=
 =?utf-8?B?SllCMWFCZXl4Yk5idUtaN3NpSDZwTW01eFVBN084VzlDM2lpa3QxM3JNT2RY?=
 =?utf-8?B?amlLRDZRN3dGZ2NvYWE2TnFaT0pOQ2MzdUg5Mm1ScWN6eW1JcHRzNGVtT0xG?=
 =?utf-8?B?ajFiWmxRdHlMbDBHbUlyV0NaOEIva21oTTM1V3drTDlRTjJqTGIxMkxFd2tj?=
 =?utf-8?B?eUhic2M4NzlxLzZ1eGRvVTBPQ3hhKzhQeW8xN2lZazc5VG5ldE5PMjlLc1pI?=
 =?utf-8?B?N2ZxOTl2bnkzdTl1UjU2RXl6N3duOWlwQ242RExtdjhUanV2TnZXdi9jZE9T?=
 =?utf-8?B?WWlTNUtEa3RuL292S1NrVktZbEZld1FoZHJLWHBlUElEVDlVUHBVZlU0U0c4?=
 =?utf-8?B?UHI3dmhEbTlkVDdjc3VGcE1RSmQxL3pwdUY2R0Vwdnlpb0c4bTlyOG9ycXpr?=
 =?utf-8?B?Zm5RSDV6ZTRuaDY1NFFzUFMxL3dOKzFpSHUwSUlLeUhzZ0grek1sb3F2UWtI?=
 =?utf-8?B?YyswU2V2cy9pNklCZHRVUld5eWZ5OFhubGluZWZzYjdTVEpZb3M2VFRDVDQ2?=
 =?utf-8?B?UjBBS3RldXlkUDByaGd0STFoa0ZMNEMyUUpzdFVzTXZoY2xzUHdyRjlzVmNi?=
 =?utf-8?B?Tkh6dlh3TEpBeGtvWGdPTVNjbEVwckFZUFVWSjVyY2Q1WXJGRXRMNmk0OThm?=
 =?utf-8?B?VG1jeWJCdjE2Q2lmTWxPSG5jZmgyZmtsampaY2hqekxYdGZTa0RoZTBHRkVX?=
 =?utf-8?Q?8qMjZEr7DB868ifoGZ7O3imGOsyd1pkYDCQrbzO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4090e78e-2ab7-417c-09f1-08d8e3d81d9f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 15:21:02.3737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5p86vNtVzAiuoBgS9W53RHMDtjRNR+nTrXqV9wmmlXcb31GgNb9IDT8CveCGvO30VABrJRWFFY7nYGc+bFakkJXl57fYKpoz5Z9YXoixztw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3989
X-OriginatorOrg: citrix.com

On 10/03/2021 15:14, Ian Jackson wrote:
> Andrew Cooper writes ("[PATCH for-4.15 v2] xen/dmop: Strip __XEN_TOOLS__ header guard from public API"):
>> Exactly as with c/s f40e1c52e4, this is inappropriate for a stable library.
>>
>> That change actually broke the build with:
>>
>>   include/xendevicemodel.h:52:5: error: unknown type name 'ioservid_t'
>>        ioservid_t *id);
>>        ^
>>
>> as libxendevicemodel.h now uses a type it can't see a typedef for.  However,
>> nothing noticed because the header.chk logic is also broken (fixed
>> subsequently).
>>
>> Strip the guard from the public header, and remove compensation from
>> devicemodel's private.h.  Fix the dmop design doc to discuss both reasons
>> behind the the ABI design.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Release-Acked-by: Ian Jackson <iwj@xenproject.org>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Paul Durrant <paul@xen.org>
>> CC: Ian Jackson <iwj@xenproject.org>
>>
>> v2:
>>  * Patch dmop.pandoc as well.
>>
>> For 4.15.  This is a build fix, even if current staging can't spot the
>> breakage.
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>
>
> I am going to stop giving acks for this kind of thing fairly shorty.

Thanks, but you already release acked it.  This is the requested update
including the documentation change.

~Andrew

