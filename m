Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E294712D5
	for <lists+xen-devel@lfdr.de>; Sat, 11 Dec 2021 09:21:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245191.423211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvxcc-0000FS-14; Sat, 11 Dec 2021 08:20:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245191.423211; Sat, 11 Dec 2021 08:20:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvxcb-0000By-T2; Sat, 11 Dec 2021 08:20:45 +0000
Received: by outflank-mailman (input) for mailman id 245191;
 Sat, 11 Dec 2021 08:20:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tf3j=Q4=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mvxca-0000Bs-4S
 for xen-devel@lists.xenproject.org; Sat, 11 Dec 2021 08:20:44 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39d59f18-5a5b-11ec-a74f-db008197e53d;
 Sat, 11 Dec 2021 09:20:41 +0100 (CET)
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
X-Inumbo-ID: 39d59f18-5a5b-11ec-a74f-db008197e53d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639210841;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=wZa3irFgnWDqh0t0q6eQwWpSuJwJVJE9mKaS5+tsXIo=;
  b=KccPioun2kHIy/n5BCvoDEAN4QnV8bjXRb9neIk2MospvOLPEmEQ6y41
   Gs187EkvsDIWHhq3iHiFSTv+3hroqSMWz2/OcrHCe82GL2SUNGEs+50RH
   Ik4H2am5upZ6E7lkbBXyX3gsv2x3bU4OVLP4nO/vxRiaLAS9kySbPCfKR
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: yrTFKejHGsgX7QoGmqyEXb8C4YEjJCNpH/+/OrkuQvGCS8yPD8AgkTKp+ogg2ZtxiBVYMb1LDe
 kRl5UUBCOMzBcT+gZt9qDPdwuNs4p6uHRmBoTsG5+T5nu3y7IOTLF23gsvUeKuKQArZYQS4wVp
 vXqjYJbUO8Vh0UROFF0IKgyvYV9TbUC7KB2qEfDymZRKMi97VpW8jQpX+6IQR9os+YB+fwwWJt
 iIOJHqR09sqhBMbUckg6lPlXfJhuWtmkX+1O3Zye4IF9B8+rUn6f/fGqNzZsKtvKJsbWe2WOtY
 UTerN3jf26ir+ps9OlmKioNY
X-SBRS: 5.1
X-MesageID: 61851991
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Vwuq2KMxtrx3sV3vrR2QkcFynXyQoLVcMsEvi/4bfWQNrUpzhD1Um
 2IYXz3UPv+DM2OjfNgibonjo08Eu8fcn4BgSwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En5400s7w7VRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoxDRu/A26
 e5WjLC5RFclb/b2wusFQhYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/uTtYIBjWZp7ixINdWGZ
 O0TMgA2VQqaPQRJPW8wLYkfvc790xETdBUH8QnI9MLb+VP71AVs1JD9PdyTfcaFLe1XlEuFo
 mPN/0ziHwoXcteYzFKt22iwi+r4uDL0UYMfCpW17vdvxlaUwwQ7DxkbVkCyp/WjvUe4V8hCM
 Ewf+icorq8a+VSiS5/2WBjQiGSNvgMYHcFRFeI6wAiXz+zf5APxLmIJVCJbYdoq8so/XyU31
 0ShlsnsQzdotdW9WX+bs7uZsz62ESwUNnMZIz8JSxMf5Nvuq511iQjAJv5qFqKv1IWtQRn/x
 jmLqG41gLB7pcwW06S2+3jXjjTqoYLGJiYr4QHQUnOg/xlOboevbIy16nDW9f9Fao2eSzGpu
 3wJmNOX6uwUOo2cjyyGQOgLH7aB6u6MNXvXhlsHN4I66z2n9nqnfIZRyDJzPkFkNoADYzCBX
 aPIkVoPvtkJZiLsNPIpJdLqYyg38UT+PfG9ctCTT+FVW7R4eV+LrXpUP0GIzm+4xSDAjpoDE
 ZucdM+tC1MTBqJm0Ce6So8h7FM7+swt7TiNHM6mlnxLxZLbPSfIEuldbDNie8hgtPvcyDg55
 eqzICdjJ/93dOTlKhfa/ocIRbzhBShqXMumwyC7mwPqH+aHJI3DI6OAqV/CU9Y890iwqgsv1
 iviMnK0MHKl2RX6xfyiMxiPko/HU5dltm4cNicxJ1uu0HVLSd/xt/ZGKcFuJOh4qbELIRtIo
 x4tIZroPxiyYm6fp2R1gWfV8uSOiyhHdSrRZnH4MVDTjrZrRhDT+8+MQ+cc3HJmM8ZDjuNn+
 +fI/lqCGfIrHl0+ZO6LOKPH5w7g5hA1xbMtN3Yk1/EOIS0ABqAxcHev5hL2SulRQSj+Ksyyi
 1zLXExG/LaV+OfYMrDh3Mi5kmtgKMMndmJyFGjH97emcy7c+2uo24hbV+iUOzvaUQvJFG+KP
 I25Ftnwb68KmkhkqY15H+o5xK4y/YK39bRb0h5lDDPAaFHyUuFsJXyP3M9usKxRx+AG5VvqC
 xzXotQKa6+UPM7FEUIKIFZ3ZOq0yvxJyCLZ6u44IRum6XYvrqaHS0hbIzKFlDdZcOluKIogz
 Op44JwW5gWzhwAEKNGDiiwIpW2AImZZC/cst40AAZ+tgQ0ukwkQbZvZAy7wwZeOd9QTbRV6f
 m7K3PLP3u0OyFDDfnw/EWn28dBc3Zle6gpXyFIiJkiSnoaXjPEAwxAMoy88SR5Yz0sb3rsra
 HRrLUB8OY6H4yxs2JpYR2mpFgxMWE+Z90j2xwdbnWHVVRD1BGnELWl7MueR5kEJtWlbe2EDr
 r2fzW/kVxfsfd3wgXRuCRI09aS7QIwj7BDGleCmA9+BTsszbjfSi6OzYXYF9kn8CsQriUyb/
 eRn8Y6cs0Eg2fL8d0HjN7Sn6A==
IronPort-HdrOrdr: A9a23:wH1q5alC2DdKh84rpkxiJiRohwjpDfIi3DAbv31ZSRFFG/Fw9v
 rDoB1/73TJYVkqN03I9ervBEDjexPhHO9OgLX5VI3KNGOKhILCFvAA0WKN+UyEJwTOssJbyK
 d8Y+xfJbTLfDxHZB/BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.88,197,1635220800"; 
   d="scan'208";a="61851991"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hc9uNwURvMmpyqsrgP7o8ENsgWWk14MenImwr59sBdbF9+iuiGhNyZRHbYsjYEZaI85TQwaI+m0H6FIunR6ddsgoepq2AnvkwRRpn4S6LktAWBFfbSVepC7peaCkJfFnTtb3yG6oneeItu+dQHD2KSJRdnmVIzzQng77iDblkhVoaU58uUUM3VsJaFSznB7ZB/NHgpy6TFY0hrsbn92ogwzWJiF1tIfZDwjBbfd+gbK89JvcgeU70HCJLXLHocClLR7eEGecqkQFz+Xqi9xrxBh60exRJTcCWjb+SPbUJhk5lMC4CPhiRTpzVcI7RpR6H1b6X+nIJ8XBc8K+dOp2hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qduQJK1aJ/OpYlgPhAQKCDZd348zfSiOpXZtUAoZnbI=;
 b=ZLPlzyvTyHelug5T+xIi8iydxm7Q9dO1Sb8hXABJM0ZgN2HspQ9ulrwUAkTKb/03lTHVcnGlctzG+fzmHIFxmmSJDcR91rPzFsYlbpHB7fgwtctmPfcKIKRbxSTbm8lDTFeaDTq4QRzUzntvWDJTTRjAk9qOzRXch8nRQU7RIrOVF6JptZy5ag3O8LpBUEuzWwl9bCb79F9X9+o3P/BMyibEF+EEeGKcYsK+73cXilwbAk6R19ASfiavYd6y48ZdQQCt7XvhNjfmeXVdHbe8K2JXFJtWICBEfjQJclg8mpA/DratxxQhYSpOzJZHeXJjNE5NAQMbdpbHnX6iq9ZC1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qduQJK1aJ/OpYlgPhAQKCDZd348zfSiOpXZtUAoZnbI=;
 b=nGQMzMvXomtdv/mQnpkK0UaPoW1Hd+eUwyrCsAwf/dC3p1eBzCH5ClHCx2YcvMy079abj9jxc8uo4JW1MwU0QuQfGu3mHmljChGg8FlYQk/WVTdQiHY8YZLLlNOxM5AXFc1vEj5PIy0I5foQfx3pd4fXdPLULbwih/oISXOc5G4=
Date: Sat, 11 Dec 2021 09:20:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: Oleksandr Andrushchenko <andr2000@gmail.com>,
	<xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<oleksandr_tyshchenko@epam.com>, <volodymyr_babchuk@epam.com>,
	<Artem_Mygaiev@epam.com>, <jbeulich@suse.com>, <andrew.cooper3@citrix.com>,
	<george.dunlap@citrix.com>, <paul@xen.org>, <bertrand.marquis@arm.com>,
	<rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v5 02/14] vpci: fix function attributes for
 vpci_process_pending
Message-ID: <YbRfRv3x0lxZvPcw@Air-de-Roger>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-3-andr2000@gmail.com>
 <19c43763-966d-e336-9282-ff12b1b3b2c6@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19c43763-966d-e336-9282-ff12b1b3b2c6@xen.org>
X-ClientProxiedBy: MR2P264CA0052.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 999c52e2-1d0e-4be9-1c34-08d9bc7f1af2
X-MS-TrafficTypeDiagnostic: DS7PR03MB5525:EE_
X-Microsoft-Antispam-PRVS: <DS7PR03MB5525EEED46808E74B349022E8F729@DS7PR03MB5525.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6xZ3eLK3FekMSjEKvVJJBunT1UUaOx+2M5zP8MPmZE2iz2hTQGEXO1K4Y4HZFC4KTDfx7c2LxtcurNBc0obdxyt/mg+Xt7Xpx3JNklzWhF5ntUZ1x8jmyOvaCDzTtyFLkiMV/AV8hOV98yLpSsJv0+wmq06peLaIrjMaSFlU2/205IZjqorq4sQuaO+8BUhHDUaeNUAn3s0QB+yMzlB9Y/67zxUMBQ4hx4bTGPXclbkoJz8B2qoYVd1Kr6ywkEAcV5hH5tPccdRdcgnsnbUrRAAhkJ/YuJDDwJIE7/IFod130h7V2wsFRm5nObM5KwCVzCNAM3WyW2GP8WjpM6zk/7pp0DZ7zbR829bQrECnf4uup49UNm5hckdFX1Tn34oNCM8SpilU3vtaYefKn2tZNz9qRyHfuObTi5MeI9LxHCYC2GRxGspQotcjC3vo9AyVbQmJLX3vyJta+LSpKM56cI1p0C2FchI5UV0e8ONfV8IHN2STNnzOtRhLLRorIlEWHBn0ox5nlP4erjEDz2UU9su3ghOf9IG/HdBhBq8pdu1Il7uMju3A1OTbwtvDG/w1kp9NwryS69nFSCCOCH3xmln6J0psrfFpHpp9gJIl2RKwzJQj+r7t5bhi/sIL6FNDR1+zEd/IB/q9m0eB+K1AJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(316002)(5660300002)(508600001)(33716001)(6916009)(54906003)(4744005)(8676002)(2906002)(66946007)(7416002)(956004)(82960400001)(4326008)(66556008)(6666004)(53546011)(6486002)(6496006)(9686003)(38100700002)(186003)(66476007)(85182001)(26005)(86362001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1E3N3lHb3ZUdlJUNC9XZFV0UUlRNURLZ252cm1MdHhWa2M5dDF4VXVUTWgr?=
 =?utf-8?B?RmdBNGQyeUx5YjZ3eTNQUTlxYmRvM0grNFo3L2pYV1hiSUs2ZnprVm1aKzgw?=
 =?utf-8?B?b0lncC9WK0lNNnZZNW9qNi9HeVFqaVR6NHRyaXJHWGdIeEpaRWRqZ1NLNFdX?=
 =?utf-8?B?RmJFMFo1NUlDVkdzdlAzb3dzZEtJTjNuY2JKVTlzYVdRVnpEZk9FZlVQRnFG?=
 =?utf-8?B?NGZ5MzZzT3ovbEFtcjhGRHRNcVc5NnNPVVdtQlE2Nkh0ZFlhTFN2N1dmMFRP?=
 =?utf-8?B?VTBsQk9STDMveTVSS1BGcUJsdG51RzdNWTd2M3BkTklPV3I2T1pSSUVGNVM1?=
 =?utf-8?B?TUt4WkRJMVBpdGU1V1VZWS95eW8rWjRzOHNVM3c1WUlzY3AwRW9pZlpnQyt0?=
 =?utf-8?B?NGY3ekdSQStiOWpzNEJjNGxTRFZKMDJ5SHhwZGl0a3B2NWY4S09SeWJ1SVRG?=
 =?utf-8?B?RzF3WW1JUUtJTktxZTZtN3prNi9BellmdkpkU1BzUUxxbXVRM2w3ZUZPSDc3?=
 =?utf-8?B?c2dOaGF1djZzeEdiTGdJYVZ3VGhQdEJwM2NFNmVzK2V3dHN5TEwrNi8rNG1n?=
 =?utf-8?B?dk12dlQ1aWwvbDRVU2FSdmVHUnRwSmpXTW44NGtJdzRLYyttajVEdVRodGor?=
 =?utf-8?B?bXhaV3EwdUdpSHVnaWNRemxPWXpndTZCWUEyS1J6TnN2Zk4wT1pmVmVLTjlt?=
 =?utf-8?B?T2kwR0JVSkRyakZ5ZlBnc3lNVCt2QUtVd2E0b3VFN3g4cndRVzZlZ0N6WEFS?=
 =?utf-8?B?MUlWSWllTFliUEpFTHdnMXdOa2tyc3Z2OWs2L0pUaUh6SVBnQkRJUXRPVW9T?=
 =?utf-8?B?eDZ1c0VKazViU3dBZmcvajBNVXFQekhrOWtLRFN6d3ZVOFdnazRFUkkva09W?=
 =?utf-8?B?aW82UkZxaGFwa0ZBZU1aazdCZGRtanRZb1J3a2wzeWVoNUNvcTZNWm9sSE5M?=
 =?utf-8?B?Q1JsTDZsZWNPNW1Kb3gyM3JPVHdQOXZsSkdaUXF3aGQ5dXBJc09HVExvOXlh?=
 =?utf-8?B?dDlsOXNSQ3Y3bUNLV29iTGpBelhMekdJaDZRRzlYbEhXTUtXR3g0STlDelRl?=
 =?utf-8?B?Y0RHUG5vbXlXdHV2ZmM0ZTFKb29xYWE1cTVWN3BCNVdDNzVSRXhjTlR4T1kx?=
 =?utf-8?B?bXk4d3ZwcU9LTlZ3MWFSaHlCUUEzVFRRbUVTZlMwRUVNSElJaGpTUkJJa00x?=
 =?utf-8?B?U0ZlNFd1TWMvVSs0cVBkdGFCM2x5WW9MNEtpOEFpL25pQjQ2QVhXdTBEdUVZ?=
 =?utf-8?B?RExLS1kxb2MyaCs4S2xnUXMzWmw2ejhxSHV2YjB3WUNWbFVTbERsV09YNjlB?=
 =?utf-8?B?VzVBbytraVhuUEhzZmgxcmwzMk9JOHcxR09aOUpkb1hLMmRUQ2l5NytrMlpk?=
 =?utf-8?B?L2l0S3ArSDI0R09PNkp3cEhlNHp0U2VQTDF1VGZyV1l5YkVMKzByVFhXMmNK?=
 =?utf-8?B?ZG1IU1FOd1Rsek5lazBtOFJLS2tON3VQUWl1cEJwRkZNU25VeDM4bEZKQUpp?=
 =?utf-8?B?Q2ZWU2g5T0pJck0xdEFzSFhWVlo5dWgrV2JyUHZsNEV4N3JEZDAxUzhjb3I5?=
 =?utf-8?B?UlRPNnA5elI1dTQwUk82ejBmNkxoWGgxTXkxeENlUGdPZ2RVaTZvTTNLdjRw?=
 =?utf-8?B?c1Vpc3ZnOGxpd0lpVnVvT0l2VFZ1Y3FWSVlqQVZyeExnL05UbHU0ZXI3YURL?=
 =?utf-8?B?TjJrRG56SnNJMmUyUUVxcmh1Z0J4ejByUk9COHluWjltWnZ3bDdiei9BWWgz?=
 =?utf-8?B?TExWV2Fzalk0S0RTSU13NG5wN3FRT3luZTRaVUV2SFBjRlE1UUgycDI0TnVa?=
 =?utf-8?B?YXoyQTVIRitDSWhYODAvUmpvaUN2czZoU2txNWtiK1BkaEZ2MG1uNWdEZ2pU?=
 =?utf-8?B?ZzViQ1U3ZG1oWkhXYjA2anJYNWh5SnZTTFZER3RZOUg4citvSjZKOERFVXFp?=
 =?utf-8?B?TkQ3N1doOEt2Q1c5dG82VnpzR243QjFzYkIwdjQxcUowSlVSWHRCU3ZmUi9L?=
 =?utf-8?B?TC9ReGpsNjhGSkIvRnVmVS9MK1paSmFLY3BwQXdJMHJscWVHVDB2NTlQWkpv?=
 =?utf-8?B?ZkdkdlhNcDhTVHR3NTE3ZmhXekpxN2RZVW9JTUk4ZXFSSU8vRHpuaDZIZXBn?=
 =?utf-8?B?bkZjQ3FybVphN2lYSWNrR3kzakg0RnVWY1gzc1ZDTzZiMjZDblUxYUFmb29X?=
 =?utf-8?Q?5LvnhoehepDVneCW8bQXnkg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 999c52e2-1d0e-4be9-1c34-08d9bc7f1af2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 08:20:35.4263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hVnleYFzXrBQqPUkcxXhFNeJoWwodSnoGElUwIE4EnwnhjCf4aHE+YaOZtHAwEHioNSPxvliH00+AmSq93o3SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5525
X-OriginatorOrg: citrix.com

On Fri, Dec 10, 2021 at 05:55:03PM +0000, Julien Grall wrote:
> Hi Oleksandr,
> 
> On 25/11/2021 11:02, Oleksandr Andrushchenko wrote:
> > From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > 
> > vpci_process_pending is defined with different attributes, e.g.
> > with __must_check if CONFIG_HAS_VPCI enabled and not otherwise.
> > Fix this by defining both of the definitions with __must_check.
> > 
> > Fixes: 14583a590783 ("7fbb096bf345 kconfig: don't select VPCI if building a shim-only binary")
> > 
> > Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I think this can be committed independently of the rest of the
series?

Thanks, Roger.

