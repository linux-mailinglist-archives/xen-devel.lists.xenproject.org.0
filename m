Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BB466D004
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 21:18:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478967.742514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHVuo-0005gQ-Px; Mon, 16 Jan 2023 20:17:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478967.742514; Mon, 16 Jan 2023 20:17:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHVuo-0005dF-MU; Mon, 16 Jan 2023 20:17:10 +0000
Received: by outflank-mailman (input) for mailman id 478967;
 Mon, 16 Jan 2023 20:17:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbzH=5N=citrix.com=prvs=37389537a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pHVum-0005d9-5K
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 20:17:08 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd98b9bb-95da-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 21:17:06 +0100 (CET)
Received: from mail-dm6nam04lp2043.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jan 2023 15:16:59 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB6859.namprd03.prod.outlook.com (2603:10b6:8:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 20:16:55 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.019; Mon, 16 Jan 2023
 20:16:55 +0000
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
X-Inumbo-ID: bd98b9bb-95da-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673900225;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Kp0u26wWA76HiMuy69towX92MOBbT3n7/atAsLsYbK8=;
  b=FRb/BveT3n/j5PDCLaT4aXHteO8D7JvxrjqmrxMnTyezxMvVsUUsZtRX
   /6fkGeI3e2REO6V+Q1hCauDFyci9kfLISUU1c4EWlwT4gXCUP7K+vu3Ym
   RfTCnGIBGa+GJtl9iVql7cPb6WDws0OVT8D6KEYFj0hP1FDots4/Msc5h
   Q=;
X-IronPort-RemoteIP: 104.47.73.43
X-IronPort-MID: 95333692
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:npAiMK0tYWA6wqISuvbD5Rxwkn2cJEfYwER7XKvMYLTBsI5bpzMGz
 DYXXGqAPa6DZmryL9Egaou/pkwPusWGnNJjTQtupC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gVnO6gR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfLWtkr
 9FFNWo2ahnEuuSHmJ67c+k1r5F2RCXrFNt3VnBI6xj8VapjbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouC6Pl2Sd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzH6gA9lMRefQGvhCp1CUyj0ILQYtWHSJvdf6yUD5YONZN
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml1a788wufQG8eQVZpdN0jnN87Q3otz
 FDht9n0Hy5mtLqZTm2U3riRpDK2fyMSKAcqdSICCAcI/dTniIUylQ7UCMZuFravid/4Ei22x
 CqFxBXSnJ0WhM8Pkqm+o1bOhmrwooCTFlJuoALKQmii8wV1Ipa/YJCl4kTa6vAGK5uFSl6Gv
 z4PnM32AP0yMKxhXRelGI0ldIxFLd7cWNEAqTaDx6Ucygk=
IronPort-HdrOrdr: A9a23:BOYvE6x21ceJ2nG7FMrVKrPwPb1zdoMgy1knxilNoH1uH/Bw8v
 rE9sjzuiWE6wr5J0tQ++xoVJPvfZq+z/JICOsqXYtKNTOO0FdAR7sM0WKN+Vzd8iTFh4tg6Z
 s=
X-IronPort-AV: E=Sophos;i="5.97,221,1669093200"; 
   d="scan'208";a="95333692"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOcSvN7KLFK7rSvvOamPHCL/WBxjCjgZwNvvfcITmAPiAFMg/UmuSnBcbuBfJnpEpLWHs9J/9RndErmYPm4qWIugj2u/6UfoQqEBiF3T4hN+hZ0bJ8jXquJiHYh+mlgeIDP/+AHpj+O6Cf/C0V/YTQ0FTwWKMOSVP0EwvFw2/I6pPvWRy0ryYRIzsKz0/b/7W7vBDXcvqvWUaMNs1f2VtxY/8juB3Y1lW3m7unbH/YwxAOZpPCPkFPqr50PUFsK0uX8SVj9R4jXgNsYAhrcBwdC+WZ7aGfYHsNtjSeHHrJ+T1S1LqkvG7umNTri1QWlKyKuVHRRri8+OUeOLcXcvFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kp0u26wWA76HiMuy69towX92MOBbT3n7/atAsLsYbK8=;
 b=anmQcNmpP2bmRkztrqvqqDZmaY7hplDBtIH2CeG+JQtVGThY+un2PfBymcdrDLxCwTRd+UxIJ/lCGMYPZA2Rxfg0SfoiUIB/HPQK3aKgPj+FmpX5dXqYcYAEEHalAkQEYokm8qUjiqeFChd6TAILGFygmPeqWuG0ExPtSNu20AMztlqFX9d0GbylLgTkLfHBguaft7tg6RGH4DQiWX88WO/NRGvDCRqJoCqVu7hd5h5/DZHyPmUNzPQPJIF19BPEfZ8Hmdjo+GV27YzrJAxgZzgoIsTNN6tNAXN3+2KrFgEdEK9Ev4nxpWU4+5mxug9kygQQka8L3J/w/QV8/R9qig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kp0u26wWA76HiMuy69towX92MOBbT3n7/atAsLsYbK8=;
 b=xYhHv/35TpdD4U3WA4lQ6W2RrBhGNytY5Ca1KNe3h+yKd5IXoopZO8WlD4Cxpb3GOcj0nO8OzvFnqYyFMG9nOerc3cYGcuWAzR4eYnCD0GaTOEMQRH3Acks5Pfbp2JwCNnu3c13eDBATWEzFlWGcZgdtr+0IulDA9G9j1y8KVRI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, Xenia Ragiadakou <burzalodowa@gmail.com>, George
 Dunlap <George.Dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] x86/shadow: sanitize iommu_snoop usage
Thread-Topic: [PATCH 1/2] x86/shadow: sanitize iommu_snoop usage
Thread-Index: AQHZJyu6jkZvmiKMqEGYr+zksqnvb66cPWcAgASFPYCAAL33AA==
Date: Mon, 16 Jan 2023 20:16:54 +0000
Message-ID: <d7a81b30-3f49-7799-3dd0-c884def2e390@citrix.com>
References: <01756703-efc8-e342-295c-a40a286ad5f1@suse.com>
 <cf0ed06f-4d49-0f73-cfd9-eb49e951048c@suse.com>
 <f24da4a8-4df8-0ec3-32f9-41f134b87d67@citrix.com>
 <9e918d63-3f32-6d43-9836-a9b75b98c295@suse.com>
In-Reply-To: <9e918d63-3f32-6d43-9836-a9b75b98c295@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DM4PR03MB6859:EE_
x-ms-office365-filtering-correlation-id: c2829ce8-a3af-49bb-9b81-08daf7fe9cb8
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 FDdoUVeq9v7pmiHkuGPejs5Rn0fP6mj1mS/BHUcnsmEL99VOpKRlJEcIAvhn/89BN/2DvOiMnrwM1se0gEcm61wA6U3C38vdOgxtOTqxvsJGIVIBterdADdPE3JcMsWVMO6lfHcGN7hmV4V1kV6R0ER9hAUzWgKhFU3arNUYGWZrXLqv2bmBDwO2N/nN9VqxygQ4XTLpOm0mpidot87uh3Y5qd9ygrZO8KstlIOfoiGFWNVKkxsvWRMVQ0eqLDvfF1JoTx9dN2yKotZgvw2Vq+Qe3zBHIOhdcQiyGnIQTjE4kXj5/XMuC+nOE/eCsZTcV1hRoqgCEqDMaBWvRieS2uAZDdgc/BC4iDXupz31lRH4cfmhoEOEkT95Oov5xotlCo0gJSJ01W1lWuznbuuwUisBIP08orYo2onZbQ7v8c3bFe+zO60EyyzwVVA4gQ/6ZvTwenZQDvOg9BwEUtIHZfT3pU7Hc8vPAUAuT7VCUyHVbGrfGgGtAkDTIqIm6mXX/i/KgZU0UmJS9D22JIiMOBx+J9Ab+/bQgKmVFXzvEFpn5ozdv3G9u67mJCtPJwHy/03LsbYTuzpJzQX6Rh+/EeVXxU6GDfHcZb3vif8ft4H8cfiCxwlGtwG3XnCUGuDVOL+x2R9gME8V1qUAV84vu75mMq9X7b0ZvId2xcxErXBb4BHEo4X/w2DaqOPkGiCHzqPRXXeoY51RVnwuzaaK+rxrSWytkUHR8U548wOqCcw9QBP7vAbtakxqdeFXHOSG+pmAyrNTxnqETKUNDwYhcA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(366004)(136003)(346002)(451199015)(31686004)(36756003)(8936002)(86362001)(38070700005)(66556008)(66476007)(64756008)(66946007)(4326008)(76116006)(31696002)(6916009)(8676002)(5660300002)(2906002)(66446008)(82960400001)(38100700002)(83380400001)(122000001)(6486002)(478600001)(316002)(54906003)(71200400001)(91956017)(41300700001)(53546011)(6512007)(26005)(2616005)(186003)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RDU3Y2k1UzBCMyt5Yms2NUtlQXg5WTdXSUxMUUJxWDVPNHdEaStmc0NTeTN2?=
 =?utf-8?B?UFEyb2RnTlJ4NXJBVithZnJ4b1ZoTDYrU2YwWkJ5bHNsNEFtVkd6dENhV3ZW?=
 =?utf-8?B?NzdyditDTlc2SHgzV1Y2ajFhV0dvNjlGNEJ3eUZMeWtZZysvMWRtK04xOEVD?=
 =?utf-8?B?OHZxNUk1MlRKNWY0WEN1cmZ0a015Vm5yYURJTU00MXZZVkRwblk5MW4wWkJ2?=
 =?utf-8?B?akNlZ25YSU5FYVF1N082V2hveXhNb1RabEYzUTUvcFVnU0F3K0N5enh3WnJw?=
 =?utf-8?B?ZFhRWTYrN29QdisxZXlMNTlGRHZFcnJkMmNqTGNiUDRwVHlqYVliVUY1MUhE?=
 =?utf-8?B?TmJsNWFaK0xZdWxJem5UUGhzU1Z0bjdVa2NXc0VBaHpaUmZiY0dzV2Y0bVd5?=
 =?utf-8?B?OTlyKzZmM1BJR0xwZXByQ2swTUZmTVFWelludDdkTHdhczhrdW96SksxcVpN?=
 =?utf-8?B?TU9RRkIrM2t3b2JrSnkrWkhmaDIwWUtDNFhGME1GK0hja0VCR1EzR3IwUGZT?=
 =?utf-8?B?eVppMEpUUDBhZmZSbzdrZUhLSThMYk50ajR3UWZXcDMzWmI0aVlwdTdkNmpY?=
 =?utf-8?B?d0NVZXlZcGdrbi9TQXdjakV5UU02MWdiNzJRSXpkd0dsdEpHRytpcUpQUzlC?=
 =?utf-8?B?MHFjUFRCOWhWVGtMeWZFd1UwejNCUEdUcVBhaW96OUpNNytBQm9ZY1UrdUZK?=
 =?utf-8?B?bkVCdXRLSWNCRkJyTlcySTBwV0VMSjVxSi9IcG11dlRyckpiZnpMbW05YThW?=
 =?utf-8?B?U3RaNzE1V3hWOEhEanFDdWgzQkQwTk9XSnczWFlVbmNxZExSQ3JtamxUd3Nn?=
 =?utf-8?B?bTVwbGI3ajFwVDk5bndTQUt2NW9EYzhEZUxIM0xERGc2Yzlwd3FOZFBZOUZq?=
 =?utf-8?B?WWdleGIxM3pxNWgrbGdKSDBFUkJ0bWxUNW5QWmUwQlVQKzVzbmxqMkFNS2Uz?=
 =?utf-8?B?bGwxYXNqS0ZoZ1NyN0dFL0VNc0E5Y0lUdklXRXc1TFdtWWhhZUtGZjFXTkND?=
 =?utf-8?B?YjRJdUw0ZG5hQTlHdTJ1emdvSm95Y2E1Qzc2bjQ0OEEvNVFhaktwN0REKzZ5?=
 =?utf-8?B?V20rc2JNMjB5MjFKOWdjYkhRN0NlcXA3aGhnVHQrSGRUTEhyeFMySktUWXhL?=
 =?utf-8?B?dnNmMWFVTzJFdklIVjRlN2YxL0s0NnR0ZEZVUHFvVnRObUhBVk5aSktaR285?=
 =?utf-8?B?akM3SGNXOWIzeEFwNlAyNzFJMUNOZWJoWHFjcEw2eUt3ZU84OG9rRmZqbGF1?=
 =?utf-8?B?RDB1bkF4UFBOOUJWajRXelQrYnVIWEV3MEh3bkZlT3Y4U0tOaFF6Uy9kdGph?=
 =?utf-8?B?a20xU0VQYUtkOWxtOXg1TkFMMnhQMXZ5dytwUms4NzVPaHdVU2txcXpaM0Zu?=
 =?utf-8?B?Q2dOdHlhQm5rZzJHeDZvOFdMZ2dyZ0pHK2c3L3ZCMTEzcHJkUTFDM1ZxaEZZ?=
 =?utf-8?B?NDJpTnlsdUEyRG9lSlpJNk5kV1dmNXlvYXA3Y0EwK2ZFd3lDMmhlZ0pmNUhl?=
 =?utf-8?B?WHB5OEphUG9mN2t5U09GSlpkNlA4c282N21aMXRlTTNnVE11eG1RbTRzZHdJ?=
 =?utf-8?B?M1YwVkNBU3NyN00zYnpxZnJuUVZ5V2p4QXFnMW84VDBxVlpldTZCV1ZYN1M4?=
 =?utf-8?B?amNRdE9JRkJtUVRiajJZWVJISkhXQ0FqdDhFL0lnTnZncERYcE9uazc0Q214?=
 =?utf-8?B?Y2JTNDR3Szk1NFZPdnF2WnpMa2pielNib2xTQXZOUmNSd0R6K1AwaEJocFhx?=
 =?utf-8?B?dVZTb0hyYVJ2bWVUZmZlclpGcVNBVTg4em5UbkFmbExpSnZKbGRKV0N2V3JP?=
 =?utf-8?B?eHVzKzdHOC9jWHd0ODdPUEJHdE1GNDYvUGhsditlUk45Um9iMDNGZ3JJQ3pL?=
 =?utf-8?B?eWhJbEZLS2ZtOURuVFVOOENQWDEyZy85MUVZK3RicnNpN1lNK0tsc3pVVEJt?=
 =?utf-8?B?UDFWREw2NHBITUV0QmsxM0IrYlpyMUJXRUN5L3A3cElScXBsNjJOdTJ2YlpF?=
 =?utf-8?B?b3JRK1JFNUdHTjVEeTJrcElTVHl4cm04VXpUNlU3dkJiK3FJOFVjK0ZsZEFj?=
 =?utf-8?B?WXhvZGQzKzdUSzJDV01vUTRNb0xXWjd3aFBUT2FjaDI5WGFCZUtKNG9qcE56?=
 =?utf-8?Q?zi/jL4M3wj7iz2Oc4JkO7fdzs?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <796C1A2045EE33469FA6C99F4FCD8897@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	b+XQkuAQzVPw3gyJ0l29Uox0PKPlY2TU419R4WEEKhILmB1SJr+4/45U1Fc0Oo8gxrS3iYlw+DHtKFtaQ5Ax/eP2vrRV1RhgFXZLWOpkxhZzK1md7fzy3MyRDU6RGlbc73QmwdNrkzHYkBfBIn8MkwB5r+sjDoOcSOcabsC1hLOM5cHc/OtLLMgj6qzMvHllIA3t1Tp0qgteNr+1MSgOeqeVbN59RsvA50JXA441IsurJjmq+gbpznyXFvKatxuTkD7C3uT0lGV5J/0hR28kABZRccdKmgqDgrySLDqbj221hlYkVIQ60PEXddSg26WEbwexnRyWIh1uFkdE8hDTUqlEyn6OI/cmQXcQrfjqrhtKocjGqPbUWTdYS+kqOwLxTqV1OyzfIVOtZF5KJyixL2IALEC5erNSzsSg8vUaLOElGBuhncbiSSY5mMhdAjTVwD81Y4yUqIdIOxjMTgnsb2pa98pi2u6w8LolPlzJbJIaf0RrBjDRNZHTETNDrWvwIJwLMhwExVpG6M00Jtj1fYMKtQpGrTOyEgAPnNY4d/Tkp8nYpUSuQOsu62akGPF0HGsKozb2xiibE0pGtqT22k4kTMYEek3GxDSh2WqfTebaUQv8QZmxUMy/JBHgahfNlchyRN08/p7+uOzzp3pBONvWHZWfCTZl3RL2Pi+Ud0tRxdBs9X8CtXWV3H+5ESciogvHLNXyL+4IuDe9KarijZlnWCAbN06vHuBoehi+6BtLeyhPq0r0Ro9mzz6qDm5OEuw5zjq/IEjkn7h39EpBz6jV6fPUOtU6ALfVJG3NeBzPtCszJLOeKQ3T6UqoXegVGFZkpraING4U19bcdjibKIMMn8Yv64rXtgeBh4v/JdU=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2829ce8-a3af-49bb-9b81-08daf7fe9cb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2023 20:16:54.9132
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ct/+keiNIz2xOvbuVfkx15lBZWT5qIkTr26stT4eFdDXhfkHYVKId3DtmZtTejdF4sPJUO6oPTZVfuemmtyYS11+//LatxA4DFPNGbjUes=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6859

T24gMTYvMDEvMjAyMyA4OjU2IGFtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTMuMDEuMjAy
MyAxMjo1NSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IE9uIDEzLzAxLzIwMjMgODo0NyBhbSwg
SmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gSW4gX3NoX3Byb3BhZ2F0ZSgpIEknbSBmdXJ0aGVyIHB1
enpsZWQ6IFRoZSBpb21lbV9hY2Nlc3NfcGVybWl0dGVkKCkNCj4+PiBjZXJ0YWlubHkgc3VnZ2Vz
dHMgdmVyeSBiYWQgdGhpbmdzIGNvdWxkIGhhcHBlbiBpZiBpdCByZXR1cm5lZCBmYWxzZQ0KPj4+
IChpLmUuIGluIHRoZSBpbXBsaWNpdCAiZWxzZSIgY2FzZSkuIFRoZSBhc3N1bXB0aW9uIGxvb2tz
IHRvIGJlIHRoYXQgbm8NCj4+PiBiYWQgInRhcmdldF9tZm4iIGNhbiBtYWtlIGl0IHRoZXJlLiBC
dXQgb3ZlcmFsbCB0aGluZ3MgbWlnaHQgZW5kIHVwDQo+Pj4gbG9va2luZyBtb3JlIHNhbmUgKGFu
ZCBiZWluZyBjaGVhcGVyKSB3aGVuIHNpbXBseSB1c2luZyAibW1pb19tZm4iDQo+Pj4gaW5zdGVh
ZC4NCj4+IFRoYXQgZW50aXJlIGJsb2NrIGxvb2tzIHN1c3BlY3QuwqAgRm9yIG9uZSwgSSBjYW4n
dCBzZWUgd2h5IHRoZSBBU1NFUlQoKQ0KPj4gaXMgY29ycmVjdDsgd2UgaGF2ZSBsaXRlcmFsbHkg
anVzdCAoY29uZGl0aW9uYWxseSkgYWRkZWQgQ0FDSEVfQVRUUiB0bw0KPj4gcGFzc190aHJ1X2Zs
YWdzIGFuZCBwdWxsZWQgZXZlcnl0aGluZyBhY3Jvc3MgZnJvbSBnZmxhZ3MgaW50byBzZmxhZ3Mu
DQo+IFRoYXQgaXMgZm9yICFzaGFkb3dfbW9kZV9yZWZjb3VudHMoKSBkb21haW5zLCBpLmUuIFBW
LCB3aGVyZWFzIHRoZQ0KPiBvdXRlcm1vc3QgY29uZGl0aW9uYWwgaGVyZSBsaW1pdHMgdGhpbmdz
IHRvIEhWTS4gVXNpbmcgZGlmZmVyZW50DQo+IHByZWRpY2F0ZXMgb2YgY291cnNlIG9iZnVzY2F0
ZXMgdGhpcyBzb21lLCBidXQgYnJpbmdpbmcgdGhvc2UgdHdvDQo+IGNsb3NlciB0b2dldGhlciAo
cGVyaGFwcyBldmVuIG1lcmdpbmcgdGhlbSkgZGlkbid0IGxvb2sgcmVhc29uYWJsZQ0KPiB0byBk
byByaWdodCBoZXJlLg0KDQpBaCwgdGhhdCBiaXQuwqAgQWxzbyBmdXJ0aGVyIG9iZnVzY2F0ZWQg
YnkgcGFydGlhbCBuZXN0ZWQgISdzLg0KDQpJIGRvdWJ0IFNoYWRvdyBoYXMgc2VlbiBhbnl0aGlu
ZyBiZXlvbmQgdG9rZW4gdGVzdGluZyBpbiBjb21iaW5hdGlvbg0Kd2l0aCBQQ0kgUGFzc3Rocm91
Z2guwqAgSXQgY2VydGFpbmx5IHNhdyBubyB0ZXN0aW5nIHVuZGVyIFhlblNlcnZlci4NCg0KPj4g
SXQgY2FuIGFsc28gaGFsZiBpdHMgbnVtYmVyIG9mIGV4dGVybmFsIGNhbGxzIGJ5IHJlYXJyYW5n
aW5nIHRoZSBpZi9lbHNlDQo+PiBjaGFpbiBhbmQgbWFraW5nIGJldHRlciB1c2Ugb2YgdGhlIHR5
cGUgdmFyaWFibGUuDQo+IEkgZGlkIGFjdHVhbGx5IHNwZW5kIHF1aXRlIGEgYml0IG9mIHRpbWUg
dG8gc2VlIHdoZXRoZXIgSSBjb3VsZCBmaWd1cmUNCj4gYSB2YWxpZCB3YXkgb2YgcmUtYXJyYW5n
aW5nIHRoZSBvcmRlciwgYnV0IGluIHRoZSBlbmQgZm9yIGV2ZXJ5DQo+IHRyYW5zZm9ybWF0aW9u
IEkgZm91bmQgYSByZWFzb24gd2h5IGl0IHdvdWxkbid0IGJlIHZhbGlkLiBTbyBJJ20NCj4gY3Vy
aW91cyB3aGF0IHZhbGlkIHNpbXBsaWZpY2F0aW9uKHMpIHlvdSBzZWUuDQoNCldlbGwsIHRoZSBm
aXJzdCB0d28gY2FsbHMgY2FsbHMgdG8gcGF0X3R5cGVfMl9wdGVfZmxhZ3MoKSBjYW4gYmUgbWVy
Z2VkDQpxdWl0ZSBlYXNpbHksIGJ1dCBJIHdhcyBhbHNvIHRoaW5raW5nIGluIHRlcm1zIG9mIGZ1
dHVyZSB3aGVyZSBjb2hlcmVuY3kNCmhhbmRsaW5nIHdhcyB3b3JraW5nIGluIGEgbW9yZSBzYW5l
IHdheS4NCg0KPj4+IEBAIC01NzEsNyArNTcxLDcgQEAgX3NoX3Byb3BhZ2F0ZShzdHJ1Y3QgdmNw
dSAqdiwNCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdmbl90b19wYWRkcih0YXJn
ZXRfZ2ZuKSwNCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1mbl90b19tYWRkcih0
YXJnZXRfbWZuKSwNCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFg4Nl9NVF9VQyk7
DQo+Pj4gLSAgICAgICAgICAgICAgICBlbHNlIGlmICggaW9tbXVfc25vb3AgKQ0KPj4+ICsgICAg
ICAgICAgICAgICAgZWxzZSBpZiAoIGlzX2lvbW11X2VuYWJsZWQoZCkgJiYgaW9tbXVfc25vb3Ag
KQ0KPj4+ICAgICAgICAgICAgICAgICAgICAgIHNmbGFncyB8PSBwYXRfdHlwZV8yX3B0ZV9mbGFn
cyhYODZfTVRfV0IpOw0KPj4gSG1tLi4uwqAgVGhpcyBpcyBzdGlsbCBvbmUgcmVhc29uYWJseSBl
eHBlbnNpdmUgbm9wOyB0aGUgUFRFIEZsYWdzIGZvciBXQg0KPj4gYXJlIDAuDQo+IFJpZ2h0LCBi
dXQgYmVzaWRlcyBiZWluZyB1bnJlbGF0ZWQgdG8gdGhlIHBhdGNoICh0aGVyZSdzIGEgZm9sbG93
aW5nDQo+ICJlbHNlIiwgc28gdGhlIGNvbmRpdGlvbiBjYW5ub3QgYmUgcHVyZ2VkIGFsdG9nZXRo
ZXIpIEkgd291bGQgd29uZGVyDQo+IGlmIHdlIHJlYWxseSB3YW50IHRvIGJha2UgaW4gbW9yZSBQ
QVQgbGF5b3V0IDwtPiBQVEUgZGVwZW5kZW5jaWVzLg0KDQpJJ20gbm90IGFkdm9jYXRpbmcgZm9y
IG1vcmUgYXNzdW1wdGlvbiBhYm91dCBQQVQgPC0+IFBURSBsYXlvdXQsIGJ1dCBpdA0Kd291bGQg
YmUgbmljZSBpZiB0aGUgTk9QcyB3ZXJlIGFjdHVhbGx5IE5PUHMuDQoNCkkgc3VibWl0dGVkIGEg
cGF0Y2ggd2hpY2ggbWFrZXMgcGF0X3R5cGVfMl9wdGVfZmxhZ3MoKSBtYXJnaW5hbGx5IGxlc3MN
CmV4cGVuc2l2ZSwgYnV0IHRoZXJlJ3Mgc3RpbGwgbWFzc2l2ZSBzYXZpbmdzIHRvIGJlIG1hZGUg
aGVyZS7CoCBCZWNhdXNlDQpYRU4ncyBQQVQgaXMgY29tcGlsZSB0aW1lIGNvbnN0YW50LCB0aGlz
IGludmVyc2UgY2FuIGJlIHRvby4NCg0KPg0KPj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL3g4Ni9pb21tdS5jDQo+Pj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lv
bW11LmMNCj4+PiBAQCAtNTYsNiArNTYsMTMgQEAgdm9pZCBfX2luaXQgYWNwaV9pb21tdV9pbml0
KHZvaWQpDQo+Pj4gICAgICBpZiAoICFhY3BpX2Rpc2FibGVkICkNCj4+PiAgICAgIHsNCj4+PiAg
ICAgICAgICByZXQgPSBhY3BpX2RtYXJfaW5pdCgpOw0KPj4+ICsNCj4+PiArI2lmbmRlZiBpb21t
dV9zbm9vcA0KPj4+ICsgICAgICAgIC8qIEEgY29tbWFuZCBsaW5lIG92ZXJyaWRlIGZvciBzbm9v
cCBjb250cm9sIGFmZmVjdHMgVlQtZCBvbmx5LiAqLw0KPj4+ICsgICAgICAgIGlmICggcmV0ICkN
Cj4+PiArICAgICAgICAgICAgaW9tbXVfc25vb3AgPSB0cnVlOw0KPj4+ICsjZW5kaWYNCj4+IEkg
cmVhbGx5IGRvbid0IHRoaW5rIHRoaXMgaXMgYSBnb29kIGlkZWEuwqAgSWYgbm90aGluZyBlbHNl
LCB5b3UncmUNCj4+IHJlaW5mb3JjaW5nIHRoZSBub3Rpb24gdGhhdCB0aGlzIGxvZ2ljIGlzIHNv
bWVob3cgYWNjZXB0YWJsZS4NCj4+DQo+PiBJZiBpbnN0ZWFkIHRoZSBjb21tZW50IHJlYWQgc29t
ZXRoaW5nIGxpa2U6DQo+Pg0KPj4gLyogVGhpcyBsb2dpYyBpcyBwcmV0dHkgYm9ndXMsIGJ1dCBu
ZWNlc3NhcnkgZm9yIG5vdy7CoCBpb21tdV9zbm9vcCBhcyBhDQo+PiBjb250cm9sIGlzIG9ubHkg
d2lyZWQgdXAgZm9yIFZULWQgKHdoaWNoIG1heSBiZSBjb25kaXRpb25hbGx5IGNvbXBpbGVkDQo+
PiBvdXQpLCBhbmQgd2hpbGUgQU1EIGNhbiBjb250cm9sIGNvaGVyZW5jeSwgWGVuIGZvcmNlcyBj
b2hlcmVudCBhY2Nlc3Nlcw0KPj4gdW5pbGF0ZXJhbGx5IHNvIGlvbW11X3Nub29wIG5lZWRzIHRv
IHJlcG9ydCB0cnVlIG9uIGFsbCBBTUQgc3lzdGVtcyBmb3INCj4+IGxvZ2ljIGVsc2V3aGVyZSBp
biBYZW4gdG8gYmVoYXZlIGNvcnJlY3RseS4gKi8NCj4gSSd2ZSBleHRlbmRlZCB0aGUgY29tbWVu
dCB0byB0aGlzOg0KPg0KPiAgICAgICAgIC8qDQo+ICAgICAgICAgICogQXMgbG9uZyBhcyB0aGVy
ZSdzIG5vIHBlci1kb21haW4gc25vb3AgY29udHJvbCwgYW5kIGFzIGxvbmcgYXMgb24NCj4gICAg
ICAgICAgKiBBTUQgd2UgdW5pZm9ybWx5IGZvcmNlIGNvaGVyZW50IGFjY2Vzc2VzLCBhIHBvc3Np
YmxlIGNvbW1hbmQgbGluZQ0KPiAgICAgICAgICAqIG92ZXJyaWRlIHNob3VsZCBhZmZlY3QgVlQt
ZCBvbmx5Lg0KPiAgICAgICAgICAqLw0KDQpCZXR0ZXIuwqAgSSBzdXBwb3NlIG15IGRpc3BsZWFz
dXJlIG9mIHRoaXMgY2FuIGxpdmUgb24gbGlzdC4uLg0KDQp+QW5kcmV3DQo=

