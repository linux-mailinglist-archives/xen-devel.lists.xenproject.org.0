Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB46742BCE1
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 12:34:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208198.364241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mabaB-00036C-Jj; Wed, 13 Oct 2021 10:33:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208198.364241; Wed, 13 Oct 2021 10:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mabaB-00033n-GB; Wed, 13 Oct 2021 10:33:59 +0000
Received: by outflank-mailman (input) for mailman id 208198;
 Wed, 13 Oct 2021 10:33:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFKL=PB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mabaA-00033h-33
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 10:33:58 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c09a2f3-1224-45a2-aff2-086cf54e8cbc;
 Wed, 13 Oct 2021 10:33:56 +0000 (UTC)
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
X-Inumbo-ID: 7c09a2f3-1224-45a2-aff2-086cf54e8cbc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634121236;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=JzPXlcySnHh9ql7f5Tyo7E0amGUef8EBMAc0OSw6bgU=;
  b=eWym9N8t+4wdzLhMZeIrGv1KhIotPJlwTkTsLXd/PEtNSAqJDdTov+An
   46BgcWhFb4h0qXLqG+DBAoXyi2XF9+AQ2H85G35DCYDhmj4br8lCchl6E
   dn+9P7nxV5rpnAKIdEcgX07tHoUvlbtwU/rndldu/LgB6CPDvLwEZ2L7K
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NJwuhDS557qlyqg2P8PtVDxhoGClwSXjBZKY2figBweo6mYnOcGPDOWFAATIIe/z0jwlOU/JJh
 BDQkQLHYpXEI0tyIfvpwre0LxOLJrWfv6cQM9L4hx57mdDVgAC+Pci0RBZ8JbbgZZ99JpcfUe1
 xdoJFaiSZcYjAmsCLaBDVlLKx3OUkhcM8o9yrMeLSVkUtAkJbCSTHgdnVhAFo623F9E6oOdtib
 w9xlV5ajJ8O2/c4BvD09+OZ9MXeydgN1k++GroK1DF73hGHJ/YWHG7fmVjVrVjd/Q9DOkrB5hs
 Ct5WMfd8BQGXwNdsp9fw7CJ3
X-SBRS: 5.1
X-MesageID: 54642394
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Ie2aMqOjCfzdP8XvrR2rkcFynXyQoLVcMsEvi/4bfWQNrUpz3zADy
 TYaXmzXaPePazTxKdwgao/ioEIC65WHm99iTQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6ZUsxNbVU8En540Us4w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYo2qSs49ui
 4tpjo69GQgXebKRyOZGbxYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/iWu4MCh2Zs7ixINciHS
 c4yYH1NUAndfxtFGHlIWcIzh9790xETdBUH8QnI9MLb+VP7zRNz+KjgNsLPfd6HTtkTmVyXz
 kr4+GD+DgAfJcao4zOP+XKxhcfChSr+HokVEdWQ9PRnnVmSzWw7EwANWB2wpvzRola3RtZ3O
 0ESvC00osAa60iDXtT7GRqirxasvAMYWtdWO/037keK0KW8yzyQBnUACAVAbtMmnMYsQHoh0
 Vrht/nkHyB1ubuZD1eU7K6JrCiaMDIQa2QFYEcsXQYDptXuvow3phbOVcp4Vr64iMXvHjP9y
 CzMqzIx750IltIC3ai/+VHBghqvq4LPQwpz4R/YNkqM6A9jacidfZ659lHB5N5JNoPfRV6E1
 EXogODHsrpIV8vU0nXQHqNdR9lF+sppLhWDmnIwANp/0w+/9i6sQ8dPvWF8f3tmZ5NslSDSX
 GffvgZY5Zl2NXSsbLNqb4/ZN/nG3ZQMBvy+CaiKNosmjoxZMVbdpnk3NBH4M3XFyRB0yckC1
 YGnndFA5JrwIZ9syyaqXK8j2LsvyzFWKYj7FM2jkUrPPVZzYheopVY53LmmMr5RAECs+ly9H
 zNj2y2ikEo3vArWOHi/zGLrBQpWRUXX/LivwyCtSsaNIxB9BEYqAOLLzLUqduRNxvoOyr+Wo
 ivlABMDlDITYEErzy3RNRiPj5u1DP5CQY8TZ3RwbT5EJVByCWpQ0EvvX8RuJuR2nACS5fV1U
 +MEa6297gdnEVz6F8AmRcCl9uRKLU3z7SrXZnbNSGVvLvZIGl2Skve5L1SHycX7Jnfu3SfIi
 +b7jV2zrFtqb1kKMfs6n9r2lwnv4iNHxL4rN6YKS/EKEHjRHEFRA3WZptc8It0WKAWFwT2f1
 g2MBgwfq/WLqIgwmOQlT4jex2twO+chTEdcAUfB6rO6aXvT8ma5mNcSW+eUZzHNEmjz/fz6N
 +lSyvj9NtwBnUpL7NUgQ+o6k/pm6ou9vaJewyRlAG7PMwahBIR/LyTUxsJIrKBMmONU4FPkR
 kKV99BGEryVI8e5QkUJLQ8oY73bh/EZkzXf99ovJ0D+6HMl9baLSxwKbRKNlDZcPP1+N4Z8m
 bUtv8sf6gqejBs2M4nZ0nAIpjrUdnFZCvcprJAXBoPvmzEH8FAabMyOEDLy7bGOd85IbhsgL
 AiLifeQnL9b3EfDLSY+TCCfwepHiJ0SkxlW11tedU+Rk9/Ii/Jrjh1c9TM7ElZcwhldir8hP
 2FqMwt+JLmU/icuj89GBjj+FwZEDRyf20rw11pWyzGJExj2DjTAfD8nJOKA3EEF6GYNLDFU8
 YaRxHvhTTu3Ltr62TE/WBI9pvHuJTCrGtYuRCxz8xy5IqQH
IronPort-HdrOrdr: A9a23:a/eKDaoaVSAvS3j1rwAWin8aV5u6L9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPPHFXguNbnn9E426gYzNLrWJ9dPwE/f
 Snl656T23KQwVpUi33PAhJY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX232oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iBnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJDA4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWArqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocWTbqjVQGagoBT+q3oYpxqdS32BnTq+/blnQS+pUoJjHfxn6ck7zA9HJFUcegM2w
 2LCNUvqFniJvVmGZ6VP91xM/dfPFa9Ny4kAFjiUmgPK5t3Tk4li6SHq4ndt9vaMqDh8vMJ6e
 P8uRVjxDcPR34=
X-IronPort-AV: E=Sophos;i="5.85,370,1624334400"; 
   d="scan'208";a="54642394"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2fVI0JXAweA+HCyR7onWDcq3WG3acXLVnTXBw8Df2Cf7T0N6hvc6E6cN6Rw66nqnOCnd5FKx2VWfjSDp6DYTSdk5wx/c9cgFZ8F9RRLispQrt/ZRRjMPaiX2krq+R9tWR27lp9ToQc2GczwoaH7qtIN33VTYHpLNxuN7jDJO7kxoATPO9C8QbnCEVfcDKlR5ZTRopiL7osuTuIejPi+NE8zmKBX0ECCW2k5+95vSRrfnBUKD/yRiKrYOEGGB7pHDmFtPnMVzabUp5iIxYe6zXyEvuXMEN5GwGLpSzQ8lYh/gWmqGpyj1V1o5cjdrOd3JiHxbFcv8q8iZQJN9chLNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVme+dt+GHnxXOGOyvRMjypqZzYv6JLcNENHaHfXkVg=;
 b=UweS1q1IkA0K/nksfAojAAiKltx3Mi3n5syl6sc92JO11ZsOGYO1uUnwg+vcBDiIeQ0W6hsMRKu0MMVm+dYaIrMuB5vhrG7ViIAoq+4jfS0nY/i1exMXLOysPeQ6Ijo1pw1ju0Koi6Emzr9cVW7zekwOhLKOZesD0ffW0KJmuCAQkkvBC1eDCqTqnbPcOKhT9Kx+fFfSlCCYo8ozpWOTf81VcCO/iIfmdO8w0EbmfnDFo3jJvZNrtU07UA1TNdMqFfh06cZRcPFejGwiXP0nrJCnvPsiV3HerCYi7KNpamCKKvmP6Q4nyc7sJVDwQsXslAyDbmAZ2kzkwODhwwRKHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVme+dt+GHnxXOGOyvRMjypqZzYv6JLcNENHaHfXkVg=;
 b=BUkvvK5iKtb6MC+xF7HJj+xBL6OFK5WLU4aV26sosMOju1bfTjCoRcl49kByQt79ebBH5rrcg1LxjAtLVzDww42x+ozpdDBzptD7Ckpky6OQUaQqXJFAUODlMwBuodQibj4oZpVcmx6d1b7DAwVR+XkZdIH/NhsNTMv1b2bOYXY=
Date: Wed, 13 Oct 2021 12:33:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Rahul Singh <Rahul.Singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andre Przywara <Andre.Przywara@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Message-ID: <YWa17Y8siYOhf6fT@MacBook-Air-de-Roger.local>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
 <YWaco/UvA4xFE1xW@MacBook-Air-de-Roger.local>
 <7077F76D-37B0-45F6-9B0D-0D9436E23716@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7077F76D-37B0-45F6-9B0D-0D9436E23716@arm.com>
X-ClientProxiedBy: LO4P123CA0395.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4411ce34-189c-4e70-2f42-08d98e34e119
X-MS-TrafficTypeDiagnostic: DM6PR03MB4539:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4539D337A8B44C58BB09A4A48FB79@DM6PR03MB4539.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FHVVwA1nopo+L/JKRUrfPjlg/cr2TqOPqc4FRKy+Krbrp5KFzvqEc94s62heR483HEyYs0lihokAHzsJgXRXbTbAYTHM2XcOfmEXpIk6D93nX92WkIPb8vKBXZ4Pb3b89ZCgVzwJQhk28L9cT1AJSh9TlkR0xDMQWxprOvFBvJeuST6Sc3tN9xdNl8CswYZXR+g9bmH2Uvh3LVojJ9W75MyWkfl9VT/bx2ISmvX+MvO2GVFhFLwn+oQWNJaWTERgdw/I4d0GFuoM1n5uq+WPR1Hcy6XsylBKZcfDieVkzVXEWwF2jLH35mJYQSe7a4bwor9B7TTnyBzO/vyF45zmKGrAaHFmXjkzYsZIBog9JyAT0gueWq2QBtA5gFiNIke93o1KseTDpuLmGx3PaftgXsHK4Ihq+eopYRtFamxmBUVdOOVfdZJhSBpoaerQUwinkheAxPdwnngmkWWgv8459iVTtFNIVj/5+qPvPtnYA2337CVhCwF1ALJq1boFw5ZZ9EmXAyUq3UYvr7nXyShJvaPYe4ToFs2jVvaIGDFbh0HFFtlx7Q6TU6Tnq/+cQYD8C3MuEtS6GLuIyxgdvmplbLxpQ/HpqfFvi66PJoxbPrzYwQad+cPzeAEkHlzOx/YreZFg39jOauHKslQzo0D5EcN5qpHN6A55+PMXcekat1UYWgMuyLQLOY4xn+voigmvErsacUqlpc8Pm8f4SlyFLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(2906002)(6666004)(186003)(26005)(86362001)(82960400001)(5660300002)(85182001)(54906003)(66556008)(66476007)(66946007)(38100700002)(8936002)(6496006)(956004)(4326008)(8676002)(6916009)(6486002)(83380400001)(508600001)(7416002)(53546011)(9686003)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nk5hN2hiWldERVhrSHRGSEFJa0N4dTM2Nm1yb01XdnBRNEFhQ2pYWHNIV3A2?=
 =?utf-8?B?dklINlFyN083c3BUeXE1eC8wQ1ltOUhvN1FITHd2WEJENk5nVUpwTEFLNXBH?=
 =?utf-8?B?azZCSjNuZDBqMmt4QXVnWEtOQWw0UHAwQnR2NTBIQ3FkUmd1bmFCZmVPVDZs?=
 =?utf-8?B?U1F0WVB3dmtmN0V0VitXOC9MMitXUnZraUpoODF3WVNrclI5OE1waDNYYS9M?=
 =?utf-8?B?ZlVocm02cENJUTlYZ2gzNFlyeTUvQWZKdmJuM002MExvd1IyTytDWmpTeGpu?=
 =?utf-8?B?N3h5N2Q4MHIxSDl0N0NsL2tWTzBRR1BiUlBHbjNxUnhrL1Zaa3RGcS9MOFQ1?=
 =?utf-8?B?TCtCVDVoUXBKSkJGODhIYXJkTHdCV1FIYTIvNjNKZHpCVndhSUIrYmRHUVlB?=
 =?utf-8?B?bXBjN1BmU1pCeU95NW1FajNlNURxRWNxUVhBNVdQRU9zN243YVM4QnpvZXBm?=
 =?utf-8?B?K29xSDlDaXA2NlYxUWpTYmJ4aUdkN25MRjhQbU9RajRHZnUweWszNmNYY2FR?=
 =?utf-8?B?TjlTeDBvUFh0LzZLc3VNbUlWeU9hS1NFNVJSRm12VUt6RWJ4clloYW5pcERE?=
 =?utf-8?B?Mko0T3RYVjE0SnA3RXZkdHFGc2pCOUJpMGZaMTdsbjVqdTRNbnpESXZVTU84?=
 =?utf-8?B?RjB6eXBQNXJRSnpJMTI1OVpYRlJ5NG9sT1FLYkdieHZIeFpvL055d2pTTHV3?=
 =?utf-8?B?REZyNHFjVjZiNFZ5OTZxa2lnMmRuU003SFNMMlhvSGp5SDBvZCt5UmJHOGtE?=
 =?utf-8?B?ZVV5MGlhdGlYb1dsNDY4NkpCK3dQdndNallTSnRvRWpDZmczZm1zbm5GMG1o?=
 =?utf-8?B?TzZja2tRbjRkTlk1b1lxQXNVTGtCV0xsOS8wL3BaNzZVeXMxME8rVlBNZmlF?=
 =?utf-8?B?TmU0dDB1SHFnbWxqSGcrcllDSGdFa3NEeENTbWpKdVh4Vk1Ua2ZTL2RSNUx0?=
 =?utf-8?B?ZEZuTko5bk5LQ2JVc1FVdzdSQ1JjNzhWWFAwY3luQ0NYVS9CN2lWY1FPcThr?=
 =?utf-8?B?Y1NOcHUrZ3NVVnN5UlNLWVJWV3BhTFZtVFpnRVlRVWdxYy9FcE9WZ0FILzJC?=
 =?utf-8?B?UlBTT1dRS2VNdnA1V0l2eStOZ0EwZU4xcW82SWxNRC9IOXg1MFJiTXduNDdP?=
 =?utf-8?B?V3IrdDlrUjdBNTZyOUtXNmZCeTQvSUdTMFdrY3pBTEl3NGZJYUwzQzE5NU40?=
 =?utf-8?B?ZVFPMXF3MkFqLzVCN1JUUzhoemlLUjZNRzlYKzdVNUZ6WFp5K2lhRkhBYlda?=
 =?utf-8?B?NW5nUEJJcWdyUnBoLzBlWWVyZUJqcDBxeHNyZGtnZitGRldKd3lTZUFRSUZa?=
 =?utf-8?B?YWpVSFBCa3YvcUdRQ3lYOVhHbmNTa3ZRRzdJR3NiOUNvbUhjQ2M3ZURCUTZr?=
 =?utf-8?B?S3FRcTJrc1UvZnhKR2U2Z0V0MElLUkU2UHNRTDdsMW53RFVEMVdtdjNOOHdX?=
 =?utf-8?B?U2h3ODhvZzhIZVZtMWdnbnIrK1lrR2o3Tld6NnM5UXdGQnViM3hxNm1iME5B?=
 =?utf-8?B?Tlc0ZEFxUjJYOENMRGRTdmhJUGM4dGpma3VSRFFTbkdjbDdGZTRMUGlMejZQ?=
 =?utf-8?B?UnVwaE9oUUdMSjZmRlByZjN6NTVIUkhEVlpqbmd4amwyYXE3OHR6VzZ4SW9k?=
 =?utf-8?B?VDluRnNLQkV2RzdRL056RzFRWWRmTnByeTdBVDQrMTZFUDQ3eE83KzRReGV4?=
 =?utf-8?B?dUQ5d0FhUEpxeXRVajBMWEZ3Wk9HaGpqRkQxYURIbzN3RVhtNjJ6VTdFQjdv?=
 =?utf-8?Q?D70xpHxU3rtjg+ZWWcgEI0sR1LfnhdUQY/VvQN6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4411ce34-189c-4e70-2f42-08d98e34e119
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 10:33:21.7773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5rOTnnLEKGWE1hajP7eoP52cEdfX3EzfjnL6LQGSaU1nf5p9ONXUoUaIGgj4aS9kaTy6mRAlk7G9opVZmFRMiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4539
X-OriginatorOrg: citrix.com

On Wed, Oct 13, 2021 at 09:48:42AM +0000, Bertrand Marquis wrote:
> Hi Roger,
> 
> > On 13 Oct 2021, at 09:45, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > 
> > On Wed, Oct 06, 2021 at 06:40:34PM +0100, Rahul Singh wrote:
> >> The existing VPCI support available for X86 is adapted for Arm.
> >> When the device is added to XEN via the hyper call
> >> “PHYSDEVOP_pci_device_add”, VPCI handler for the config space
> >> access is added to the Xen to emulate the PCI devices config space.
> >> 
> >> A MMIO trap handler for the PCI ECAM space is registered in XEN
> >> so that when guest is trying to access the PCI config space,XEN
> >> will trap the access and emulate read/write using the VPCI and
> >> not the real PCI hardware.
> >> 
> >> For Dom0less systems scan_pci_devices() would be used to discover the
> >> PCI device in XEN and VPCI handler will be added during XEN boots.
> >> 
> >> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> >> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> >> ---
> >> Change in v5:
> >> - Add pci_cleanup_msi(pdev) in cleanup part.
> >> - Added Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> >> Change in v4:
> >> - Move addition of XEN_DOMCTL_CDF_vpci flag to separate patch
> >> Change in v3:
> >> - Use is_pci_passthrough_enabled() in place of pci_passthrough_enabled variable
> >> - Reject XEN_DOMCTL_CDF_vpci for x86 in arch_sanitise_domain_config()
> >> - Remove IS_ENABLED(CONFIG_HAS_VPCI) from has_vpci()
> >> Change in v2:
> >> - Add new XEN_DOMCTL_CDF_vpci flag
> >> - modify has_vpci() to include XEN_DOMCTL_CDF_vpci
> >> - enable vpci support when pci-passthough option is enabled.
> >> ---
> >> ---
> >> xen/arch/arm/Makefile         |   1 +
> >> xen/arch/arm/domain.c         |   4 ++
> >> xen/arch/arm/domain_build.c   |   3 +
> >> xen/arch/arm/vpci.c           | 102 ++++++++++++++++++++++++++++++++++
> >> xen/arch/arm/vpci.h           |  36 ++++++++++++
> >> xen/drivers/passthrough/pci.c |  18 ++++++
> >> xen/include/asm-arm/domain.h  |   7 ++-
> >> xen/include/asm-x86/pci.h     |   2 -
> >> xen/include/public/arch-arm.h |   7 +++
> >> xen/include/xen/pci.h         |   2 +
> >> 10 files changed, 179 insertions(+), 3 deletions(-)
> >> create mode 100644 xen/arch/arm/vpci.c
> >> create mode 100644 xen/arch/arm/vpci.h
> >> 
> >> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> >> index 44d7cc81fa..fb9c976ea2 100644
> >> --- a/xen/arch/arm/Makefile
> >> +++ b/xen/arch/arm/Makefile
> >> @@ -7,6 +7,7 @@ ifneq ($(CONFIG_NO_PLAT),y)
> >> obj-y += platforms/
> >> endif
> >> obj-$(CONFIG_TEE) += tee/
> >> +obj-$(CONFIG_HAS_VPCI) += vpci.o
> >> 
> >> obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
> >> obj-y += bootfdt.init.o
> >> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> >> index 36138c1b2e..fbb52f78f1 100644
> >> --- a/xen/arch/arm/domain.c
> >> +++ b/xen/arch/arm/domain.c
> >> @@ -39,6 +39,7 @@
> >> #include <asm/vgic.h>
> >> #include <asm/vtimer.h>
> >> 
> >> +#include "vpci.h"
> >> #include "vuart.h"
> >> 
> >> DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
> >> @@ -767,6 +768,9 @@ int arch_domain_create(struct domain *d,
> >>     if ( is_hardware_domain(d) && (rc = domain_vuart_init(d)) )
> >>         goto fail;
> >> 
> >> +    if ( (rc = domain_vpci_init(d)) != 0 )
> >> +        goto fail;
> >> +
> >>     return 0;
> >> 
> >> fail:
> >> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> >> index c5afbe2e05..f4c89bde8c 100644
> >> --- a/xen/arch/arm/domain_build.c
> >> +++ b/xen/arch/arm/domain_build.c
> >> @@ -3053,6 +3053,9 @@ void __init create_dom0(void)
> >>     if ( iommu_enabled )
> >>         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
> >> 
> >> +    if ( is_pci_passthrough_enabled() )
> >> +        dom0_cfg.flags |= XEN_DOMCTL_CDF_vpci;
> >> +
> >>     dom0 = domain_create(0, &dom0_cfg, true);
> >>     if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) == NULL) )
> >>         panic("Error creating domain 0\n");
> >> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> >> new file mode 100644
> >> index 0000000000..76c12b9281
> >> --- /dev/null
> >> +++ b/xen/arch/arm/vpci.c
> >> @@ -0,0 +1,102 @@
> >> +/*
> >> + * xen/arch/arm/vpci.c
> >> + *
> >> + * This program is free software; you can redistribute it and/or modify
> >> + * it under the terms of the GNU General Public License as published by
> >> + * the Free Software Foundation; either version 2 of the License, or
> >> + * (at your option) any later version.
> >> + *
> >> + * This program is distributed in the hope that it will be useful,
> >> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >> + * GNU General Public License for more details.
> >> + */
> >> +#include <xen/sched.h>
> >> +
> >> +#include <asm/mmio.h>
> >> +
> >> +#define REGISTER_OFFSET(addr)  ( (addr) & 0x00000fff)
> >> +
> >> +/* Do some sanity checks. */
> >> +static bool vpci_mmio_access_allowed(unsigned int reg, unsigned int len)
> >> +{
> >> +    /* Check access size. */
> >> +    if ( len > 8 )
> >> +        return false;
> >> +
> >> +    /* Check that access is size aligned. */
> >> +    if ( (reg & (len - 1)) )
> >> +        return false;
> >> +
> >> +    return true;
> >> +}
> >> +
> >> +static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
> >> +                          register_t *r, void *p)
> >> +{
> >> +    unsigned int reg;
> >> +    pci_sbdf_t sbdf;
> >> +    unsigned long data = ~0UL;
> >> +    unsigned int size = 1U << info->dabt.size;
> >> +
> >> +    sbdf.sbdf = MMCFG_BDF(info->gpa);
> >> +    reg = REGISTER_OFFSET(info->gpa);
> >> +
> >> +    if ( !vpci_mmio_access_allowed(reg, size) )
> >> +        return 0;
> >> +
> >> +    data = vpci_read(sbdf, reg, min(4u, size));
> >> +    if ( size == 8 )
> >> +        data |= (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
> >> +
> >> +    *r = data;
> >> +
> >> +    return 1;
> >> +}
> >> +
> >> +static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
> >> +                           register_t r, void *p)
> >> +{
> >> +    unsigned int reg;
> >> +    pci_sbdf_t sbdf;
> >> +    unsigned long data = r;
> >> +    unsigned int size = 1U << info->dabt.size;
> >> +
> >> +    sbdf.sbdf = MMCFG_BDF(info->gpa);
> >> +    reg = REGISTER_OFFSET(info->gpa);
> >> +
> >> +    if ( !vpci_mmio_access_allowed(reg, size) )
> >> +        return 0;
> >> +
> >> +    vpci_write(sbdf, reg, min(4u, size), data);
> >> +    if ( size == 8 )
> >> +        vpci_write(sbdf, reg + 4, 4, data >> 32);
> > 
> > I think those two helpers (and vpci_mmio_access_allowed) are very
> > similar to the existing x86 ones (see vpci_mmcfg_{read,write}), up to
> > the point where I would consider moving the shared code to vpci.c as
> > vpci_ecam_{read,write} and call them from the arch specific trap
> > handlers.
> 
> Would it be ok to have ecam specific code in the vpci common code ?

I think so, ECAM is part of the PCI specification and architecture
agnostic, so fine to place in common code.

> This is an optimisation and we could do that later on as this is an other
> change to be done and tested which will start to make things very
> challenging with the friday deadline.

I guess this could be done, by adding a TODO note that the handlers
should be unified with the x86 ones and placed in common code.

I however get the feeling that such work would ultimately be ignored,
as there's always more pressing stuff to be done, and people tend to
forget about those cleanups once things get committed.

Thanks, Roger.

