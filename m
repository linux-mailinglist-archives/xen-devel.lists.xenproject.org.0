Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F4A4C156B
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 15:28:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277390.473864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMscn-0003jh-6s; Wed, 23 Feb 2022 14:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277390.473864; Wed, 23 Feb 2022 14:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMscn-0003hM-3G; Wed, 23 Feb 2022 14:28:13 +0000
Received: by outflank-mailman (input) for mailman id 277390;
 Wed, 23 Feb 2022 14:28:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMTg=TG=citrix.com=prvs=046033a78=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nMscl-0003hG-C7
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 14:28:11 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1ec6091-94b4-11ec-8eb8-a37418f5ba1a;
 Wed, 23 Feb 2022 15:28:09 +0100 (CET)
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
X-Inumbo-ID: d1ec6091-94b4-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645626489;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=RA0ILhZuTpVOi+KqJSsnRkAhY0YJ6fwIDoCuAqpglBw=;
  b=NkuYmmmw+qBX2ynmIJ9XDqo6oVk4nfbJpg+jZ2shlDfHq/rChHc8xmdy
   f+NcMGNRRDNKoMfCJeJwPugXPLsNWBU4i9pu2ESpj5pXDrcDzGqqKnJn4
   G3Q1Pm45cFNFl30sD9fnozv1XcyLVhZSk7RC30Gc78XaHijRJocez7BUo
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65222664
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ejaLeK7bVXT/zGMQ4siLPgxRtCrHchMFZxGqfqrLsTDasY5as4F+v
 mBOUTvVa/aIMTOked5yaonio0wO65HRzNE1GlZurSoxHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFx2XqPp8Zj2tQy2YLjWFvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSgFDcyEoD3kt1ETjdDSwVvMqdlxLb+dC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKs2vH16wC6fJvEhWZ3ZGI3B5MNC3Sd2jcdLdRrbT
 5REM2A1MkqcC/FJEg1IJYt9svuPv1P6NCcbs1aJ+LQz6kGGmWSd15CyaYGIK7RmX/59jkue4
 27L4Wn9KhUbL8CEjyqI9Gq2ge3Clj+9X5gdfJWn8tZ6jVvVwXYcYDUUX1ampfiyimalRslSb
 UcT/0ITQbMarRLxCIOnBlvh/SDC7kV0t8ds//MS+Fy90Yb52AygX3UqVWZledMsl/M/fGl/v
 rOWpO/BCTtqubyTbHuS8LaIsD+/URQowX8+iTwsFlVcvYS6yG0npleWF4s4Tvbp5jHgMWyom
 1i3QD4Ca6L/ZCLh/4Gy5hj5jj2lvfAlpSZlt1yMDgpJAu6UDbNJhrBEC3CGtZ6sz67DFzFtW
 UTofeDEsIji6rnXyUSwrB0lRu3B2hp8GGS0baRTN5cg7S+x3HWoYJpd5jpzTG8wbJpZJGK3O
 B+J5VwBjHO2AJdMRfUrC25WI553pZUM6Py/DqyEBjawSsIZmPC7ENFGOhfLgjGFfLkEmqAjI
 5aLGftA/l5BYZmLOAGeHr9HuZdyn3hW7TqKGfjTkkT2uZLDNSX9YepUbzOzghURsfrsTPP9q
 I0EaaNnCnx3DYXDX8Ug2dRNdQtTdSBjX/gbaaV/L4a+H+avI0l4Y9f5yrI9YY112aNTk+bD5
 HamXUFEjlH4gBX6xc+iMxiPtJuHsU5DkE8G
IronPort-HdrOrdr: A9a23:UuC6B6xuWDeeZaRTSkslKrPxguskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9IYgBcpTiBUJPwJE81bfZOkMYs1MSZLXXbUQyTXc9fBOrZsnHd8kjFmNK1up
 0QCpSWZOeAbmSSyPyKmjVQcOxQgeVvkprY/ds2pk0FJWoBCsFdBkVCe32m+yVNNVJ77PECZf
 6hD7981lydkAMsH6OG7xc+Lor+juyOsKijTQ8NBhYh5gXLpyiv8qTGHx+R2Qpbey9TwJ85mF
 K10zDR1+GGibWW2xXc32jc49B9g9360OZOA8SKl4w8NijssAC1f45sMofy/wzd4dvfqmrCou
 O85yvIDP4DrE85uVvF5ycF7jOQlQrGLUWSkGNwz0GT+fARDwhKdPapzbgpDCcxrXBQ5u2UmZ
 g7r15w/fBsfGL9tTW46N7SWx5wkE2o5XIkjO4IlnRaFZATcblLsOUkjQho+bo7bWvHAbocYa
 FT5QDnlYJrWELfa2qcsnhkwdSqUHh2FhCaQlIassjQ1zRNhnh2w0YR2cRaxx47hd8AYogB4/
 6BPrVjlblIQMNTZaVhBP0ZSc/yDmDWWxrDPG+bPFyiHqAaPHDGrYLx/dwOlauXUY1NyIF3lI
 XKUVteu2J3c0XyCdeW1JkO6RzJSHXVZ0Wa9iif3ekPhlTRfsuYDcTYciFcryKJmYRrPvHm
X-IronPort-AV: E=Sophos;i="5.88,391,1635220800"; 
   d="scan'208";a="65222664"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WjyHZ/4OscJxZ03QrRC8WDoIgLH65ozSZm6Kn8aTlJOOj50PEO2jbVXLNqIcfHO8ri0i4Smxy7bYSPRCyKg+WngZOyi2dQ2xw0mUA0A07lp1n3kcKNXcs4rlptWzRzLx8ap1cTbd8OU+sLgVOq8obdv2MZ8lh25tQBlvhMx41PJE7yQzTvC11UsSod0CDVbrwDOzvKUCQNr5PbB1NbI0v/j31k0qr7sbGoa+yeL38ZcyUXX6hccVFu9sWfNQJGLcs6QhXgH0uNrmDppDQP6G2rQMbLhN95FsCCtn92SEhRdSQnk/HdOCn9X9HbPWFleInWC0H9oIDSD9IGAfBuKvsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RA0ILhZuTpVOi+KqJSsnRkAhY0YJ6fwIDoCuAqpglBw=;
 b=l11eSGK6CvFwtJR8R88ZJZh0GLMBjuwzCWKXPHAoRqB6MfehIcFsuDKYF0XtU4P0sRTkC0VQVoPc1+puY3vMcIk0oMDq162HHYJGR82vNxsUgxIhl2MxE7GSfIKoHNfrtEpLtLcp3RVC/hoV+K93snm4zjUl4nqbPkL1pgusa2HE7LItQSRmyEXJl3lcU5dpI8WO5vg4myJ1SEBFiT0Gif1ZlqCNQ7Mu7crtwLJQdn61HiBF4hKuIkHmTDt3Wzokv24RlD2duIqx+MehHQ8iL0cZ2iR0r6xNWNCU70UXRiintw5yTNYjnatGgQRKLf0YdOGk3UGeAC0Y9jijZ7q+JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RA0ILhZuTpVOi+KqJSsnRkAhY0YJ6fwIDoCuAqpglBw=;
 b=ZoWIs9SnPhfdoJlie6GRLMbwH4rNxfJFfwbLuPkYUuqlVz8SMRI5nC0tv1gtH39oGSYqDDz2mX+/g62fL0fnBQAM2Sky9qfHgy9z554TtmL5i/xfUNGHCgpAwNU2FjRlSc+WTbTqbWPvqLavz3MRL7k4hPyeZEMUofWfL6ekDCg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 59/70] x86: Use control flow typechecking where
 possible
Thread-Topic: [PATCH v3 59/70] x86: Use control flow typechecking where
 possible
Thread-Index: AQHYKAHbjTqwtJQGsk6N9L2AW8SaT6yhMVoAgAABwgA=
Date: Wed, 23 Feb 2022 14:28:02 +0000
Message-ID: <4adfa206-752b-a5b4-2d57-04933d47467d@citrix.com>
References: <20220222152645.8844-1-andrew.cooper3@citrix.com>
 <20220222152645.8844-14-andrew.cooper3@citrix.com>
 <d376a457-ef35-4fcb-38d9-d495b385fb65@suse.com>
In-Reply-To: <d376a457-ef35-4fcb-38d9-d495b385fb65@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6974d5d3-3946-45eb-f4ca-08d9f6d8b332
x-ms-traffictypediagnostic: BL0PR03MB4211:EE_
x-microsoft-antispam-prvs: <BL0PR03MB4211D46E303360C7B3CD1F0FBA3C9@BL0PR03MB4211.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TWW14A7lBAK+4M1Nt2cAUdNY7Z6QVEsxuQwVBZBAwD5NQYM2JiyZy4cXlxgdJ9tk51EJ+2Gqw35WIBIxVBWKGsU62GqIY33JI4L2ujkHWoqt5xRgwwcUaq0kWEVW5ywvlkD6v9/HZ9yv6t+tajca1xe/xgWG9jYCTBDEPQvhDej/WkCvW6YWU+5HbfNsReO1LPgQ0hdt4MFsILoIO8CSGRRqsskdotV0Ku9Dm44VpNbCB5aN3rGrhL/34sKTtXbX4vmLKc6XyrGRN3ATaK5Ufx8oKn6c4Dm/SdrwQkh+Y4ONAUZZJNHCabpl9H6ok4L4coqk7fTpG1A3Qe09uGd2E13CuZy7iolPHm1waimguDwssCRy7QAeq3mBOYOEgotUpL5KHisad8G/64OjtGQLJVl9CmZ7Alz6htP6h+w6a0OEJmTAAK79HO3hbRG8SGOPwOkKsj1hfFycfUk5vpLj5Chci/6kNSQjpAQk4YVjJ0Hr11trrCl4KCZ63llOn9fEG6f6ft7DlV6Uj1X+KLx0Dkpb1ffe6Y7AK2y3M+uOix5tMeIw8kKDwthaapo4PLUgEXv+1yIkFL2rYdDEzbXJ6TFkLOxO7mm6cBuv/q64Bepo3URkvwUraL3AJj6N/qDWqI2SsGcdnRBn7RTfTPmq/C24LsGX3Y8VtFtEAWZySmb/ZPLJvq9pgJM11W6LoTp9OnWX60dj5WRkka2FG0g68T/rs143PJezegjaDVEBDPk1Ht+tPG+tVVJfQsYkaDZN8C6rFkfxu33t2WQsST5x9w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(26005)(122000001)(8936002)(316002)(6916009)(54906003)(86362001)(2616005)(38100700002)(91956017)(76116006)(8676002)(4326008)(66446008)(66476007)(66556008)(66946007)(83380400001)(64756008)(82960400001)(31686004)(71200400001)(6486002)(6506007)(53546011)(38070700005)(2906002)(36756003)(5660300002)(31696002)(508600001)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NENXZW1OaEJHOXUxM1Q3a2FFdjNoVmVsTzdwbDdjcmtnY0habkNoV0RhT3d0?=
 =?utf-8?B?T2c0MGtUTGUzYkRlcWtYR0pybWZYc3R3OXlvVGpBV1dHOW1FbG9KZTRZK1hH?=
 =?utf-8?B?S0hOeEJIRTlZWUJicCtYV2ZsZThiT1Z5MGhlT2c5QTJFM1JyaGNzb2NTSmZl?=
 =?utf-8?B?bHMzc2EwVTYxczhVZjhDTnZvcE9kZ0xvdTA2R0NncG5TYlVuU2R1cjFnbkM0?=
 =?utf-8?B?RHMxZERuT2pId3lMK1J1Mmhoa0tJelhhSm9HRTNya2pHMTBQWi9ucGhmRlhz?=
 =?utf-8?B?a1B4T3plNUxWTFgzRStiZjNpSUhuRk5FMTgrWStERXpjQm9EeUpkOE9tY3dO?=
 =?utf-8?B?bE9meElaRDdzNmV6bk82UEJPUFNWVFZiR1hlYmRPSEx4SFdxRmNubWFUdjlr?=
 =?utf-8?B?ZFNNR0V2V2hZY3RGZUpBY1l4UDJBQXNYRjFTcFFJNXl5c2ZicHV3MXJSN3Zk?=
 =?utf-8?B?NHJxNEJpUGVRVHpYVkhDYXd0akVVcFJYWkhydjN4dTF4TU9wSUZhQXBqZEFU?=
 =?utf-8?B?K0NKUjdsOEFDQWl3U05iZjQyNkxacE5INGdQMWxvK09zT0JoYUZiaDRLOWgz?=
 =?utf-8?B?b0p4cGZvRXI4OWpKN1RWMEZYZ2M1L0R5dllLWkdjUi9tem1kK2NRZFpLUWJ3?=
 =?utf-8?B?NUJXL1NxM3N1STZBVitiQVZBSVBFTmU4Q0xvTm1USjhpQ1d2M0tlemxOcnFr?=
 =?utf-8?B?WHFraGFsOExPR1FsSzVoK01kcFp4MXgzUGd2SThPRmNoa3B0bHdBbkYrby9s?=
 =?utf-8?B?cHkxK1JlSzU4QlZKcUl2blEwZGtVT2Q2VTRlOGpZYlhaUHprQ0FjSHlNUXNN?=
 =?utf-8?B?QnZEUERDZEFmV0FEVTJMTXRsUm91V2dyK3djSnBBa0J4TUxtQlNLTy8yelZZ?=
 =?utf-8?B?S2lhcWpjdXg0TmMvN1NUOXVGaW95VUw0cmx2L1VQQ1Zya1d4SUcxU2ZDY0VH?=
 =?utf-8?B?bHdxNFYzYXdCZDFmSTJVL1pjMXBCcUovUGVJQ2pCYjU5WWNRUnBKTkxTQWpL?=
 =?utf-8?B?MVJhWGpNNkQ5VGp3MmF0WXlPM0RNZTZUZEtuc1Z6VnNOdVNSbHNkSmQ3aWxP?=
 =?utf-8?B?QnI1cWFRRXlaaE1peWZOVW9ubXlxZ2VIZTBZc3RxV2ZpcXkreWsyWk1oS0pN?=
 =?utf-8?B?V0QwVWRYN29abGIyY3YxL0pPNE9ZWGJkaUtXV0lFSEFmSG1lREJQelJ1NDg0?=
 =?utf-8?B?VkxSSDFXYkl0VjFtY3RiT2F6aitwZTBocnMrSzZHZjJ5RTkvejE2M0FvdFUw?=
 =?utf-8?B?QjhhM1FZTmtxOWVURmxDdXVZRldRRnJIY3VtZjYrSFRBZ1VSOFN4eTNYazdm?=
 =?utf-8?B?RzZoMWtFV2p3UFJENWsrUlJlKzRxYVRBcmZYM041Q3hyWGFvMVprM3NjamFh?=
 =?utf-8?B?bXgxUUJrS3dtcTV6QUY4RTlZaC9TRXJoTkp6VDIrbklaSmhHOHBaVzFhM1BW?=
 =?utf-8?B?bTBBaGFsY0pOazg2OXhvWERwMTNXaUM4K2ZzQ3hXQ0FTZ3RXWHRGZ2pNYlEx?=
 =?utf-8?B?VkQwbFAyOGRvSGlEMWYvMzdSVVp1UEpUeHNubG5NKzdMdE5DYTZxMFRDSDEx?=
 =?utf-8?B?MDlROC9nL2VDVDNpVGlIemNXcUZYSW5sbzc5U0wxWjNGTVUvYjJDL1Zxdys0?=
 =?utf-8?B?RTYrVi9xYTZMa2Yxam54cWVlOVZIQjFIM1JZMC9maXM4UnRSYnN4cUU3SlpS?=
 =?utf-8?B?Z1dDbGRMZzBzOXRzNFE0SFlUbzd5cFhWOTd0Ymh4UU1QY3dWMThmNU41OUhT?=
 =?utf-8?B?Wjh5a2ZLSmEzbzQ5cGdTQW1xNWNYRExQWEZ4cHJ2bTg4NngrZmo5eWdKSmFy?=
 =?utf-8?B?eWx5QmM3Qm05RWhpN0M3L2F0dkdTa0hXRlQ5blVEeVJFTVNIMm80UlBnSU9y?=
 =?utf-8?B?NERxWkhXcWJDU1c4Y1RRK1BSODRrelZYanFhZDU3OUZlWnRpQWdzeWxvKzRU?=
 =?utf-8?B?ZFVqSTZrV3ZvUFJVVEtqVGJ5bUVLbDhkaWlrMUFBaWR5cjhiUmMxRG1ZYjdX?=
 =?utf-8?B?VjVoVHVwNG9GbllSVGsvUTdOTlBxd3EzQkZGa3JlZHVPY3hCZW90blhIYnZq?=
 =?utf-8?B?UHp4SC9NTWh2WE9OYkxIaG1zUThZdkg4aXRYT3gxclJ4U1hSakhPMGQwRzVh?=
 =?utf-8?B?NDV1SUUzTllHd09wTGxzQzI4S1MvQXFJOXIyd1IzczgrRVVHbGQ1cXoxRTI0?=
 =?utf-8?B?emkyNVhUb0RySmkyZlJKb28yckxETW1jM2xmaUp5LzRmWFUyakl0aUJ3bC96?=
 =?utf-8?B?b05scVRKWkkzZ1pSRDlva0E2TmRnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E1C1F5B28E3BF47ADDB6960874D05DE@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6974d5d3-3946-45eb-f4ca-08d9f6d8b332
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2022 14:28:02.8216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7oy4CuUe+eaC0f/dRZp/9c4iij9ad/5MX3Wzsx46/hSmWE81q1SFnQD0HLS+vgK1xKYNWCVQvxA/8jFMQ6ymrl8Ht68IrZBjhiXG9gXEszA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR03MB4211
X-OriginatorOrg: citrix.com

T24gMjMvMDIvMjAyMiAxNDoyMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIyLjAyLjIwMjIg
MTY6MjYsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBOb3cgYWxsIGNhbGxlZXMgaGF2ZSBiZWVu
IGFubm90YXRlZCwgdHVybiBvbiB0eXBlY2hlY2tpbmcgdG8gY2F0Y2ggaXNzdWVzIGluDQo+PiB0
aGUgZnV0dXJlLg0KPj4NCj4+IFRoaXMgZXh0ZW5zaW9uIGlzbid0IGluIGEgcmVsZWFzZWQgdmVy
c2lvbiBvZiBHQ0MgeWV0LCBzbyBwcm92aWRlIGEgY29udGFpbmVyDQo+PiB0byB1c2Ugd2l0aCB0
aGUgZXh0ZW50aW9uIGluY2x1ZGVkLCBhbmQgYWRkIGl0IHRvIENJLiAgUkFORENPTkZJRyBpcyBu
ZWNlc3NhcnkNCj4+IGJlY2F1c2Ugc29tZSBzdHVicyBmb3IgY29tcGlsZWQtb3V0IHN1YnN5c3Rl
bXMgYXJlIHVzZWQgYXMgZnVuY3Rpb24gcG9pbnRlcg0KPj4gdGFyZ2V0cy4NCj4+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBJ
IGNlcnRhaW5seSBzZWUgdGhhdCB3ZSB3aWxsIHdhbnQgdG8gaGF2ZSB0aGlzIGV4dHJhIGxldmVs
IG9mIHNhZmV0eS4NCj4gSGVuY2UgZmVlbCBmcmVlIHRvIGFkZA0KPiBBY2tlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpUaGFua3MuDQoNCj4gQnV0IEknZCBsaWtlIHVz
IHRvIGZvcm0gYSBwbGFuIGluIGNhc2UgdGhlIGNoYW5nZSBkb2Vzbid0IGdldCBjb21taXR0ZWQN
Cj4gcmVsYXRpdmVseSBzb29uIGFmdGVyIGdjYyByZS1vcGVucyBmb3IgZ2VuZXJhbCBkZXZlbG9w
bWVudCBhZnRlciBnY2MxMg0KPiB3YXMgYnJhbmNoZWQgb2ZmLiBXZSBkb24ndCB3YW50IHRvIGdl
dCBpbnRvIHRoZSBwb3NpdGlvbiBvZiBuZWVkaW5nIHRvDQo+IG1haW50YWluIGEgZ2NjIHBhdGNo
LiBEbyB5b3UgaGF2ZSBhbnkgaW5zaWdodCBhcyB0byB3aGF0IGlzIGFjdHVhbGx5DQo+IGJsb2Nr
aW5nIHRoZSBjb21taXR0aW5nIG9mIHRoYXQgY2hhbmdlLCBzZWVpbmcgdGhhdCBpdCBoYXMgYmVl
biBhcm91bmQNCj4gZm9yIGEgd2hpbGU/DQoNCkknbGwgZm9sbG93IHVwIGFuZCB0cnkgdG8gdW5i
bG9jay4NCg0KfkFuZHJldw0K

