Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7880C6962E7
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 12:59:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495171.765453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRtx4-0008Dx-22; Tue, 14 Feb 2023 11:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495171.765453; Tue, 14 Feb 2023 11:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRtx3-0008B0-UJ; Tue, 14 Feb 2023 11:58:25 +0000
Received: by outflank-mailman (input) for mailman id 495171;
 Tue, 14 Feb 2023 11:58:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QOgc=6K=citrix.com=prvs=4026bb75c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pRtx2-0008Au-Vm
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 11:58:25 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0188c3d-ac5e-11ed-93b5-47a8fe42b414;
 Tue, 14 Feb 2023 12:58:22 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Feb 2023 06:58:14 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB7097.namprd03.prod.outlook.com (2603:10b6:806:332::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 11:58:10 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 11:58:09 +0000
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
X-Inumbo-ID: e0188c3d-ac5e-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676375902;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HaK3ePrXX9nflu6LYWWlGatVh+v1CVHg4ga9PW2+vkw=;
  b=G1h24s+OBFVbqcVv0Kldr7Ymx8p6q3acPeXISD4Pw2UAD9T2fAnbK/Uh
   3HVw5MASBpEDul7eLAL0kPeP0AJg60GBa2egwZdVtkxr/b4ifep94SFzF
   QWIWyE6E+Z4uQj4wdWdyUgA5zWsAopPVW5udkew8/vt3HGUBXUtNFjXXi
   E=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 99382226
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:di8Frak8LKYWxJt2LCPCRVno5gxNJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdWDjTP6qMNGejc4sgbY218xkDuJCGyIJnHlE9+y80ESMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgR5QOGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 fcqAyE8Uh+vvM6R/uqfGtlyit8eDuC+aevzulk4pd3YJdAPZMmaBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3iea8WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapDReborKQw3jV/wEQuCwVGFlScg8WaoVOmfvNhJ
 HcypgUh+P1aGEuDC4OVsweDiHuFtR4VX5xXCf837CmEz6aS6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hTi7IyQSIEcJbDUISgZD6N7myKkolQ7GRNtnFK+zj/X2FCv2z
 jTMqzIx74j/luYO3qS/uFrB0zSlo8GQShZvv1uGGGW48gl+eYipIZSy7kTW5upBK4DfSUSdu
 H8DmI6V6+Vm4YyxqRFhid4lRNmBj8tp+hWF6bKzN/HNLwiQxkM=
IronPort-HdrOrdr: A9a23:XlAzJ63EBeQiXT/Wz9WATQqjBIgkLtp133Aq2lEZdPUCSL3+qy
 nIpoV56faUslYssR4b8uxoVJPrfZq+z/9ICOsqUotKBzOW3FdARbsKhbcKpQeMJ8SUzIBgPM
 lbH5SXp7fLfD5HZWqR2njbLz6AquP3lZyVuQ==
X-IronPort-AV: E=Sophos;i="5.97,296,1669093200"; 
   d="scan'208";a="99382226"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frWxiH/YVYZa2EZp8WF6dsYdDk+/g2nLn7UcbQpwT27EnM8+39SSg5XrlAuFPmVMM/rKnQwmulUfOAgMll+rhfEtnJpbEPwbrj9DF9G7MrvFZjSx43CHKKXrNtH8ayKDaCSNfUhOSCNR5M8kaydcCCoLh+gfauB7BouTmLweQGtF4qmaNeVbTLGQ+y4lUCY7bbIxmiujJaKfx7aWMwnspxN11P6DrScvpj3LrJboGxiOAP9etjVEL6YME3JheBWcpXW+2aHVhNu7jB6GO3UV64NCSb6XoMsyzqVNhzBJXGj2UpOUw9mv2Uq++tKBM06S+JAz52jYqNZjTbHLqmUJRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=spQBPUzJIPrxQeUq++zvMHshUrUUmFLw95ug0OZlx68=;
 b=QrQhyv0xagcqtmByfUXi02yE+QfiWoovRYYLNClHC0lO12ZH82UcYJ+H8XkrRkiDKNonQkGNk66WTwvnVyZw/QMeFhAmkvCPBIyg+Agf/D5ckhsbxYhHTYp9zYEl1Nv62eI2i6g/WcQwEQJlIipkzNtJj7cuKHdDVBxvLymUQhNnKgqwkrFN8raeI1QeuCVsjgxL8b/kgsPyvj0NEdJArofHDI/GpbIXeBS0aoBdu8E6WeBk66cD38kKdC901qm+BLFGEHP8Mmc3oibWAkDnIRFfm2qYG1lsN5bD3KRNbmx2KGuR5riuMTTTQ7xJbFMW3tgi/07PH7/nfAoiq3wbMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=spQBPUzJIPrxQeUq++zvMHshUrUUmFLw95ug0OZlx68=;
 b=ULvr2wESFgIZ+rXfLRi4D4CV5FU24kB8RgaXdo1wvK6RMyNOpdRS0gvWptSAIfzOtFER1VGbfqQ81izNSLQuifKj/3C8T7WEj7jgnB/OCILR9A5YDqI3G5meMIBw8zr6zehT2zrw2V5R21hH/KuFcDGElhRsVEuurokg1gnI6Pk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <fa5f26c7-93a8-4131-22f9-f96e530b8a5b@citrix.com>
Date: Tue, 14 Feb 2023 11:58:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] automation: Add container and build jobs to run cppcheck
 analysis
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230213142312.11806-1-michal.orzel@amd.com>
 <a4ec0f27-4f66-def7-bf76-74d9777671a2@citrix.com>
 <a9102f8a-2bb9-48fc-ffa2-96d86610a002@amd.com>
In-Reply-To: <a9102f8a-2bb9-48fc-ffa2-96d86610a002@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0073.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA1PR03MB7097:EE_
X-MS-Office365-Filtering-Correlation-Id: 09f869ab-923e-4464-9a6c-08db0e82bdb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AUDSPBTA9fNbkKaFlTDwZV2aH8JNINBOuHdwz1Oz8L7CbKnjZsVw3plpD20CXxIGHXIeQiiTABrDCCXiTcP7GtPWh0GaFk33H/fNxeWiOxH+7UGxVx/dFOC+75eRnuEiBN3HdXjUAX0N4r+rJSp0B3rRGBKGf8mUa615hv299g57GrNVAMvhjG+AZmVU5lSynV1RVyWMw++qJnhCPrlpRl8eKNw7tmmjVlIS4vkGQmafM6bTEOBruoaYlipqhsf3i0FasLYShxRwZbnHMaPJwTYCcWDuKzg1zPXJl9lSEY5JArIR4TUeHpJh6XUHo+wExaRFTietzeUBrqpDylf9rqPZ5pIYanvGW8bSU9RHpkKVsR9mhsHzDGeJkFaxWI1a+9aj4jtwh0ftU2LBD8fE4CPX+nb24hVZp47+oBMis46whj9waoSOc5GtG/ettd67GnOOBxnRcPF+lja74xsvc8va2DKSNhIQxHYPyZY5KnZ0w4ETE8gSv1/S9w0mgk679lQJnTmd+1TcnNhq5bsPW8+cBAttoRkRJw2tfIIBSY000+ewbqsBGKFg8L9lPMMsO2ovyITslNFyWLO3QS9h6mhC9xxikunktgPnzUju5JzKH4txgFth8YCavGqBv4I6Up/Z3gZA7C9R2GwZZe3GPkVfqT1u+O53qywjcx52ao6F1CUpQafhnsFN5KdFeaftchyWusWYnXYwKgzAEVWvKf2824qlQgOPJqr262do4aw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199018)(36756003)(82960400001)(86362001)(31696002)(8676002)(66556008)(6486002)(54906003)(316002)(66476007)(966005)(4326008)(66946007)(478600001)(2616005)(41300700001)(8936002)(5660300002)(2906002)(38100700002)(186003)(26005)(6512007)(6506007)(6666004)(53546011)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHpxeXdlaDJmL3VkL0JKRkNoMTN5TUc2Q2FOSW0rTnVOb2tibGFmcW83L09k?=
 =?utf-8?B?OExIdk9vdkU0bmZ0a05TSXB0NkNBd3h4eEQyYndnY3lEVjlPYXBHRXEwL3Rp?=
 =?utf-8?B?TDF2UTZ4Vllxa2lYTlFoU2l4WkNoT1hsTEpyRm52Y3lnc05jdU9vT0pxQUFj?=
 =?utf-8?B?TVkyTjZWNzRrV0xGQm9iS014ZmNLalV6aEk1Vjc4M05XVzBmUWZKT3FCbi90?=
 =?utf-8?B?V0ZyYWJPVWFRTWpQOEo1a3A0VlppOGNpQjljN2xmWDN1bzZUUjBudlBSc05p?=
 =?utf-8?B?VHB1YUxkSkFFa1lxdmZ2T0s4QWFnWnpyRm12OGFzQ1hxWmlZRXNpVHlFcEV1?=
 =?utf-8?B?SVNqMUxDTTdUeURqWlJXeTFId0JPemFabFVBTi94QzFjWExEUWRKVStKWGNO?=
 =?utf-8?B?eUVCZ29meWN5Q1Rhd2lVUDRHazZsUi8zYVJVK2x3UHlaaXdrN0grMTdGWGIy?=
 =?utf-8?B?bEwrcGpRcnZXSkE0YlhvSEZmNjRVdnU3VU1XVVFqNFdyN1dBOWVZdVB4M0dN?=
 =?utf-8?B?VnhZcXRyZlVNRXRwVEhkWGhNMU5YUm1tbTBKL2krUSttT2xtNnN3N3lwR2ZV?=
 =?utf-8?B?N1dSZ2pIcHF4UHIvREptdlVaSGZDK2s0WWowVDJ3UDcvMUpYUDNIb0FhK2hO?=
 =?utf-8?B?OC9IOTZHbCtuWGhxQ05jQkFsN2tqK05FbGtaTFJZR1FTTGZZQ1pFUTh5RFZD?=
 =?utf-8?B?V0tuMnVhL1pMd0k0bUM3QXBaRFNrRTRwQ21EQ3lJUnBnYWJDZGM2OVZzb3ky?=
 =?utf-8?B?cktXZzhvdThXVGxsNlRyMW9Vb0lSMzVOeDJuQzZVVGx6SmZzcVhBOCtjMm5K?=
 =?utf-8?B?RFhXVEF6NkdOVnQ0V09iL2JvZUlrMUEvcUY5dng2WnFGVXNZOUNWRDYramVF?=
 =?utf-8?B?ZWVmci95VkJiWTZlQnRrOW92b0pNUDRKUjhVVGxjcjhRdFYvV0ZTSWgwQlcx?=
 =?utf-8?B?NmVOM2swSWNFeFhZRy9selZZaDFXeG9JWE1YdklVY2c5RnRaK2J1MnNFT0hl?=
 =?utf-8?B?dDBrbHZ5WVVlTVd2U3ZIVG92b25VNkFncGJzd1VlNGdIYzlBUW83MlBwa1My?=
 =?utf-8?B?TFRscE5QZU8wcXlEZ1FEQUIyRlFhMmxYa0ZZQjcxb2Nhc1lDWG1qbEV6NDZi?=
 =?utf-8?B?cDBVUENGVW5EdXJCS250UjU2WXV5bFZlMmpDQW1tOVI3TTdaeTgvczloZG00?=
 =?utf-8?B?NDRvTmlOZEp2bjM3N0M1eFAyaXdyZStkeUptOXJ5M3JKNHBGSlloa1VWWFJU?=
 =?utf-8?B?dEpwVzBuSHE0RkJZemtjWHR5czZXUmpDeFdyNjBEQi9KU2gvRW9ibUhVK2Uy?=
 =?utf-8?B?ejJTeXgxZ2hFZ2VaVU43Mm9ncTVqcTlrdFJWK1Jhbjk5UHoxUFNIZm1TZjZ2?=
 =?utf-8?B?bmFySXVhdSt5WmlRdEh2SER3eFF3QVYzOUt4OGVYVlhSVFB4S001VFp0YmRN?=
 =?utf-8?B?RUdBVm9xbnhDY0pvTk1MRDFTL21qdk5iQ2svWjV1N09maElMbDd1Smh5M0ZJ?=
 =?utf-8?B?MFIwcWMzbll5ai9tZVZ2UzhETmVkUi9IVGttQkhEQk9xbzc4amlXbzJUUldB?=
 =?utf-8?B?V1R5OHd5dmVzcXl5Y2FvVzZnRXBab1hsYUVpNi9zVy9yNGRZS3pzUC9xWjZj?=
 =?utf-8?B?aXEzMWhNWjE5aTdyTnd3UE1Pc0VTRkI0WS8zemkydFIwbDJ3TmNia2FWcU1v?=
 =?utf-8?B?aHRHb2hOZExRSktKcDQ0MGphM2J3M01UdFJLOWFZMjJYNm1qTlp4K0c1WVY0?=
 =?utf-8?B?OE5FU1lTcVAxVW9SVXdSM3YzZGp2TUZyS2NjWldZTkQ0L2RFbDJnYjJhd2Yv?=
 =?utf-8?B?TG9BYjJ6UFh6UTlEaXVvdVRaKytCd01nWHgzaHVzQ0h0VWIxa1p5SW11VjIw?=
 =?utf-8?B?V2h4ZkIwNitjdE82dDlaRnZTWk5RNGk0WjRUTFh4WjZRV2QxVmo4WHdpK25s?=
 =?utf-8?B?aFprWkNHZFpPRVRNbGtNT1g1NlpQaFpndC9mc0FWVmkzZ2FVVnVJbmFaTURK?=
 =?utf-8?B?OXlNNEh5YjFtUU5lTUJQV25ta05oSkVlc0ZuT2tDd2lkVW1vYXcreFRONmZ0?=
 =?utf-8?B?QkNPNmVFOEFZV3FGYXltTmczaUdkbnd6ZG5LVUN0M0hvMW1yZFk1SmNSR2xE?=
 =?utf-8?B?Z1hURktiYjRpWWVzMTVBd2hCM2UwdlFnTTFiQ25RMFdhRjRqeXJLVFk4N2xn?=
 =?utf-8?B?UWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9n3QmBBcjDN79s5xBes5vlWpJvP+t1rYbeBntZD01G9/rOplBSXvSA0vEa0N63e+hnDzRDuPm2jGkbJA5scKSbcPAjsHaeXevzXsV1tAEaq8zSGp8NB40Yr5zL/Ks/hjISGNv2vmSq5vD7jMjSiCxVUjE04KYHBsbFVpqV5WUYR1eO02j6wrh13NM8bGvddCJrd/KHTr0ShZl+VWyb9FzWRmek567rzNIwvVaiEtDzrD9cINVi+RgxUGhGOkanGh7npDTPNauepcjCGcGwYW4RjDWTjMrWh2AKOycS2L3Y8PmjLJ8QjtvAwfNOSQjnGG7m1R3t2wAuXAfU+34tbXUlqfGGzEC1vitdA+ZV+bRgJJlFr4S+UQPqfFwrEFl+FoQg/b9jlVds5yLOFVpW0OPyPRN3dk+gEv1Jgkw4HT3/T8idqa21cuppNheCbViPqfdS2sf1mpNinzkkHq/Dgw/bDaC+vrn3Q8j2byxyA4RHcLigqNl9C/ffPqpwNaNDtJgqrT8ZqfSAhqVxoN3Yrnt/DEUP+jIaEVA92RCm6lyv5YtpJwJm/MQJ5WnQoREi5YL6QOz4BeTBpLnjGa56Vd5o5Qf+kckWJS2DljAE+f7BTCOiGkv1vDI9/RnKjNegghsbjZFRKw1ge2cFEr1MGsfmjYxW8yO/F6u2FOobbyF32cUnDbDrGxXmCBsDGMkWmGkgcwSAM9pbDD6qta4onOjtFCjkENXPInmYWFjX62rO8whhz49kiVs/HbBd0GFQD3tj5b7grxxHiIdvAzMtrHYDf8k5/SffX/iRIP2MWdIeUXsn0lP1lvTadR5R8vmnu0NseF1upkA5k93zHuWpbBmp8i65kh69ZqD5M7h0M33Cg=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09f869ab-923e-4464-9a6c-08db0e82bdb9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 11:58:09.7308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0BxF18EoGd5II0/O5/d/VXmbDOh7TF0svO0jr5lkuCWlo9E6QcLmESv702r1QOEFtmqFePEGY/oUXjIc5mq0+jGws3MZZwdPLuQRGka6SXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7097

On 14/02/2023 11:45 am, Michal Orzel wrote:
> Hi Andrew,
>
> On 14/02/2023 12:00, Andrew Cooper wrote:
>>
>> On 13/02/2023 2:23 pm, Michal Orzel wrote:
>>> Add a debian container with cppcheck installation routine inside,
>>> capable of performing cppcheck analysis on Xen-only build including
>>> cross-builds for arm32 and arm64.
>>>
>>> Populate build jobs making use of that container to run cppcheck
>>> analysis to produce a text report (xen-cppcheck.txt) containing the list
>>> of all the findings.
>>>
>>> This patch does not aim at performing any sort of bisection. Cppcheck is
>>> imperfect and for now, our goal is to at least be aware of its reports,
>>> so that we can compare them with the ones produced by better tools and
>>> to be able to see how these reports change as a result of further
>>> infrastructure improvements (e.g. exception list, rules exclusion).
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>> For those interested in, here is a sample pipeline:
>>> https://gitlab.com/xen-project/people/morzel/xen-orzelmichal/-/pipelines/775769167
>>> ---
>>>  .../build/debian/unstable-cppcheck.dockerfile | 37 +++++++++++++++++
>>>  automation/gitlab-ci/build.yaml               | 40 +++++++++++++++++++
>>>  automation/scripts/build                      | 11 ++++-
>> I'm afraid that I'm going to start pushing back on any more x86 jobs.
>>
>> We're already at several hours to get a run out of Gitlab CI, and that's
>> assuming none of them hit networking issues, and outside of the typical
>> European working day, when patchew is busy churning and not reporting
>> the status back.
>>
>> Right now, there is vastly more ARM test resource than x86 resource, as
>> evidence by the fact that you're never waiting more than a few minutes
>> for the actually-ARM tests to complete, so adding more x86 cross
>> compiles is compounding the problem.
>>
>> We need less x86 testing, or more x86 resource.  Probably both, because
>> its now so long that even I'm not using it as a pre-push gate on all
>> changes.
> I'm aware of the problem you described. AFAICT there is nothing stopping us
> from switching completely the arm32 cross builds from x86 to arm64 container.
> It is just a matter of creating identical container to unstable-arm32-gcc
> e.g. unstable-arm64v8-arm32-gcc and using FROM arm64v8/debian:unstable.
> We need to keep the old container for backwards compatibility.
>
> This way, x86 runners will only do x86 stuff + riscv64.
>
> Are you aware of anything preventing us to do so?
> If not, I will push a prereq patch to switch the arm32 cross build to arm64.

No issues that I can see - I think that would be a good move in the
short term.  And it's also something that should be backported to
alleviate pressure there.

On the x86 side, we also desperately need to prune some legacy things. 
Guess I'll get around to that is some copious free never.

~Andrew

