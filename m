Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 679F443B08C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 12:53:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216368.375949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfK4t-0006Uu-PL; Tue, 26 Oct 2021 10:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216368.375949; Tue, 26 Oct 2021 10:53:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfK4t-0006Rx-Lz; Tue, 26 Oct 2021 10:53:11 +0000
Received: by outflank-mailman (input) for mailman id 216368;
 Tue, 26 Oct 2021 10:53:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d0pl=PO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mfK4s-0006Rr-BW
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 10:53:10 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f7f8b96-f31e-4621-8bbc-c564702a288f;
 Tue, 26 Oct 2021 10:53:09 +0000 (UTC)
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
X-Inumbo-ID: 2f7f8b96-f31e-4621-8bbc-c564702a288f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635245589;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=9l3RCVUWLS7Lm2rfMcrSR7qtzG1CqCiYd/IjtJXoAI4=;
  b=JvrOB8r9pKqfOLm87PRgf/1akHO+QTg7ZFhairgH8yh6fLivYmyb7gtZ
   vcb1qkqqGfZ8rAOkTCsCnycsCstnCzHZGY0Oqqa7ngMFlI1RNzMw/ShfS
   OzXr2WwBVDOlm7bty3FAMpvjZl+jvE/IOxBFijuRKKajHoISOqVJQOXIx
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: GOm1eWylw8y76vFLr18RfXqx11DTugJicEnPzwNUb8mBFTtlsFyOFOqE0SvVzsyipT6wVyn4LP
 DURzZ/+ltzSAyadmPVbdGQfTCGxFFJbL9TyjUhSiiSURw6WUaI4Xcce7Mw7rGez5rw2iQrOVaI
 Jo1GtAM7U1hDum09ol8KVU22f5LIbF3BHI3kEIAnQSB4zak5avJCkDakCamDhExl6jf7t1I11B
 tU4QPrXpgKJyHldrGxbX2whndU9PkvEd1UseFFZPv9sO9hLD0dbaOt9s8CU+ChgSe9mMFPPGjW
 dinNeZU48ADmvVWg1X8/1DGR
X-SBRS: 5.1
X-MesageID: 56461072
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6Zl/UaCzoFmoIBVW/xLlw5YqxClBgxIJ4kV8jS/XYbTApDt23jwPm
 jNJXDuHOauJMzH1etl+aYu29UkAu5LVyN5hQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX5500w7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/sCmCg4p46
 u5xh43tTxo1G6TqkeQ0ekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHvuWu4YAg21YasZmN6/ON
 +kEWCtTYQmHbgZEeVsmS5cntbL97pX4W2IB8w/EzUYt2EDZwRZtyrHrPJzQc8aTWMROtk+Co
 yTN+GGRKhMQOcGbyDGF2mmxneKJliT+MKo7DqG188lPkVKax2ENIBAOXF79qv684ma7WtlfI
 khS/TA8oKwa/VauCNL6WnWQp3qJvQUVXdZKJOQ85BuQ0arf4wufBW8sQyZIbZots8pebSYj1
 kKN2cjoAzNvmLSPTDSW8bL8hTGvPSkYK0cSaClCShEKi/HzrYd2gh/RQ9JLFK+uksazCTz22
 yqNriU1m/MUl8Fj/6y98Uqd22r0jpfMRw8xoA7QWwqN8AR9Y4K0Yp2y3lLS5/1AMYWxQ0GIu
 T4PnM32xOcKAJKWnSqBWtIRDaqp7PaINj7bqVN3Fpxn/DOok1a4ZpxZ6jx6IEZvM+4HdCXvb
 UuVvhlejKK/J1PzM/UxOdjoTZ13k+6wTrwJS8w4cPJ1fpNtLgalxx1cdBOWwnzImW4lkYgWb
 MLzndmXMV4WDqFuzTyTTugb0KM2yi1W+V4/VawX3Dz8juLAPC/9paMtdQLUNLhgvfzsTBD9q
 o4Hb6O3JwNjvPoSi8U92bUYKkwWNjAFDJTypt0/mgWrc1c+Rj9J5xM8x9ocl21Zc0Z9yrigE
 pKVABYwJL/DaZrvcl3iV5ybQOmzNauTVFpiVcDWAX6m2mI4faGk57oFep08cNEPrbI4kKckH
 6BUKpXRU5yjrwgrHBxGNfHAQHFKLkz31WpiwQL8OFDTgKKMtySWo4S5L2MDBQEFDzattNtWn
 lFT/lizfHb3fCw7VJy+QKv2lzuZ5CFB8MovDxqgCoQCIy3Erdk1QxEde9dqeqng3z2YnWDEv
 +tXaD9FzdTwT3gdqomV2fnf9Nf3SIOT3CNyRgHm0Fp/DgGDlkKLyo5cSueYOzfbUWL/4qK5Y
 utJifr7NZU6cJxi6tAU/29Dwf1s6t3xiaVdywg4TnzHY07yUuFrI2Wc3NkJvapIn+cLtQyzU
 0OJ299bJbTWZ5+1TA9PfFIoPraZyPUZujjO9vBpck/00zB6oeicWkJIMhjS1CEEdOlpMJkoy
 PsKsdIN71DtkQIjN9uL13gG92mFInEafb8gs5UWXN3ihgYxkwkQap3AEC7mppqIbowUYEUtJ
 zaVgovEhqhdmRWeIyZiSyCV0LME15oUuR1MwFsTHHizm4LI1q0twRlc0TUrVQAJnB9J5P1+Z
 zpwPEpvKKTQozox3JpfX3qhEh1qDQGC/hCj0EMAkWDUQhX6VmHJK2Fha++B8FpArjBZdzlfu
 rqZ1HzkQXDhe8Sohnk+XktsqvrCS91t91KdxJD7TprdR5RqMyD4hqKOZHYTr0q1CMw8s0TLu
 O128bsicqb8LyMR//U2BoTyOW78k/xYyLiumc1cwZ4=
IronPort-HdrOrdr: A9a23:NscAM6Gf5Gtb18EepLqFDJHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcV2/hrAV7GZmfbUQSTXeNfBOfZsljd8mjFh5NgPM
 RbAtZD4b/LfCFHZK/BiWHSebZQo6j3zEnrv5an854Ed3AUV0gK1XYeNu/0KDwTeOEQbqBJaK
 Z0q/A37AaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uHg9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9gwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgnf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQy/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKp7zPKN
 MeTP002cwmMm9zNxvizytSKZ2XLzgO9y69Mwk/Upf/6UkSoJh7p3Fos/D30E1wsK7VcKM0lN
 gsBJ4Y4I2mfvVmHZ6VO91xM/dfKla9CC4kY1jiaWgOKsk8SgfwQtjMkfII2N0=
X-IronPort-AV: E=Sophos;i="5.87,182,1631592000"; 
   d="scan'208";a="56461072"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TwjjJ7jCW4N/rz5FpUZE3MPzOaYqhc33Up0QHLm0Ypq67CTJED0X6FxAJO5vKUWEz1Oo7/9xcrnH0kiulNtYtCA4HubZYaHD1SglkY1sR2ubYgyrQHZiEiB/Vf5b/0lMmUyenMrA7vi0KWtg3qdYK/+Kpdkp7I20mQKKciJDbhjzDr7ZVJySGMrVl5A/OplUKcal0X/ZG46N+GRo3vAix3O+R4ocJlMJZpOc+zuUjI5/aDFpL6v9oAIzl719GPy+iMSfgMDgo5Fs5DqSSFHRMofFxxCsrvF2W0I6YlsKMZcDEeiFr0ntJ9E6mg5ryKDE8JjAQRC937QvzuuiKnRJYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0DJg+hmraSsp8QGZrIvJEFGWWT2wGpKz3HFb+iX8R0=;
 b=V1rJYduwde98LvNxS2RrVs7zxhaq9NaCMbD4K25QfzXJTGGqMMz6TjK1l5WAUbj7IlrDZbVOj7wOUc9p6n4UnNoNJEPazpXYRtfcltKOcU+P48S0hYdOXF1WLN3/mj3Vw2BCHNHXUC3KWbkra3RIPx3Xq/F7xyqBM9CompLDDdavdfkIA3jm/bvRj2nJcCpXe1D4R90+/UXgRSH4mfXk1dE/owQMRBAYNKjInVPTNqkzhtzKyKgiLts7L+vBg6DucY5mdQqJ0DncBCG3SlzVZKDI2LkxdIpMIr7lRgql23lQ8A+1+hZ1GBGzoJP5i5h4q5+ZR9Zc/yHY9wqMV8lqEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0DJg+hmraSsp8QGZrIvJEFGWWT2wGpKz3HFb+iX8R0=;
 b=xU9GeEmOU5ucUlD1xKhFJInUjXG/lJ/2nPuCy7OYmmeDXDfSHU+5up+6ApHmtEsfXTnQPmlgos6wAB484kqzCPSYSJtLaKBKuBU0TP8vM/2fUBpKQ3P5K2068KvCQxxVJ9PkvqHeF2rU6pYznBKsOaDdv1ZCZsa0WT5x18W0OXQ=
Date: Tue, 26 Oct 2021 12:52:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>, <jbeulich@suse.com>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Michal Orzel <michal.orzel@arm.com>
Subject: Re: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
Message-ID: <YXfeB1LWy6Hm81LA@MacBook-Air-de-Roger.local>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-9-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210930075223.860329-9-andr2000@gmail.com>
X-ClientProxiedBy: MR2P264CA0158.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 596e85d9-4f78-4652-81ed-08d9986ec6c2
X-MS-TrafficTypeDiagnostic: DM5PR03MB3068:
X-Microsoft-Antispam-PRVS: <DM5PR03MB306880D839AAE0C8741C438C8F849@DM5PR03MB3068.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8X7QLjOHJlfPzSPFMttah1DV8ry6lIM83ChWtJmr2zuqJ6cN76Pexk1SS7t81c7VGm5YKfr0V5hoghjMQizDFI5Snsr7VSV3dpjgvZx8hGmbnPNeNvAqRCVZvkJzJ1IpUK8zxnKtzCgs+AqGUSoN9WgWrN7WDd61bf1OU4oQ8NfRpo8Fl7Tg//mL7QxKPbUoP5SWLez15dMLW6s4XQjGbpq2l540YDgFuu4T86xSXL/OAV/ls/Ts/cAwNR33t4rLPpjDigdqwhwqXK7lAm+Uk226cER3MRgGVERu0p9k0KX3ES5pnZn0X2NPdh1MMV71Yy6+aWTQusiGMj2PuBlTKxWfX6rJZcXkLN67/OSOZqT74yR0tl2BRfjuUzfbIm+82DpoM5SUh+gYCZzo9LuNErmNz0o37JM7Pa/Nr4h1eEVbPH38TdmWKEiin4ajx/sRFgFsawo4xrpmsUY6/JUwLzV8G7wnnvpXibegL4aXIaPNd6r8ibnXqSvt3Z+OMg0Sk/GaOtwc18rkVMvQeI7nevEzXUObZMWfjJEsPXg9nvzLd5k8qUlR4uIXwSWum1MU1mg2Yphx+p0RS392x8rkUrELzQLW9Z3ebYTc1VIYXAHtfCcE+EwsJ8Pj0C2DtMzg/cu9EJ2AuCElSFz/WpduJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(8936002)(8676002)(956004)(6666004)(316002)(4326008)(66476007)(66556008)(85182001)(26005)(186003)(66946007)(38100700002)(6916009)(82960400001)(83380400001)(6496006)(7416002)(9686003)(2906002)(5660300002)(54906003)(86362001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NndmL1l4MnozUDg4R1BDY01EOFRjVzhNSGlDUWUvMlhObVhWQ1d4TTErTzJJ?=
 =?utf-8?B?aUh1TVU2TlhHNUt2QnZYbWFvZjlSYzdrUkxrdUFkZUQ4TC9FUkhrZERHdlpE?=
 =?utf-8?B?WDdqNXNWSXg2cTJjc0EvMkZBRkUweVdkdEtrOEk0Y21VakR4S1k4ZnpVN3Bs?=
 =?utf-8?B?N3Y4cmpsanl3SUcyT3d5ZmRiWmM2ODRLMHJvOEt0N3g2VzZWNkRHaC9mZjY1?=
 =?utf-8?B?WmhSMkZ1cmxWQU11UUpBbUJnNnJkZmdyQnZSdGtJTW5wYmppVk9ldzFRRFpT?=
 =?utf-8?B?a2N0dGxJUlJybFZTaUk1MmNuZXNtbEQ5V3pxbTRqeVNJS25lQTQ3TVlpMDMr?=
 =?utf-8?B?dnlNbFloODdyajRaNVVuSXhwSFkzWmIyRkNDMEE0OU5tZHNhWHQ4am9GRDUw?=
 =?utf-8?B?NkxXenp4eEFMSEI5UG15UlFJYnhHQWtScS9yZXlPMDNMRGRZQXFqQ0M4cnZF?=
 =?utf-8?B?VS9ZMm85c2gwTU5JcEoxNEhEQ2JCMHozVmozdlFxeXplTzN0b0VLTHNiLy9s?=
 =?utf-8?B?c25BWVg5eGFiWWdDVUMzRDVmNmMzN2Z1YzcxYnp5Nm8rZkY2TGtPb1JCSjFp?=
 =?utf-8?B?c0hjUktuQWhMb1RkRko1RG5sL2o5b1Q0dS80YUFkY3FFanp2eCtXNHRqRHNh?=
 =?utf-8?B?V0plOHdGWnpzc2hxQzVXMmd3Sk1XSFVBd0pwT21hMzhrQ1E5Tkp2Um5DMERW?=
 =?utf-8?B?YmM2MHFyRkRmUmgySm9nWWlmMTNJYzRBN0ZlS0d0a3NxTEF1NWVPeXNOZEZM?=
 =?utf-8?B?ZFh2aWhUNzJFeHJHMGRZUGdPWkFCMWJLdEhnd0ZnYndLbjJ4Q3VsMk12K3Z4?=
 =?utf-8?B?bmFTVnY2Tm56NDdmUVJidC9VcWJ6SEJFa1RRNUxVU2NoTzN0YUoraGEyMnRW?=
 =?utf-8?B?czM3WWtQTUh2bDRwbzlqME04L1JWZXRIWDFWVUQxRGJYbVpvV1dSKzRCVTRQ?=
 =?utf-8?B?aVpmOFY5WUNDdmtrY25TNkdrU2JJWndDOVk3endnL0RyQS9SdVJWZ2xrSzhx?=
 =?utf-8?B?NVN5Uy9zMG9HbG5pM01sWlZ2R2xpZ092N0ZLNEdMTFY0U2FEV2JKSFJHRTFa?=
 =?utf-8?B?VU5zYzAvSVJpZzk2Wk85bzN2ZzBVWjV1ZVBRR3BUdy9iVStoaHFXeHcrVXVP?=
 =?utf-8?B?Mm5JWUdLNFE3aHQ2aG41SklxWTR5YWRPSGhXcVAxZ3Q4clZtQTRROEhtLy9r?=
 =?utf-8?B?WitkbkVwNVVLTVBlUVpGU0hrZ3JHN0RUWDZLcXh5V0gyV1V1bVN3Z3pqNHd3?=
 =?utf-8?B?MFExR0RBcjVKSTFoelJBbGVJNkxiQk5EVUFHTExHcU1MOXBFVFp6d3Q0YW4z?=
 =?utf-8?B?ODk1SWVoUjcwT0RWNHlNekVnamRNcDlXS1BsY1I5dHFjVDA3cnpRTEVIaGJs?=
 =?utf-8?B?TWlocmlDN3VKUCtyTERPWmh1N09hR2NOdTRxQTM1c0pjaTZUdVR5YmQ5c1kx?=
 =?utf-8?B?RlBGVVN0aGwzNlFrQkU4UGNCNG5jSDJBazJRMmt6ZjZ3YWFGZXdMWE9iRmxS?=
 =?utf-8?B?bko5eWJPa2ROUCtWbkhzQ0tDZDBCaGRzVHQ5eWRGWkJocjdjemNLTXpCalFn?=
 =?utf-8?B?T1ljcVRwYm1MNndLRSs5M0dvaGdjT0duOXY1cFpFNDlheEszVW5ubk92djc0?=
 =?utf-8?B?TWlKbGR5eXpvS0NmNmFnODY3MXFDaGlsdTVUSDFSME1iK0xqT3pBY0drK3k2?=
 =?utf-8?B?TjBSZG5LMWYreWNDR0VKWUhqNEJiME5uemlEYXVhQXgvN3Y5Q0toN2lVYWRu?=
 =?utf-8?B?dnJkSkRKTkJPMGVlRTRmaC80R1FjdDZzNktGY3pWQ2tZVnRySng4Q3NCZWlW?=
 =?utf-8?B?dzFHeEo1OFptTi9IZys0K1U2dTVEQ2w1MjJXcGtjWFhvYW01SVhBZmxCbU5m?=
 =?utf-8?B?bjB2NG0vajBDT1J0dklzT01SYm1nQjFaTk1DM0E0WDlET1pPSUVIcUdPTm5o?=
 =?utf-8?B?ZVBlUTZ1R0xDM0JtcHJqaVVlSEtxZW52K3Z0RFpTbEt4VURieUFoaDFYL3Rv?=
 =?utf-8?B?MnFKTkkwei9kYUc4YXgwc3Y1YkM2M29TK1VrS2pvUXBZRjVJWWNTL1ZkUldE?=
 =?utf-8?B?V3FJTXVHcnJQZmNOTjRtMi9RUjNqc3RCTjFzdDhFN3puR3UvVTRpOW5QVUJL?=
 =?utf-8?B?akY5ZTlXTFlSRjBkWFBWSk9LVEJtSlgwU1p1N0doR3ZvVmwrTWFtek56a0Nv?=
 =?utf-8?Q?JoLmbegodyxTRU5CZPpw/qc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 596e85d9-4f78-4652-81ed-08d9986ec6c2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 10:52:59.9948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pq6A5RFKAotlfnsZO0rVsrQLs+pIV8Ybqs5saQPWFYBHXQinw6GFo2kvDlGw44lSd9M+TkROxE1Wc7HNIILtGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3068
X-OriginatorOrg: citrix.com

On Thu, Sep 30, 2021 at 10:52:20AM +0300, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Add basic emulation support for guests. At the moment only emulate
> PCI_COMMAND_INTX_DISABLE bit, the rest is not emulated yet and left
> as TODO.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Reviewed-by: Michal Orzel <michal.orzel@arm.com>
> ---
> New in v2
> ---
>  xen/drivers/vpci/header.c | 35 ++++++++++++++++++++++++++++++++---
>  1 file changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index f23c956cde6c..754aeb5a584f 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -451,6 +451,32 @@ static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
>          pci_conf_write16(pdev->sbdf, reg, cmd);
>  }
>  
> +static void guest_cmd_write(const struct pci_dev *pdev, unsigned int reg,
> +                            uint32_t cmd, void *data)
> +{
> +    /* TODO: Add proper emulation for all bits of the command register. */
> +
> +    if ( (cmd & PCI_COMMAND_INTX_DISABLE) == 0 )
> +    {
> +        /*
> +         * Guest wants to enable INTx. It can't be enabled if:
> +         *  - host has INTx disabled
> +         *  - MSI/MSI-X enabled
> +         */
> +        if ( pdev->vpci->msi->enabled )
> +            cmd |= PCI_COMMAND_INTX_DISABLE;
> +        else
> +        {
> +            uint16_t current_cmd = pci_conf_read16(pdev->sbdf, reg);
> +
> +            if ( current_cmd & PCI_COMMAND_INTX_DISABLE )
> +                cmd |= PCI_COMMAND_INTX_DISABLE;
> +        }

This last part should be Arm specific. On other architectures we
likely want the guest to modify INTx disable in order to select the
interrupt delivery mode for the device.

I really wonder if we should allow the guest to play with any other
bit apart from INTx disable and memory and IO decoding on the command
register.

Thanks, Roger.

