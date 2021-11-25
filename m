Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5947C45D6EA
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 10:13:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230743.398890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqAoc-0006Dk-Qj; Thu, 25 Nov 2021 09:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230743.398890; Thu, 25 Nov 2021 09:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqAoc-0006Ad-NN; Thu, 25 Nov 2021 09:13:14 +0000
Received: by outflank-mailman (input) for mailman id 230743;
 Thu, 25 Nov 2021 09:13:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1dIP=QM=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mqAob-0006AX-19
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 09:13:13 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7b15ec3-4dcf-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 10:13:10 +0100 (CET)
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
X-Inumbo-ID: e7b15ec3-4dcf-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637831590;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=zGw2MK64gGNs4dAG4qiGVNyZZI6k1ddhUNLBa/pqbJc=;
  b=PpbWtoBvWtgC1ngqgc8pK+u0xXVrnjxMbw2KsXymfug8Tv5bT71MfhgR
   cBmfd270PAGpJGijkFvVw4b7SV2Dt3zB+c8rsf1ylAz79/UE3ji29b4RN
   WVK0RiO40Auvc6BMhmFlhUioyfnv5CT/0Jn47oMJ2seaePx3a/vVcmk8U
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4b1xOWMekdGlePlR3BSCtooupf2xR1r2Fc/YItyUosdSszjGMjqLMAQQ0CunxjjuOM+6JPezVC
 7PipGn5jl2t8VFbTwQTVdeIJkY2Os7YYIhzNNTYRep7ksaZYu1zcIdqzNTQS3UHFUzZ29bxPwp
 MCnszr+MgS3NdzLcswp1WCDRkyaObibPlLuanR3Acqz2E51SUfN9DUCdv9f2t3YJfDIiQRLrx8
 e7Qhiw3sG3Nj8VPDycxTJFN88EfPkLDhdPC4aypux0qAKNPntG6W91deSrvrKSD6Wptw7tLtmi
 FaJruGv/kABSwNaQ1BnPSFSY
X-SBRS: 5.1
X-MesageID: 58623723
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:PGUbhaJtbctD/DEqFE+RNpIlxSXFcZb7ZxGr2PjKsXjdYENS3jxRn
 GsXUGCEPP3cMDekKoh2b9+19UIF78WAzoIwHgFlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es5xrZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2shJNol
 44O5aezRCUXI6P+t8heTCZhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2XtYECh2hq3aiiG97Re
 exJTiFOXi7MTCZLPWYdV7E/sf6R0yyXnzpw9wvO+PtfD3Lo5BN1+KjgNpzSYNPibcRKnG6Iq
 2Te5WP7DxoGctuFxlKt4n+qw+PCgy7/cIYTD6GjsO5nhkWJwW4eAwFQUkG0ydGboEOjX9NUK
 2QP5zEj66M18SSWosLVBkPi5iTe51hFBoQWQ7ZSBByxJrT8xh3aHzdfDW56a9EEitI4dxMGl
 UC2poa8bdBwi4G9RXWY/7aSiDq9PykJMGMPDRM5oRs5D8rL+99q0E+WJjp3OOvs14CuR2msq
 9yfhHFm3+17sCId60msEbkraRqIr4OBcAM67x6/somNvlIgP97Ni2BFBDHmARd8wGSxEgbpU
 JsswZH2AAUy4XalznHlfQn1NOv1j8tpyRWF6bKVI7Ev9i6251modp1K7Td1KS9Ba5hfJmC2M
 R+D6FkPtfe/2UdGioctPeqM5zkCl/C8RbwJqNiIBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WiOHSKqtBKcghRRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WZQelTQnw8Or7pQ7hlqnc3YX4lMVqygiBxaoez9qYPMZAweOB/puBkyPd1S
 dgDetmBXasTGmiWpWxFYMmvtpFmeTSqmRmKY3ivbg8gcsMyXAfO4NLlIFfirXFcEiqtuMIii
 LS8zQeHE4EbTgFvAZ+OOvKixl+8p1YHn+d2UxeaK9VfYhy0ooNrNzbwnrk8JMRVcUfPwT6T1
 gC3BxYEpLaS/99poYeR3a3d9tWnCepzGEZeDlL317fuOHmI5HenzK9BTP2MIWLXWlTr9fjwf
 u5S1fz9bqEKxQ4Yr4pmHr935qsi/N+z9aRCxwFpEXiXPVSmDrRsfiuP0cVV7/Afw7ZYvU29W
 16V+8kcMrKMYZu3HFkULQsjT+KCyfBLxWWCsaVreB33tH1t4b6KcUROJB3d2iVSIYx8PJ4h3
 ep86tUd7Bayi0ZyP9uL5syOG79g8pDUv30bi6wn
IronPort-HdrOrdr: A9a23:UfZHEK1Hx3fpTVotJowyvgqjBShyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5Wo3SITUO2VHYV72KiLGN/9SOIVydygcw79
 YET0E6MqyNMbEYt7eK3ODbKadY/DDvysnB7o2/vhQdPT2CKZsQlzuRYjzrbHGeLzM2Y6bReq
 Dsgvau8FGbCAsqh4mAdzM4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kDEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 TxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72xeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJlBXv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbhrmGuhHjPkV1RUsZ6RtixZJGbCfqFCgL3b79FupgE486NCr/Zv2kvp9/oGOu95Dq
 r/Q+NVfYp1P70rhJRGdZA8qPuMex/wqC33QRevyHTcZek60iH22tXKCItc3pDfRHVP9up1pK
 j8
X-IronPort-AV: E=Sophos;i="5.87,262,1631592000"; 
   d="scan'208";a="58623723"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVFzQgDyDOpp6TevfhmzsNrxpK//+GCN6BbxmZrIEadfGLJ1Chd07LaAbY1RHIlEWtmYIRJj7BcJYWKowqhjXiZOJnVodcXSda6FkwAnYIkaKGCCfFTpYvlJ8znbHvmI7G5VNJheO1YlVyYZdnzTUON4cred1tHG5xhMHa80HKr+kZosAh6GdL6jlnMJmGc3EHxOnZFv2nAzLjFQkCO2SEkviatzbVTKPykHMvHwWZXOBjxnFZ2Fc3ZpvgskAGasLZv2gR6ZpBxrGoUmMjb9NxZy5ufM1aDQhMVLay3Q4TWS6sLhJjja1IqDCi6C7Al3CQWgzgA5ViNBBYPN0rh1lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ImPN/DDGcM8/rJ0xBvMRQaOrRzNev8CU+aPPIo7d7qo=;
 b=fO0/HP6TqUJ7CMpTzP8u6l3ZT6h5c9mHnsCMgQJS8K8nc0mfjIHkhllGl3nPwnry13t1Xvk9bZEynostojvm3o9GifzORAVkqS1+BU0h8Mo2GhfqGYONQA86AKAPVqnb7Om6B6wyzqlzWVgjclRE4PukVVi3bSMIWLG8U5U7Oouy3w7hIHd90+CHhsDHShEzoXjGKbDsPGI27bfhFz++VLbxXaQLM7qJ30CVpqNjxi1q+0Gmj6OaVEatS+YpaaBkSqX/OV+IeprFCPdtC2gK9f4qTJcDRweMTAyfHQ+tCV/wAOieZ1KXFlziITG5BpJb1FMrgJw0+Y+godWTQ7BbOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImPN/DDGcM8/rJ0xBvMRQaOrRzNev8CU+aPPIo7d7qo=;
 b=H2Ee9f6vUM6uhbcAhEkixBy2nnSWKdvDwjoL+Ac06+/4pYQZqvjjAUxCdlJ3l9R4TByrJo4AiTKDP9a7ohGpnkMv7c6rchUfHTpBCg/G/xjO2AJyc0MKziyYHii/G3IJBTF0f1UmvAZSzFPF8WAo0OV4joW0wkSXP1qz+0vJ+V0=
Date: Thu, 25 Nov 2021 10:12:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH for-4.16] Revert "x86/CPUID: shrink max_{,sub}leaf fields
 according to actual leaf contents"
Message-ID: <YZ9TmzIbi8QjTAgm@Air-de-Roger>
References: <20211124211152.1142-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211124211152.1142-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MR1P264CA0052.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f4b46c1-927d-447e-00ba-08d9aff3c994
X-MS-TrafficTypeDiagnostic: DM6PR03MB5066:
X-Microsoft-Antispam-PRVS: <DM6PR03MB50667B0A1A9E490CED84B7BD8F629@DM6PR03MB5066.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m6JHvzp6XCCWIkcy+7msELcxsdf8UIQ3fTUY9jKrC9NoeEg6hQZ9mYyLFEST0NeVqG7b4veFltlSuRZ7Z7mknKtGSYpSHpG/7YeNSeXynV6r1eq5TaBDwuDT60vSPlUGWvMrJPPqxLbj9Tdh1ALzYSwVtKM5YZqXV4zwyEgp2l0J8U87V1DzOv3hDNojhxPJF8Tlh4T1blWca6hBROV28H6VspyZi+MhiQR9BVaJS/7DWmzF+sjasIAhk6MbGVQG8EklM4ohjWszqj/7a3Wu9v4Fpydtf/83BcIz0HhzlvTicqs0U3WkjaRKR0tYBGF6zgimBAXjk8BfjPkEvDNi0om90ab4f7k/2C7ymtSjs2TXdZJ5LgiP41Hi/dIO+4x7a2RoUBjcuVG1RXhLcCrkI4W8DonYgq2m3QCzMndUiPguxQtLzynpjP7p/yyy/G9Wjh4Y5WPbdiRHn07Cnn92/tsVRY2bh55CUDJmgi9QhRJuSi67AKhzZsxzh+OvbP6v0nE/gaYVsvQnspXQSgP9CA2qrydffoCiEO/lCmfNuJUvJkzrMJ3zo1hVsnU2ookKDxCb8lLyQsEY4GM2KCPaWNK14uzrPeAlJLkwKVr2322wySboKFEKza+uxMj1xl7IUY4fAHqZ9b09yQkyi7ptU8exiQ9xfUidlAQKZqF0sn8zjpBFWj0ALA7sKlZp5F1zgJuGdlxMRshGqpmMUJqXd8RprUmEvVnxXcek2+5JjvLIhUdPJK1/IoAoylj1nZmH4IDCFQ322VarORDqCPakog==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(66556008)(86362001)(5660300002)(66476007)(6636002)(8676002)(38100700002)(186003)(82960400001)(956004)(4326008)(6666004)(6862004)(8936002)(966005)(54906003)(85182001)(26005)(66946007)(33716001)(508600001)(2906002)(9686003)(6496006)(83380400001)(316002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlZZZDNaWlBVWFBiM0IxQTRVQlhtZzYzcnNyWHBURW1aVDJTU0dZc1RlK1d5?=
 =?utf-8?B?T1hmVmdQdmpIejdYMjIwOEk4eStVUjVhaWhCNERFZThYVzAvUkMxQ0lkVitO?=
 =?utf-8?B?YndhaHNwYnpaTDBFTnpIem13d21Pa3BjSGMvODd6TkRuZm5xQjdPWmVjZE5J?=
 =?utf-8?B?OWlDb0RYcC8zNTlJSWxvamlOdDJRTE4zVG5mTHVxVkZCNTZmWmNrWkVGNEY2?=
 =?utf-8?B?NmFPbFdKTnF2UlhiMkl2c3AwbWtEYlhIdlZkcjlUdWFsRWR6TGV4bk9vek96?=
 =?utf-8?B?d2c3d2VWRmNuV2hSVUJ3M0VWOG9Sa3AyMUNCMTF3UGszcGt6aEkxTWhoVXZJ?=
 =?utf-8?B?dzBPVzZmdmVIdFNrRzR5V0VmVDZhNitocUNYZ1c2TlJSZHRwZHFBOHV1SlVF?=
 =?utf-8?B?ZllvcTVqczM4WDBmWGE4clR5Z0ptY1RzMkNJZFVCRWJyanp5N0w2WHJFckdK?=
 =?utf-8?B?cDJodVBpQTI4UXRFOFVBbzdJNnlIQ2VjVTVlMGl3cDBlUGE5K3dVNG9QZmVo?=
 =?utf-8?B?ZzhJQ0tNL0w4Q2FhY1hRT1Zqa0s4L0RNOWREREs2QXlHaXcvNjFiRHduVFIw?=
 =?utf-8?B?Tk1yQkdXUUFUbWsxRDRUUG1EWWtlYmxjc2xzVlRTdUdlZ240Q0dHUDh1b3Yv?=
 =?utf-8?B?VUtqL1kyaW5OR0ZtdE5nQWdzVDN0S3JGdXhhVnByc29KcmdjN1BGSDF3UUM1?=
 =?utf-8?B?NTFUUkttcDdGL01vaUtLckRSMkQxNUlnelFIY2lpMXF6WUowa3pUUHhla2xs?=
 =?utf-8?B?VFc3dkU3UkM1eDR6U3c2Q1RqRWZESTBXNGhYaCtoTytTcWVrdzdXNGxnT09H?=
 =?utf-8?B?Z1lMWkE4SHlJVVVrdjZkWm55Qm5RTGs1OGxSUlozVWdVcjFseThuNU5sRVE2?=
 =?utf-8?B?NUtGNS9JVm05MUV0ZVFGaVZtbU5CYXlMbURwR1hJZERIUEtSZExIVDdMYlRJ?=
 =?utf-8?B?VUIvZVc3em1hM1BNTGs4R0o1cmxkak9FQnJ0cjRLS09XVlVZMFFjU0Q3UVdV?=
 =?utf-8?B?M1VGRUZxdzFZTmVuVlNCNTdOc0M3VlVRRlZ0bmlBWElDTW1MNDg1NEVCeXVE?=
 =?utf-8?B?djYwa3Arb0Y0UnlyN25hSnJVcU5pTWVpcTZFdFNGanNHbUlVUTFYRHZGWGFL?=
 =?utf-8?B?QW1MZDg3SitpRnU1Znl0Sk9yUHY1MXQ5alBWYlg3enRqdFJVZy9tN0l6aWE4?=
 =?utf-8?B?Lzd6UTYzbUhSWmZzcXpRWGRvMGlpMWUzSjcyYlVtMk43dWpZcTdqU3g0QkZu?=
 =?utf-8?B?ZWM2ZksvR0w2YWN6NVY4QlNmZ0lMSFFHVi8wM0QyK2VLQmM3VE1nc1hhWE1s?=
 =?utf-8?B?S1JmYTRLVGFveVBkajhjZDJoaHVadDNyV1V3VlJvcFgxUkwzeFdjQTZCMk1M?=
 =?utf-8?B?QVBqWmFUeHdjS094dUI4SmRDU3JFYVd4ZFo4T0c1THd6MFBpNnNsOUE0Skt2?=
 =?utf-8?B?aFloYWhmVVh6WkRoUlMzWlIwRC83TEJDRnlQVDNJMm9LeFdFdGxsNU1HRUtM?=
 =?utf-8?B?b2RGaVhUUlo2NGg4S0p1ZDNJUlR2OGx6amxDdE43YkVkOFdudlVMamJ3SFNH?=
 =?utf-8?B?ZEgwZGxaQUo1K3pVcVowajRJYWpVVlUvMUF5b0liQXMrRWZJbHFPdkRFVEJp?=
 =?utf-8?B?S3NqZkcrQU9RVVFDOEZycW1XaUt1eUFQcXdobzFQcU5rbXI3d3QvQ2gxczVM?=
 =?utf-8?B?cU5mcytTTHdvdUNhZSt4VW9LL0hhcm9MNzZrQWxETnFIZ3hTSDYybFdyNk1K?=
 =?utf-8?B?WDRJYjVwZUJNUUlBK2pQbko4ZGdycHpkbXhJUG1vQW04V1JubFBjTzhDOTRX?=
 =?utf-8?B?d29md1B5dFdVRnNSd3VqM0F4Ui9icjBKL0NCQ2tmS21oRXYwODNLeUdzZHhZ?=
 =?utf-8?B?WEc1czNZbW9rUS9UTjhYcjBrSmpoKzZSZ3BSbEVkYVhPTVdnQ3laQkFBbXNa?=
 =?utf-8?B?UkJuS3F6WnlaMXN2ZG9EUHZQZGJRV0pKbmdaa3ZMaml3R0wzK3RnTnBFbnV4?=
 =?utf-8?B?aUZuK1ZMY0NIb28rSzE5Yko3T0d2WHI0V2RqcUlXWGZ2V21rb2ZHN3lCaG5n?=
 =?utf-8?B?VHdrUnhGOFNjMnRyS2E3ck4waW9BL1gveUdCK0ZTbnFtSERCaVhxckVrNWVh?=
 =?utf-8?B?WTc0TUF2L1JqNHNzN2hRRGZUZ1djNGkzeExNRWtXVzZ2K0NCUHBJMmZab1NN?=
 =?utf-8?Q?kkWMGzqGVxpiiwUnNRa2KTM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f4b46c1-927d-447e-00ba-08d9aff3c994
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 09:13:04.6018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDKdSTxmS79u+8fEzYXTQQ3og0nzU6Rt+qOEY2VVjpNdnP6vGeadZ7zeS4fVtxPA9ciFjhXEy5r8xIa2uDYixg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5066
X-OriginatorOrg: citrix.com

On Wed, Nov 24, 2021 at 09:11:52PM +0000, Andrew Cooper wrote:
> OSSTest has identified a 3rd regression caused by this change.  Migration
> between Xen 4.15 and 4.16 on the nocera pair of machines (AMD Opteron 4133)
> fails with:
> 
>   xc: error: Failed to set CPUID policy: leaf 00000000, subleaf ffffffff, msr ffffffff (22 = Invalid argument): Internal error
>   xc: error: Restore failed (22 = Invalid argument): Internal error
> 
> which is a safety check to prevent resuming the guest when the CPUID data has
> been truncated.  The problem is caused by shrinking of the max policies, which
> is an ABI that needs handling compatibly between different versions of Xen.
> 
> Furthermore, shrinking of the default policies also breaks things in some
> cases, because certain cpuid= settings in a VM config file which used to have
> an effect will now be silently discarded.

I don't think they will be silently discarded. xc_cpuid_xend_policy
will attempt to get the CPUID leaf from the current/host/default
policies and fail because the leaf couldn't be found.

There's an issue with callers of xc_cpuid_apply_policy that pass a
featureset (which is not used by the upstream tools) as in that case
the featureset is translated to a CPUID policy without checking that
the set features are correctly exposed regarding the maximum leaves
set in CPUID, and thus features could be silently dropped, but as said
that's not used by the `cpuid=` config file option.

This possibly needs fixing anyway after the release, in order to
assert that the bits set in the featureset are correctly exposed given
the max leaves reported in the policy.

I think the above paragraph should be rewored as:

"Furthermore, shrinking of the default policies also breaks things in
some cases, because certain cpuid= settings in a VM config file which
used to work will now be refused. Also external toolstacks that
attempt to set the CPUID policy from a featureset might now see some
filled leaves not reachable due to the shrinking done to the default
domain policy before applying the featureset."

> This reverts commit 540d911c2813c3d8f4cdbb3f5672119e5e768a3d, as well as the
> partial fix attempt in 81da2b544cbb003a5447c9b14d275746ad22ab37 (which added
> one new case where cpuid= settings might not apply correctly) and restores the
> same behaviour as Xen 4.15.
> 
> Fixes: 540d911c2813 ("x86/CPUID: shrink max_{,sub}leaf fields according to actual leaf contents")
> Fixes: 81da2b544cbb ("x86/cpuid: prevent shrinking migrated policies max leaves")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Likely with the paragraph adjusted if agreed.

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Ian Jackson <iwj@xenproject.org>
> 
> Passing CI runs:
>   https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/415822110
>   https://cirrus-ci.com/build/4915643318272000
> 
> This supercedes
> https://lore.kernel.org/xen-devel/20211124161649.83189-1-roger.pau@citrix.com/
> which is a step in the right direction (it fixes the OSSTest breakage), but
> incomplete (doesn't fix the potential cpuid= breakage).
> 
> For 4.16.  This is the 3rd breakage caused by 540d911c2813, and there is no
> reasonable workaround.  Obviously, this revert isn't completely without risk,
> but going wholesale back to the 4.15 behaviour is by far the safest option at
> this point.

I agree. Also the shrinking done by 540d911c2813 is not fixing any
issue we know about, so it's safer to just keep the previous behavior
of likely reporting empty leaves rather than risk more regressions
caused by the change.

Thanks, Roger.

