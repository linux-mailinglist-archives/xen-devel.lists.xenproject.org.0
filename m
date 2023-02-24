Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 925096A1FBD
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 17:35:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501260.772929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVb2Q-000453-Kr; Fri, 24 Feb 2023 16:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501260.772929; Fri, 24 Feb 2023 16:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVb2Q-00042p-Ha; Fri, 24 Feb 2023 16:35:14 +0000
Received: by outflank-mailman (input) for mailman id 501260;
 Fri, 24 Feb 2023 16:35:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V4+4=6U=citrix.com=prvs=412e064f8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pVb2O-00041C-VM
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 16:35:13 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 334f5f43-b461-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 17:35:09 +0100 (CET)
Received: from mail-dm6nam04lp2049.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Feb 2023 11:35:06 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6533.namprd03.prod.outlook.com (2603:10b6:a03:386::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Fri, 24 Feb
 2023 16:35:04 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.021; Fri, 24 Feb 2023
 16:35:03 +0000
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
X-Inumbo-ID: 334f5f43-b461-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677256509;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PyPsUbtKpA5ufh7NFR9eFdaedOoj/rxpC+0JXt9uPkI=;
  b=ChGXHExaetfi6vkBB8oWDHj+WEuJFXYaLzs6Qrb4uGNUyEZSLi6PtMke
   Z4aJISh6hRlyl/hStNTTgYTBXazIh/sb1k/QS42/X+yA77Ui7BMfOGCOd
   bJHf/50cnJcOmAsIjbvx1wFwePNIEdH3eB07vQ2ujiNJeL6rjfw0wsfwO
   Y=;
X-IronPort-RemoteIP: 104.47.73.49
X-IronPort-MID: 98439518
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:O7/uiq5PHhjkPW+PiDLG4wxRtAPGchMFZxGqfqrLsTDasY5as4F+v
 jcXWGnQa/jZZWvxcth2OYTg80gP6MTUztBrHlA/pCxmHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+45wehBtC5gZlPaoR4AeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m7
 uIqdW4gbU+/u+eq46KwS7kygtRyI5y+VG8fkikIITDxK98DGcyGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Ml0otgdABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCdJOT+zlr64CbFu790wCKwcvCwqCnLqS0VD5Z80YN
 h0v9X97xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnO0cSCEu1
 1SJt8j0HjEpu7qQIVqC8p+EoDX0PjIaRUcBYikeRAdD/Njno6k0lBvEStslG6mw5uAZAhn1y
 jGO6SQ72bMaiJZX073hpQyWxTWxupLOUwg5oB3NWX6o5R94Y4jjYJG07V/c7rBLK4PxokS9g
 UXoUvO2tIgmZaxhXgTWKAnRNNlFP8q4DQA=
IronPort-HdrOrdr: A9a23:Ivy3xKvpZnPeR09JJiTG2Pk87skCbYAji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H4BEGBKUm8yXcH2/hoAV7CZniRhILMFu1fBOTZsljd8kHFmdK1kJ
 0QFZSWa+eARGSS7/yKhDVQeuxIqOVvsprY4ts2pE0McegeUdAD0+4PMHf5LqQZfmd7LKt8MK
 DZyttMpjKmd3hSRsOnBkMdV+yGi8zXmIngaRsmAQdizAWVlzun5JPzDhDdh34lInhy6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATtMr9xsBFDMmsjNFQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30l8dFvU2z0mUUnC+oBPr1QWl+i0p8WXexViRhmamidDlRRohYvAxyL5xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqrEypunAv+NRjw0C3ELFuJ4O5n7ZvvX+9I61wXB4SL7pXU9
 WGOfusqsq+t2nqLUwx8FMfheBEFU5DZStuCnJywPB9lQIm1kyRhnFoufA3jzMO8okwRIJD4P
 mBOqN0lKtWRstTdq5lAvwdKPHHf1AlbCi8Q156G26XZp0vKjbIsdr68b817OaldNgBy4Yzgo
 3IVBdduXQpc0zjBMWS1NkTmyq9N1mVTHDo0IVT9pJ5srrzSP7iNjCCUkknl4+lr+8ECsPWVv
 6vMNZdAuPlL2HpBYFVtjeOL6V6OD0bSokYq9w7U1WBrobCLZDrrPXSdLLJKL/kAV8fKxPC67
 s4LUnOzel7nz6WsyXD8WTsslvWCzPCwa4=
X-IronPort-AV: E=Sophos;i="5.97,325,1669093200"; 
   d="scan'208";a="98439518"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k9eR73bjmjlCbw2L+Wm+DeDObUIUNbQmkh+SrFBzp+Xx6uy+vCDZslfKLLN8hOPLzlf6+LY1VgujJytckz+snLu+oPe448Uj7JQVWIln9CPfao+648HxxBlb6H1s6Iz9FIIbyCGjKq1RjYqxNMAHQosTCB257HGq+xf0b+dvf6rkKT5Vk2+atYK6slFEg5M31wS45B3THOrUUGpER8knnHSx5SbTHg48bdp9/W57U8MBtideolIPafDdCicgcgyMejZ+EDv4fdTfOAgC/GuwKTkj4CxPbFoUeNwbbZyYxC3d9Rm8AmOijT2Agq1CFl1zwXDgTnVVSK3DAnFQREsn/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pExa22XpCdf6FMWlmzdPxVnFn0mfgpC5FgLzzUVB3Rs=;
 b=EPn9ik3e5pNiqz3I1sgwxiVoYSBjUmVtzohMoKTrNe4m83HOZplHj4ZMIwmzOdy/J/9acXfxYdDMFGiXnQNbnSE7IdY4u7ycn/zsV/uiRD1e6RMqcRl6jFu6l0h7zkJ1GE3r6m50P1mtNkO7pxjOwZwkTP9YlUqmxTaxhppVJONbTYTqPVMxnFFTbErq3cQqXpOgMOaXIKgVP6eNO/1Z6LvtO1OT2H8sJ2xEtf4jMjms/Q6F8l70q1tIzbEsz9Rh1HmZ8fG4/oeGeTKvuvkJDDUu0lhlfVeAHSif0ZSTAeiuQMDYJpcr5fD/coRYNIg7WFVaEBBEtEjEVpYA53bWxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pExa22XpCdf6FMWlmzdPxVnFn0mfgpC5FgLzzUVB3Rs=;
 b=J54KjdUOxxnRKuUNXsF9wWntl3dJuZrBsCYiUj//CsmQUAB4mYSIRqMq+shB1km22j2v6cpFgMYvaenORpor3IolcSFr1vNUaZYM8Ls4G6ugkBDqc3Rhkoxr6vedbvYQdEBlLxCTnx6n8CoMyH6TYzVBCszf0OcKnu8j9UPz9X4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <705c2c21-5517-805a-101c-3bd67aec5039@citrix.com>
Date: Fri, 24 Feb 2023 16:34:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH] x86/asm: ELF metadata for simple cases
Content-Language: en-GB
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <20230220110439.1518972-1-andrew.cooper3@citrix.com>
 <DM6PR03MB53727DCAB918F421A26DD314F0A49@DM6PR03MB5372.namprd03.prod.outlook.com>
In-Reply-To: <DM6PR03MB53727DCAB918F421A26DD314F0A49@DM6PR03MB5372.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0006.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6533:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c171a25-0952-40eb-c407-08db1685149a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jme4CqXzb+kk+ZwlMYpXfxUjlEGRibM2nme9/q9zJGm6zkp9THoAIbqc0WHeIpuy1VtYxXVv8PwTCSSXddsMOaM6qJ+FUAxXp5TevSPfikqGnmS0TdjSZWOJsSx/7cXvrMPRTZLe8tcohZ96NX/zGmJgOA9K5tVXhO+DzUtPt5fcKJeJL4S0O4QWURQrLLZ85Ujzg4bSyFEu+JUqlNpJKxZoXUpq2VCUPHIee0zclBodoRDghpdJWxtPVBwGaCool1x5A/PD0/zaOkbqsIISahBdamzIBD3GWhNXfJaYov7iCVGF/RTBy/OmWUkBBJxmw5d/w8S+6OELcFBubvnX9Ozg4mhlrj0PeKSTTJKFXEidjbJqKnDwTdtFT+fvD0wQt/6Kq6AsJ9jd/muFEPKsuAlgRmb4opTm9b1ut6qQNwjoJYs2rrB70deeikKiur9C+LzxBAyXA3EPEo4LueDG55cxgr5/HuX4dB0TR9wnNKPFmty7JuEglVmp5zYiWpWORHthHEOR/4ur2PJ8KhpmArfUusC+tx/qVQ7ss3siekrvjefJtLNReW9CSMlHJlYkwJ4d86pxNMC//ymZlNGWIqIal3WmuZk5C7gDtz+CvU+Z6MIzZ75uVZk72kEw4IAbYYJdD/4WVv82RJ4ekYMUHHhcEZHfAfLzzg8Tfxyv8hyXgi8zjLuaG5xHEbTYwooag/wN8Ftl1gZ+7QEAnqUJSBt5emmg5m0e5VDLwXa0XNk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(136003)(346002)(396003)(376002)(451199018)(31686004)(2906002)(5660300002)(8936002)(41300700001)(53546011)(4326008)(83380400001)(66946007)(66556008)(66476007)(8676002)(186003)(6666004)(36756003)(6486002)(26005)(478600001)(6506007)(31696002)(82960400001)(86362001)(110136005)(38100700002)(2616005)(54906003)(316002)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHNQQ2N3ekhRYm9RMXBtRFZQaCtya0lMM2hHUVYrdEQ4bFZUZDZHZXFqN2NZ?=
 =?utf-8?B?TjllemNDaUNxOERoM1ZSVU9xUlRXM05EZjAvVzcyRkVkenlycUUydmNFbHhJ?=
 =?utf-8?B?cy9FTXBIRExlYWlsQUlJdW9CN25CdXBobUphVEJ5ZmdoTHpydkk4bXBkWTJv?=
 =?utf-8?B?ck50d2NTcGFTV3NYU2psd0NYMFgyZ28wRkZZYit2KzJLclR1RDdQRm9mWDd6?=
 =?utf-8?B?TzZLSmw0S3EzRDgxeHhoZkVkUGhaUE5qN2tyYVBrRDZkVFRGVW80Q1BSZFhR?=
 =?utf-8?B?T0tQTFVWcTZ3VXZjTkJON2RxL3ppLy9yWkFOdXFmQmIwSGxsZVZxUHdVMFpt?=
 =?utf-8?B?Zm1uWHo1T2haQXV5dXlrdzlGZGRkSmNscnlOczEyMklLTEpMU2NDNnF0Mnd3?=
 =?utf-8?B?YitPN0RHVjBSYUpFb0h0QVdod0xDMHc2U2ZIOWxRc1l1ZzNGc2EzeUJpMjhP?=
 =?utf-8?B?bktVeWhod3Z2bU9uSHlHQU5mYUZTVk1DYkl0MkpSTUIzMkt3R2J3L1FseDFU?=
 =?utf-8?B?KzFGNVVvdzdVV2FBeGE2Qi9ISXRxbGFMUm1JcDNob2NUUDJibHhMODZJZjhj?=
 =?utf-8?B?OUY0Q2hYNXp4SUxpKzh4YlNkMkZRTS9mVTNaN0R5WmpyZHFEenloZzhMcTFu?=
 =?utf-8?B?clFQYStXT1NVYTVJa3V2b3BnZHYrK3ZoN3lNczBqeTcwd1hqQUdUa0lpa0l1?=
 =?utf-8?B?WDhaMVM3Qkl0MU9lQmsrZ2tvVTliQ053bjkwcVlSS2VZOC9Lc1ArWkNBTW9M?=
 =?utf-8?B?Tm9tcDZvZ2E4cGJZQmExZklRM2tzajNNK2twamVVSnFlbzhjQjZ1am5XaURx?=
 =?utf-8?B?YnNrRjBSeUE0aVdqMGlwOGU3VC9idURkVURwWWVwTml2UkVHMmsrNWtpNVMv?=
 =?utf-8?B?QkRvdGdNd2JSR0dzNnR2anloT0diS0VScVR0bmtXYTR6N3hsakxwZFpZejZn?=
 =?utf-8?B?ZDB5YW5wclNpaUsyZzhvcUVBdEE1a0NVMDgyOEdtTjFqckppY3l2ZWxweTlr?=
 =?utf-8?B?b1krL2hlSTFybUFDdXQzVlhsckdJQ250VDFlcXNtV1ZqY3lFd2hBTlZXUlRy?=
 =?utf-8?B?amNURk9zak52N0VJSUV6REZ6ZnlOWGcrdmVBQnpLa1lQYUVhRGdZc3JQMDNO?=
 =?utf-8?B?RjNpbWFSK0lXby9takdYRE9LYnQ4N2I1Qk02ODhzSDRXNmNSaVJUbHg5cGN5?=
 =?utf-8?B?bUVreS9nb0liL0tvTS9CY25KZjlualRBclVhdXI0Mk1LYi90QzdZenpRcndT?=
 =?utf-8?B?VXh4NHJCZm9QQkpUVmVWeTVUMC9RK3pLaElzZ3hTTlVGY20xbVVhaWFhd0lR?=
 =?utf-8?B?WWRTS2U0U0lYM0hkYkZrNEVQT0xFemFPelRMQVgxNVlqUDJWa1NmZmZzVTNl?=
 =?utf-8?B?dEdzNWFsQ21lSXJrcW4wNHhhV3hvQmJyaDU1RlhUbFp3T09ZSS9sTHVkSzhh?=
 =?utf-8?B?eHFQRkZqK3JqKzRDdXMxMHJ2ckhrekppR1lSUUgxUThnVkllM1prNVVSQjJM?=
 =?utf-8?B?WllGTG93a1hVT0dUODhLZHZvRkNhS01PN29Lb0F6aVdDZGxYZmwyT2lmYWJj?=
 =?utf-8?B?L3hkVVZ3M0dKNExRQUl5MUJNV2ROYkx3R21vVUVNVjdoQ2d0UHJXQkJHRVJX?=
 =?utf-8?B?WmJpdDYzcFBrZTlmOHBONnp1TGNIbG1LdDhyQ0JSQ3h6ajRuUXRhY2lacGNl?=
 =?utf-8?B?U2Nna1h6OVNvY0dQUGpEUU9nViszR1lVMm9EVVYxTGZsckRVNnZxdktpdUpo?=
 =?utf-8?B?ZnNkV3JsaGJic0p1SXl0RnJ5dy9VRzRCempteWlpQzg5QTFvVGdxaWthZ1Zp?=
 =?utf-8?B?TS9ZTGFhT3cvR1Z6T1piejBpcklYWjFXU3FDcmxMQkVDLy85UEpJQ0xsUVYr?=
 =?utf-8?B?cmp0ZkxOSDRPNU9FZDFpR1gvdFFFckJhWGhkVGEvS2FXdFZYa0dmT1NHUzNm?=
 =?utf-8?B?bHMxUFFoQjlzMkNiN2hITEhSWmRwWDhndnk0VzIxTXowY1lqTkV2ajQxUlJU?=
 =?utf-8?B?ZHREZFg0NytCK1FpVWRUOW1qZVRaWEo1QXpIaC9tanJRc2NJdkQzby8vTnMx?=
 =?utf-8?B?YWorQVdPRjZxeXdJMnp4dU1TY1UvYUlNNWJodks1djk1Y0EvbGhWOWRJQ1NH?=
 =?utf-8?B?cWRURll2TUhHREVhNjlHSXVUSHc2bzdGMVdEVFFyZ0g0MC9HK3RldXhicHRZ?=
 =?utf-8?B?cFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	c1j7x2F6a2MKIzx/ZhGzEhn1K9sKhjrJ3nFY4zYKWJoJ+SSksE4TQOpsb45q5pYIuyzFaZrybFfwdywq3qrWF8R+CtyINlhR0U+ubF0dW+43RW70442w7lhrUE5W9nbmp37oyUibU2gsqf4Voe0z3DhHxYxpCIzqywh9Uvs+P0e2Hx33ytjDkvGtCCZ+uHQj/mtkdE+cZWJ8QYH459SNrgeYrCs25MQT08m9Tulti9DEkEPAqTZUUaWu9APaeG0AP2vj1Li7Nj/MBfqzmPm7SNKY+0sDx5mh/Q4WgidXCxOG+2HtCf7VHtt0T0ErgQT5U24EoQQgoh9jtefoX+yp86zUde78xKyVL39+faFcCy6oyM+OVmWayTZAfjsjk2Vuxg7Yma/0uYYnYVte+MgGMpSNrWWb0unKAL3gMjmx+Io/Mo1rJtyhMQJbRM2UFwbaqCTEBd0yy37pVuWphpkrPRX6f5CdP2VMG0gl1XiKkNuerCdtUYlreStyOSMZpaB+T8jgyOWCUkjNwwRwOG4Wafw7vTxmnQ2qID6LKj+7DC/Cyg2CQIxkklwn9sHnTTvUbDWQ84zDVeTwmll81N5W8MM5vCNPiaoB5oaDSn3ZAoeh3KHgDBMB6g3AtUvfLlGGVbWF7MDFv34q6J/ppoWC+WYeqQRTJ1+0+D0Zjfc9eDJWVCUP0rrPBzL8LFLAebLdQC8j5uUlvSIv5UbhsV+Usx2WoSDA8qG0wWEq3O9SmqGlO7OzeGaLuDb1X6+uaL2TIjZOZSl7LibFP+XJ0bMsYGE33KyigsNP4JpiSnmqJTutuALD4AS9/spL2kyMQeKNxMug8kdY7ftRQAos2H2DjrG7O04Yh3a30pNo48IWqic=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c171a25-0952-40eb-c407-08db1685149a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 16:35:03.8017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HKkjyXIE2n3Gl9B4T4Ug78HwzxC7CdgqxWYmeurxkji2tLaPFXYJ8fzblRCpho+tcA4sQzwQswJ0ZJcSXi6AwHtSdMr+h/rw4xJnqURx1uk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6533

On 20/02/2023 11:51 am, Ross Lagerwall wrote:
>> From: Andrew Cooper <andrew.cooper3@citrix.com>
>> Sent: Monday, February 20, 2023 11:04 AM
>> To: Xen-devel <xen-devel@lists.xenproject.org>
>> Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>; Jan Beulich <JBeulich@suse.com>; Roger Pau Monne <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>; Ross Lagerwall <ross.lagerwall@citrix.com>
>> Subject: [PATCH] x86/asm: ELF metadata for simple cases 
>>  
>> This is generally good practice, and necessary for livepatch binary diffing to
>> work.
>>
>> With this, livepatching of the SVM entry path works.  The only complication is
>> with svm_stgi_label which is only used by oprofile to guestimate (not
>> completely correctly) when an NMI hit guest context.
>>
>> Livepatching of VMX is still an open question, because the logic doesn't form
>> anything remotely resembling functions.  Both code fragments jump into each
>> other so need to be updated in tandem.  Also, both code fragment entries need
>> trampolines in the case that patching actually occurs.  For now, just treat it
>> as a single function.
> If it is treated as two functions and both functions are always included in
> the live patch, would that work?

I think so, but only because the first jumped-to label in
vmx_asm_do_vmentry is beyond the trampoline.

But I guess the question is how to tie the two symbols together.  We
don't want to be hardcoding this in livepatch-build-tools IMO.

Perhaps we want a CONFIG_LIVEPATCH build of Xen to include a
section/note/something identifying "grouped symbols", meaning "if
there's a delta in one, include all even if they haven't changed" ?

I'm getting the distinct impression that we're going to need it it for
the PV entry/exit paths too.

~Andrew

