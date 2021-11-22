Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EB2458E35
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 13:23:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228856.396062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp8LM-0006Ao-SO; Mon, 22 Nov 2021 12:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228856.396062; Mon, 22 Nov 2021 12:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp8LM-00067f-Oa; Mon, 22 Nov 2021 12:22:44 +0000
Received: by outflank-mailman (input) for mailman id 228856;
 Mon, 22 Nov 2021 12:22:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=smF8=QJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mp8LK-00067Z-LG
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 12:22:42 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1d6b1ed-4b8e-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 13:22:40 +0100 (CET)
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
X-Inumbo-ID: e1d6b1ed-4b8e-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637583760;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=nBPwri5Pbg0JkKUx0377p6Kz9cOK8eP/1ma6eyjGdpw=;
  b=Lipuq5pFUFnwb3uM51SqEVWqqAcK1RDzb94iC/Fm3f3qO6oqAHAVTxV5
   9VipStPVtpL0XxbAvScTA8exo4NoeGk1ca37Gs169ty/YCQkxDSKRauzo
   xRPUm+ew+yi8t+VbK//+KoK5w1OPQfcVGvxxfyn7LOk5l4i22aqDdt0wz
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VQ+HVWJg/ODVyZ5JmZFV3N0IS2Mrgv2K5p7FVRhABP0cSNXwWvQpU7cGqmGzMQc+k4yKnzdYQ+
 UXOAgXBvIEzQeOViX7kx3+yuj/HVvgphP0MBd0gTMVsRUFFtGxg4DFsYY7lfJbOCucW2N7U2q3
 +BOYQ1zu/mlXFMEDlNYTQfORgvOFxj/FhaE2DWneZ9UVs7IRuKom6oG0oBAkO6rS35HeSIjLdr
 PYFNi/m8oAq3EQra+rbHPrFv/kwddmhEnLZVVyEgm4MqA7Khi1sZkNj9wzEs5gJUZm2POUjSyG
 nKOBimOb6zTnfThcPsGiGhzK
X-SBRS: 5.1
X-MesageID: 58311831
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:oEPIzqykY6Ak+DNj8Al6t+fxwSrEfRIJ4+MujC+fZmUNrF6WrkUDn
 TRKXm/UM/rcNGSne9tzPd+x90sA6JbUy9FjGgRrrSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wrRj2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt4hj1
 dYSuqSRczUCb4vTw7saTjNzLC4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYIIh25p1psXdRrYT
 +Q/eSAxNCzcXxNoAw8+N5EMzeaThkCqJlW0r3rK/PFqsgA/1jdZwLXrddbYZNGObcFUhVqD4
 HLL+XzjBRMXP8DZziCKmlqtme3njS79QJgVFrCz6rhtmlL7+4AIIERIDx3h+6D/0xPgHYIEQ
 6AJxsYwhfAg6U/0QeHcZS+T8Vib5UEbRvB7LOJvvWlh1ZHoywqeA2EFSBtIZ9onqNI6SFQW6
 7OZoz/6LWcx6ePIEBpx4p/R9GrvYnZNcQfucAddFVNdi+QPtr3fmf4mojxLNKeuxuP4Fjjrq
 9xhhHhv3u5D5SLnOkjSwLwmv95OjsWRJuLWzl+ONo5A0u+eTNT7D7FEEXCBsZ59wH+xFzFtR
 kQslcmE9/wpBpqQjiGLS+hlNOj3vKnYamWA2wI1QsFJG9GRF5mLJ9443d2DDB0xbpZslcHBP
 ic/Rj+9FLcMZSD3PMebkqq6CtgwzLiIKDgWfqu8Uza6WbAoLFXv1Hg3PSa4hjmx+GBxwfBXE
 crKKq6EUCdFYZmLORLrHo/xJ5dwnXtgrY4SLLimpymaPU22OCTIFOxbaQTWNYjULsqs+W3oz
 jqWDOPToz13W+zieCjHt4kVKFEBN38gAp7q7cdQc4a+zsBOQgnN0tfdnuEsfZJLhaNQmrua9
 32xQBYAmlH+mWfGOUOBbXU6MOHjWpN2rHQaOy0wPAn3hyh/MNj3tKpPJYEqebQH9fB4yaImR
 fcyZMjdUO9ETS7K+mpBYMCl/pBibhmimSmHIzGhPGokZ5dlSgGQoo3kcwLj+TMgFC2yscdi8
 bSs2hmCGcgIRhh4DdaQY/WqlgvjsX8YkeN0fk3JPtgMJxm8rNk0c3T816ZlLdsNJBPPwiqh+
 zyXWRpI9/PQp4IV8cXSgfzWpYmeDOYjTFFRGHPW7OjqOHCCrHaj24JJTM2BYSvZCDHv4Kyna
 OhYk6P8PfkAkAoYuoZwCe82n6c35t+prL5G1AV0Wn7Mag3zWL9nJ3CH2+hJt7FMmeAF6VfnB
 BrX94kII6iNNePkDEUVdVgsYem03P0JniXfsKYuK0Lg6S4rpLeKXC2+5fVXZPCx+FetDL4Y/
 A==
IronPort-HdrOrdr: A9a23:Q8GNIq4hM6QpsE89+APXwVKBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwX5VoZUmsj6KdhrNhQItKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkDNDSSNykKsS+Z2njALz9I+rDum8rJ9ISuv0uFDzsaE52Ihz0JdDpzeXcGIjWua6BJcK
 Z1saF81kWdkDksH46GL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 T4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRsXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqrneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpn1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY/hDc5tABCnhk3izytSKITGZAV3Iv7GeDlMhiWt6UkXoJgjpHFogPD2nR87heQAotd/lq
 P5259T5cNzp/ktHNVA7dc6MLiK41P2MGfx2UKpUBza/fI8SjnwQ6Ce2sRA2AjtQu1P8KcP
X-IronPort-AV: E=Sophos;i="5.87,254,1631592000"; 
   d="scan'208";a="58311831"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZ0/LomNfmU5oCJQGY3N/bnwnqS6ma1W3DJJ/sOZcbCzO3sJlQbCD3WNSoCymIic1P956PJPKGpy8Sw3U8u51jtDH5rsZXOyiNzhYAmCJG2rOOqXK+iMU5vgZ6XtXdOZOO+NKqvQ+9DifXvq3h8uwekR34QNROAD2mg0bSa8s20yIN6RK7oY4unSVuJizjCpI4EFXrD/ZL1I3JiuDVdhTeysUmz12bJhcL51gUlXhvBDXkzG3FpWQeT5ZmakI2aEstyQixG+0qEdk9tRS5nG7w+SK3sewdudixOI2ieNpu+sZ5vDTfPjZ8u30oUHXjDBPi8sJuRlbTxeyFfL+ZfvDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PrciBsrvGuzzfcUacjBwgsXSlc0j6o6X84uGBD9NpiQ=;
 b=Kr8CW8dWGdxb5B96ty1dtik0q0huX3DMAvMmED4V9dcO2xvicWZ63GPAbFEbHvyWCrPa3Tcw9yy48pJPeB5agZY+fiWlDgxzGXEfcmFpDa7v86dpEvHWinjqoq0bjWgw9HJlwRv6z47BfgepZBTDss0LNQTUiH7gOyV8gV52mAjOHMprVuIU2YeDmyrGFVU6Izq3eCa4I4ftrE9DMmIiUMtYH2oPbdqptlROWMxobfTujfRZCREP0CP9hCnLQM8XfdMWGMjn8V2H/lnGlzBJlBnHNy++zfJZpU1M6iPdbJGe9GDKL9getNRDkix44FpYrLeOrH2gN/CdPi6fWF4z+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PrciBsrvGuzzfcUacjBwgsXSlc0j6o6X84uGBD9NpiQ=;
 b=OkSmLauG0xi8ReTbFjgle7sGHOrmfOEYlLmSMeZZ4ELnu8fZUlnDSaEkdHO8TfYKd7o9FZSvy9HejE8e/pI28V8+yQ7BSIhjbDST9Y95Vpy4pUH+6lYGeoy7YLNLim0zuzSrBAaqALJdGW6nnAuNe/Iz5a/Y1MjvMaj6z74PRV4=
Date: Mon, 22 Nov 2021 13:22:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <iwj@xenproject.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [OSSTEST PATCH 2/2] allow.all: Treat freeBSD memdisk-try-append
 failures as nonblocking
Message-ID: <YZuLhUi1THNMCx4T@Air-de-Roger>
References: <20211122115239.21743-1-iwj@xenproject.org>
 <20211122115239.21743-2-iwj@xenproject.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211122115239.21743-2-iwj@xenproject.org>
X-ClientProxiedBy: MR2P264CA0039.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::27)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 005fef41-0fba-41ec-e96a-08d9adb2c39c
X-MS-TrafficTypeDiagnostic: DM6PR03MB4762:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4762BA0A130FEAC674AF57278F9F9@DM6PR03MB4762.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sHtfYTYaaLz4bFmAV773sjxCU4BpSRD+dedWOh8xmv7ay+/eNfa53OOB+u8Jv9tI2F6NSIftowWlmmUl5yiYZwUuIx/RFzbkezQAWCX1d+dcCeLNR8KD6txLi1aemIUPFg18V/iWrXlqeN9nS7EjAOvkCH0AMCmhk+4RuZCjXmHSqRLncwPolFuyUuP0Dwt2K28uyz6J+nV296FmE0elKrC9OETl8s6Lv6GWOMnxtgr00AkUcLqnQ2CnH1OJkbVjUZzTYtAhNmtzAXKwyCqdngy7gLUnncQ3mALws0ZhSbeydSWZiySBmKbfvZ04B4oOUvu70nbs6PUO+H5FxEzBQXfjLTlnLb/HaACxkw6PWmHNACRKmVGp2ZaDR+4b5zVnoVPpH5qQ3YqKaahRHs2mu7ObKkZFf96l+IWKYHrygEEUmYdq2RL/YX1GBPQOLptTxBmxreLGXCAW1ZFCmvy5dKPfsKPEDbPCTTgGdBfNut7+bmb7PoPEzrN/iQK7/i8eRq+cC0AlUb3ZLyCbwtv0cMUfXkKDcnw7wYy5g5dB3b32dAz1/QFqD5SddxqKxg7QjisMrfh1In65siguKigqKo+a+P+nUNqsy6yEOZWeXA0SWob85dix4/J4kGmBYXO5uRJU5wm9mSrJcdQKACg1yQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(82960400001)(316002)(66556008)(66476007)(508600001)(4744005)(66946007)(83380400001)(26005)(8936002)(86362001)(6486002)(85182001)(8676002)(5660300002)(6916009)(2906002)(956004)(33716001)(186003)(6666004)(4326008)(9686003)(6496006)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3luWmYzdHZ1RzFVTUVKd2lnNmFjb1NsUFoxV0xnU0dlN3V2aFRqWFpzZ3VD?=
 =?utf-8?B?Q3Zoc2xiaWJmZC9uSmJlSHZZa3paSEpKZjAzNklsM1BtcjA2MXQxbkQ3dEs0?=
 =?utf-8?B?SXR1c0Q3M3V0Q1ZDTVZOLzloNGpZSS9hYTdEeHFJaTk1S3dzSXoreFpPUmlP?=
 =?utf-8?B?M1d1OFA4QUg2dW5FSDlpaDUreEVSYWJUKzMvSzFSOUszOTM0ZXUram4vQSt1?=
 =?utf-8?B?ZThWeURvb0RNcDBjc1VjMWlZcThjQnhzVlRBcWNGSVBObWMvTmVObkphR1Yy?=
 =?utf-8?B?UkhPYjBnZkdseTFJN0Z6OXY3dThUSFRwZ0k4b2R2TG9jQTNUUDVhMGlzRzF5?=
 =?utf-8?B?SEpFNUFDZEN0dGpWbjFvT0ViVEpPNjYyWnAwNGVWcndsME5ZSzZvbnovSEds?=
 =?utf-8?B?UkRlaHQrdFd6aWtjbU5mSUgxL3ZXTFNRbklyeFBtUFNGNjIrN1NrMkxQN0hm?=
 =?utf-8?B?WHJxYVZYNkNhSFR1WW5jOUpFM2hvZjAvMUNXLy90L09Fc0VWaCtvNGtjdjN3?=
 =?utf-8?B?L3JzTXViOG5oKzlDbGVzTFZsZmN2SDN1bTllT1VmVXp3R1hBSXFpUGtoWFFO?=
 =?utf-8?B?VnhleXpNOXo2bVlPTTZaVnNGanBNT0tNZFNjYVFrNVI2RGFzVGxwRC9aQVhn?=
 =?utf-8?B?SDQ4YmZEVU5tSDFVVU40R2s4aWZLQ2dORDFWekF6a3JoNERMYWZMQ3VuSHUy?=
 =?utf-8?B?cjdIclFnaGl2Q3BtS1N4UDh6c3o4bjZPNG5hOUlpVi9SWUVHeVRPcFY0TTcx?=
 =?utf-8?B?dU5xWHNrVzUrdDQzdS9nR0VDRGxFT3lJZ3ZRRDk2UlM5dWhSTWh2RlNHRGZV?=
 =?utf-8?B?QlliSW9XODkwY1FwWU5SNm85VVpSK2NEWFlaZXc3YmNDNUN6dEF0TzZGdzJC?=
 =?utf-8?B?NURtaE9JZlZ0OENwQkc4S3orNjZkMTVIdTlySVR2U09EZkxYTG44cCt4eUJp?=
 =?utf-8?B?dlp1eU5VTUZIR1RHV2RkR0tOaWNJdEI5ZWJ2Z1ZodHF6WWNhUHlsSVhrTTJW?=
 =?utf-8?B?TWZ1UlRGb3pKRzQra09sVTNVT014dnV0b1RJV0Q1TVdqRzZwN3pmSkFpQTNk?=
 =?utf-8?B?SGkxMEtNUkFFbTg3UWo0Q3VUanVzbUZWanhKNXA2YXpuWmdmZ1dGY01haTE1?=
 =?utf-8?B?SEVOaFdXZWNCUW9mZE4rN20wNVJqMWNzTlBKN21YWkZIVkphVm01UDJXTVZi?=
 =?utf-8?B?dEY1QXlQTFFtdTMweTFhWDFBYUxyRUdiTE94SzVnck1uSzBGazJGb1JUWVVV?=
 =?utf-8?B?Wnk1UlZHOEs4aCtBV1UvTnhjOWw3UjlPbmFDQ1J4SkN2RWRHZWk4ZXJvUW1a?=
 =?utf-8?B?R1pSN1pVSXJkbWp3Q0k2anBzTkV1N3FpZisyOUltTEF0UmVYZ2VPLzFLWTBO?=
 =?utf-8?B?aUMvNnpwdGFZY2RFVEZucEs4V3NzRDFsVVFrQi9hLzlTTkRGZWh2cWFWYmRL?=
 =?utf-8?B?UWMvUndRUmFTWHRPSXNsNDhHRTRUMkphSUh2bWNodmtZUE8wN2xFb01rWU1h?=
 =?utf-8?B?NW9ZdEh4RDJmQk5NaW5FTHNDUHAwQWJrTFBOVmdHM1o3bXphbWdza0FWeVBN?=
 =?utf-8?B?b0ZUWGRlSnpuZXUrR0MrSHgveSsvOXV4YWg2dDVmTXZKdnI4QnhoeWdyb1pK?=
 =?utf-8?B?V1pJbWppMlJucWF1QlNNdjJYT29GaEV5dTJzVXNXZmZ5Z1Zhc1lFb1J0VUFx?=
 =?utf-8?B?VkhONC9CS0N4TlRzVkxuaHZsY09hSDArLzAzRk1Vc3R3Z3FMbklpVEdxU09X?=
 =?utf-8?B?NHFYT0pFd25jWWNYWGhSdGY0QzV4TWxFV0I5NktOOUFBSjg2S2s1TXFQeWlB?=
 =?utf-8?B?NFBCaUt4M3pNL05Ic3FzNkIzR09WSkUwbGdvWXEvTGl1NnU0eTFibWJPTUhZ?=
 =?utf-8?B?cll5SkJYek1VdWdQL1pxNVA3ZUxDOXFmblVJbjFPQXJCcUFRRjNvQndqZXlr?=
 =?utf-8?B?MGswZU4ycjRWOEJEZHZHbzNCeHV5cmN4cXJkNnBsTWhjY29SRG14cDFDL2V2?=
 =?utf-8?B?c1NSQlN2a3JORGVtS29nOW1FcUE4SzBzdldZSm5FeGRHWnk4REN1V251NEpC?=
 =?utf-8?B?UTN2SHM1YnNVODJkTy8wSDJkYm9kOWRWakRITFJUVGJsQ2M4a1hwWWtEQjRs?=
 =?utf-8?B?SnBlVjhCZ1RkQ0lodHd2ckhzeGNJK0k5aTVIdUhNbXZLemRITFd2WVJ6U1p0?=
 =?utf-8?Q?FnioCEZJ6HcUOAIFcoAOGvQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 005fef41-0fba-41ec-e96a-08d9adb2c39c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 12:22:34.8096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LvQvQ854109QsX/tnpO6tldYBAXG8SZ13Io2XpqfLdloNiylWYrxOjbpv3V50Bu2o4xcW2bHw6HlfSQjYtqVtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4762
X-OriginatorOrg: citrix.com

On Mon, Nov 22, 2021 at 11:52:39AM +0000, Ian Jackson wrote:
> In practice this currently fails on some of our hosts.  We don't seem
> to have resources to investigate properly, and this will be blocking
> recomissioning of hosts if we don't get it out of the way.
> 
> Signed-off-by: Ian Jackson <iwj@xenproject.org>
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>

FTR, as I've replied on IRC:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

