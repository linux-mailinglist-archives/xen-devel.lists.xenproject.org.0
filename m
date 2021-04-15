Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE9E360B2D
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 15:58:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111182.212598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX2W9-0003jY-Gv; Thu, 15 Apr 2021 13:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111182.212598; Thu, 15 Apr 2021 13:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX2W9-0003j9-DU; Thu, 15 Apr 2021 13:58:49 +0000
Received: by outflank-mailman (input) for mailman id 111182;
 Thu, 15 Apr 2021 13:58:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6tgI=JM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lX2W8-0003j0-9b
 for xen-devel@lists.xen.org; Thu, 15 Apr 2021 13:58:48 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 55aa4e45-6a94-4c27-8615-2bed12ed8031;
 Thu, 15 Apr 2021 13:58:47 +0000 (UTC)
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
X-Inumbo-ID: 55aa4e45-6a94-4c27-8615-2bed12ed8031
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618495126;
  h=subject:to:references:from:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=kkbL/tScrPOyWx7fIQmOpVT96XQUsbYpPCsTcJx5ujE=;
  b=YutkaH4ruBamgSHK6HYwRbBPmM7S6rdWGPa92SQpCxWNrn7iwh5mARxf
   W+vWeE8eADKZMfaakS3Lx+3Bgj5UUlzyssTqtKNxhrjtAbgB0m0TfQdkc
   LhzFVvbT+qfmISp0+6MaxfuQ0Bqnh/kzCcyiN7BT40Yit1KVwfxuqVQQT
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +JwQ6GrMA/3dmWcS7O58MVQcq6665alhDTR5zZu5T/v/jhOZQAOErLl0brBZa6IkZZUjw+HrrM
 LwqxRYgbLki16amtLv4JdADOOy1HBr/oaWK6ZwJ7ek9tIZVxuJx9PK2L18gGgsbvxUeLFyGVET
 4V9zB6oSQhdBazfDO+ooGEtBZw8mv/7FoPlT7h7L/KKZsd443hAKv6UEW7Rw6pW+eFC7y4Cpmq
 ke3MuxHj4hFlCX9bsvgjdkWPSOeRDXUdurvpIR63c5wHW9Ev1tlZz8WHpabMrr8whP7tCjdWfa
 /aI=
X-SBRS: 5.2
X-MesageID: 41677721
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:GT0xZ6M1HgJNr8BcT1Dw55DYdL4zR+YMi2QD/3taDTRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsa9aFvm39pQ7ZMKNbmvGDPntmyhMZ144eLZrwHIMxbVstRQ3a
 IIScVDIfXtEFl3itv76gGkE9AmhOKK6rysmP229RZQZCttbLxt6Bo8Lw6dHFF/SgUuP+tEKL
 O34M1bqz28PUkNZsOgCXUfG8TFrdvHlJXpCCR2eiIPwg+IkD+u9frGAwGVty1uKQ9n7JUD1S
 z+kwL/7ri+qP3T8HHh/kLa8pg+oqqZ9vJtH8qJ4/JlTQnEqgHtX4h5Xq3HgTZdmpDV1H8PsP
 3h5ygtJN5y7XS5RBDEnTLI1xP72Dgjr1/OoGXo50fLmsDySDIkB8cpv+swGXG4milQzu1U66
 5F03mUsJBaF3r77UDAzuPFSg1wkQ6MqWci+NRj/kB3a5cUa7NasOUkjSFoOaoHdRiKjbwPLP
 NjF4X16vpQbDqhHgjkl1gq6tmtUnMvJwyBU0gPt+eEugIm4kxR/g82wtcSkWwH8494Y55Y5/
 7cOqAtr71WSNQKBJgNSdspcI+SMCjgUBjMOGWdLRDOE7wGAWvEr9rS7K8u7O+nVZQUxPIJ6d
 j8eWIdkVR3V1PlCMWI0pEO2AvKWn+BUTPkzdwbz4Rlu5XnLYCbcBGreRQLqY+Nsv8fCsrUV7
 KYI5RNGcLuKmPoBMJgwxD+YZ9PMnMTOfdl9OoTaharmIbmO4fqvuvUfLL4P7z2CwspXWv5Hz
 8tRz72CMJc7l26e3PxjRTLMkmdOXDXzNZVKuz37uITwI8COslnqQ4Ok2m04cmNNHljv8UNDQ
 lDCYKitpn+iXi9/G7O4WksEAFaFFxp7LLpVG4PgQcLNkjzYIsSotn3QxEW4FK3YjtEC+/GGg
 9WoFp6vYitKYaL+CwkA9W7dkWXkmUUv3DPa5sHgKWM6YPEd/oDf9kbcZ00MT+OOw1+mA5spm
 sGQhQDXFXjGjTnjrjgqocVCuHZf9xVmxyqPsZQlHLauSyn1IESb0peewTrfd+cgA4oSTYRrE
 Z26bUjjL2JnivqFXEym90iMFpHaH2eBZVPCAjtXvQRppnbPCVLCUuajz2TjB8+Pk7n7V8biG
 DaISqIQv3TGVZGtndE0qHlzUNsegymDjFNQ0E/lbc4OXXNu3513+POXKa13meLQnYpw+0WMl
 j+EHMvCzIr4+ry+A+emT6EG3lj+44nOfbFCq8/N5vJ3Gm2FYGOnaYaPvNd8Zp/LuryuusTXe
 /3QX7TEBrIT8cSnyqbqXYuNHMq9D0Kkfb01Abk62b99nglGvbWKElnQbZeA9z01RmRe9+4lL
 FCyfQytq+MF0+0TPis46TedSRCJRPeunTedZBglblk+YYJ8IJuFJzaWwbS3H5J3B8CPN75/X
 luNZhT0fTkAMtTZMQcdCJSw0oxmPmOJEUttBbqAuVWRyBbs1bre/eI6aHPs7whHwmooxbxI0
 CW90Rmjrz4dhrG8b4REKQrJ2tKLGA69XR55euHM6ndEh+jee0G3F20NBaGAfVgYZnAPbUbtR
 Bh5d6U28eRairjwQjV+QJBHZgmyRfQfeqCRCSWGeBJ9NSmOVODxouSifTD8wvfeH+ccEQXhY
 pMaEoKSN9M4wNSyrEK7g==
X-IronPort-AV: E=Sophos;i="5.82,225,1613451600"; 
   d="scan'208";a="41677721"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABVTwdpiKjIzQBoMsY6LFWFypK2bK6I+o0535vQ3ez82OmtUdKPY/dm3Rax9Ntv8Lj3wYsE1LfIFXUQKDVmRpe0lZT8wWGuSWxCtHjUCV01+AN5YjmvmJTqs3Wn0VbakitoDb7ENzgpCMP8rD+DpLFfxoGQOsW1lJHxCUyUygUim8VSC19ch7OC5f4axnGjkSNUvxas/rNcCbzabU00jOdDNBpEdimkW9C0QIyJxoXUA9Sx63FEgpJB+6TQuXsDCyyMOLJQ0l79a8fuHGXYLrfWHHUUOEFEKAjME0Hq7u1CaNAOepUQsUYT+ioVZR5g9Qz5r9a2mGNUuAFMBIAtE1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkbL/tScrPOyWx7fIQmOpVT96XQUsbYpPCsTcJx5ujE=;
 b=UAure3G+FVmpa8E0lCVDnDVMmEx+KsWYlDKjGcwkwR1eNhanJW5VVCRUyPCW43ArtJ9jr0+A8ouPTYtmzUlkhoM6ruqPdhkE+hHr0GunfvW9MK3WjbRl+x6hA1HBUQ3v8fzuOsgDnzXGZ9k/J1VDPsuliglfyW4z2P90MaO9GKUd9Ta6wqoPWDu9HkwocefNgTBtQ1NMM+PGR9BJbh1oB2uytUN95SCDojXnA3BMlL/rEL7QQ8zp6b9Nd03fc9MliUDdHEdb9/MNIEd3qhUDjUaG3wPIuyx6vxB3JtpYK7CaBaKAuV3fftj9HLv7MARc47TbKMsSLJgXaVKKmx5SVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkbL/tScrPOyWx7fIQmOpVT96XQUsbYpPCsTcJx5ujE=;
 b=pGirRNwXonk+m/ORQHJ2nnoHWP7l4uu5cN15E28g1xrezMaNnUPZyDP0Ok2nATYhoMsqB/tFbLzst4cpEOqbI3HUUmjlzg7uHEVTCCM17wUs5UWX8O/McBtYzdh2lKz4bE6kbKtlRXSlzwkpHSm7R4h6y1lGie8Rrxlhg0qWgAw=
Subject: Re: Failed to enable debug messages in xen 4.13
To: =?UTF-8?Q?Charles_Gon=c3=a7alves?= <charles.fg@gmail.com>,
	<xen-devel@lists.xen.org>
References: <CAAQRGoD4yEEhiQk8LkKuOU_F2As3BsichHNY_ijoiVWwd3JZPw@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <37044b5d-3395-a252-01b2-f457deb43edb@citrix.com>
Date: Thu, 15 Apr 2021 14:58:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAAQRGoD4yEEhiQk8LkKuOU_F2As3BsichHNY_ijoiVWwd3JZPw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0312.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::36) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5ae35b4-f686-42f8-e376-08d900168a15
X-MS-TrafficTypeDiagnostic: BY5PR03MB5348:
X-Microsoft-Antispam-PRVS: <BY5PR03MB53481BAFEB638FFB0D35D0EBBA4D9@BY5PR03MB5348.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7diDuFLM+QGKLL8Wd2WRBjwUeVGS5C/+M/GtvwvoV50cQijNDxHYtjbvlB2xnd0qrm5dvO5Uo9fMXmz/VMlemMEu/2dAAuWpWUI7ilSi6x5nIqSxTRBE7ZkRbsgk6UWTt5pNOFeXY7p8vZ3Oe2zzWJZ9TwiFYOKItBbm4eDIrOUmI/3ao+BYDm0z9N2M5T31CJjxCgnadZQWZ+q85j2x0gYHiiEJCBSVkjLxWDbtvXicYE5+IOjnTFc54YRVXqaH2YKI5XdlsCjRz9maWSJPxGzHkuvj1lywrWY23WTseH+0qJzpMPnGl0Ap2WlgNzLGCvBLUGt0Tf5gIlrXfT90CzIgMoUk135S3BRbG3AkWBu4LHy53Ca8I0wd8NKRPCE1XfAu3bTlMUaIitl1RIhfgpNNGyppVUtRI9X5K+Z2rySQ6u/5w1BrIImrM6kxWAz8ViSaV/UV2eCcI4+8b8M7cCdM/yeXxhskIiK9Ae5NqLUBj3OU9TfucBbqnwSKgPH4bmuRMf3KpnjymLRK6bCGjV1dBtG+WAx+CKVJioO4SLUKjNI6HUgXD5WzV54BmUWQCJqXB8DKq7eRy66XD5UPXcm7Am7VIjuKYsHclw+2QwJnl67ECdF/udrBY7craJRc9vlAHVcVEKQeqgnwEzhlH2dqxQm0LhkufEkVXOh7iOZLqVybsf9DctcuOmboUn0r
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(2906002)(478600001)(26005)(31696002)(5660300002)(36756003)(8676002)(16526019)(16576012)(4744005)(316002)(6486002)(186003)(66556008)(86362001)(8936002)(66946007)(6666004)(66476007)(956004)(38100700002)(2616005)(53546011)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RGNlZGJiN1c0S2lPT04wUjU1QTl0dUFOMHlkaWRPVm5rMnJyM1AxdExEZU80?=
 =?utf-8?B?ZzBOamxPSHBjZHV4M3VLVU94bTRhL0xuZGdNZjlhN0w4YnNQYVpnU1dKWG1o?=
 =?utf-8?B?akwwWU92VWo1aVl3Z0tnU0pPbXRNclYzVStoN05QazdVWVFSNWJzbmNIUFgw?=
 =?utf-8?B?M01tUzVHZWQwdnVwSkFvWHZLRHlqeDNtSlpFbmt0Z1lXbXl6dzBxcUo0TU1F?=
 =?utf-8?B?cmEyYzZFVlhGcnJ5TXhoN3BZQXZ2OGQxcnhFdUJLN2RUNlM5VTg2WjZTdUNv?=
 =?utf-8?B?VlBkTWk3RjNZR0N5QVBaR1dhSmhUU1RBaXc4aVhYNXY4aGlvMVgrWGg4NWFJ?=
 =?utf-8?B?NE9XWW9KOFJ4NmpPNXRTTGdMTFdUdFJwMlpJVmRZUXBwUDhBQlpjR3dtNWEv?=
 =?utf-8?B?ZWNnTCtmcTgzd0ZTcllwSWxjS1lKemN3bjJTdjNBdU5tZlNybUhnMFkwcC9l?=
 =?utf-8?B?aG1lVDhDUVpTVUYyZWZ4YTR0T3kyQzZwa2Mwd0h1d3N4VUx5Z1p4Z3d5K3Iv?=
 =?utf-8?B?eHRlenZncXY3ZTJ0U1ZBTHg4MG9VTzludDhnZlhnTjR6UVZxS1BHMm5aU3g2?=
 =?utf-8?B?WmFsT2Z5Y2hJSDNKQnMySnpiRTBKdWNVUzE2eFZtWUtlelpObzBTNWdKNkts?=
 =?utf-8?B?RG5idmRnQ2dyeGdvTDRndnQzNkQ1VTJCYmtsRHk3UUlQS3lsUklBQWFBNHFu?=
 =?utf-8?B?TVpVZFhZNFN5YnVTN0lFSVhZRnFZTVkwSHMxZmFRRFhqNU1PL3hXS3M5QWx5?=
 =?utf-8?B?SFhpQnBMWWJlWEZVd1ZRbU0zN3FNNURxdWZTcS81ck1DVCtYTkhNM1plallE?=
 =?utf-8?B?aXFjeUYxdGdZU05qMkdZYUYzOXpwdEhpVzVwbi93VTk3eDlwM0lTdExsYnl5?=
 =?utf-8?B?aUZPMnIzOFo1T2Q3SG5uL2hhczQ2aS9hTFZ2cTZpMHRTc3ljVjdCZ1BLc0N6?=
 =?utf-8?B?WWFKYmlwS0FTK0JJVi9Kd1QvcXVrZ3I2ekJYdXk2ZVFmd2k1b09Oc2NtV08x?=
 =?utf-8?B?Qk8waGNJMVdoOVU0NTgvck1PZlhUUDc5ZHllV2JzNlB0QTRyOUQ0ZGxZRjNU?=
 =?utf-8?B?RGF3QTN0VTM4RC9idnJ5aVRFR3liYXRqdnNZanJJZVZEdXJxc0h1YmxqbjRY?=
 =?utf-8?B?RlRMTW1qS0dkRXdGamVQNkJJU0JROVFsQXlmaG0vZmNrVDk1cWpSMzZDUy8z?=
 =?utf-8?B?TEFPRW1kVkdpZjh6aWNjK3JyUEFWZlNxM1pINkorckpXdkRadEw5OGpwRGpw?=
 =?utf-8?B?YlI2dFl6NFNwM2ZmR25wejFnaXBLYVZjREo3dHZDbWZ0MTV2MjU3Q05yNm1Z?=
 =?utf-8?B?azUxa1dLMjhNeWxUdjJYQzY3NFVPMk5aQnk4TGRKUU93bHhsV3JpWnlZTDJv?=
 =?utf-8?B?dEhoeWdGU0UzUTJEZnN3dlhaWHNoZTZlRWt5c1dPNm9vbHhtd3NKYkhzNHRG?=
 =?utf-8?B?SjY5ZmNOdGU1aGtrRUhscm9wK1R5aGN6cWx0TmVjWStQVVZScGdLMkszQmhS?=
 =?utf-8?B?VDEyWTA3bDBPRFR4ZXZRajY4OFd6Rll0SnJRd3lDc21wVTVpZTNYd3plZ0FK?=
 =?utf-8?B?L3JLenFKYXhnZkM5bFNDNFRCRWZETWE3K2ZTeHptMU5yNUNGNjBKbkdaSGRQ?=
 =?utf-8?B?L3VIWFlaekNaZUpuV3JsRmswa0dVaXNFQWxoMXRtU1ZPdmtOTWJRSTd2czk4?=
 =?utf-8?B?bFhxOXR4YmxFbWg0Y0hkMjJTSE1CQXI0U0RKSW5BSHBJNDNITFQ1WWhaYUYv?=
 =?utf-8?Q?RzUNWMkAqIkIpy3ZpGuwtvt1S3ASYBQf/RGRwzQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ae35b4-f686-42f8-e376-08d900168a15
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 13:58:25.8914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QpxwI+flktKLHsNuoIET3Ciy8+YI4st1LItCwdi3JqQUnYGkgrVMXhgsqHQYGghpjCcGcSGojNlzu7XzoSiBXeChavkNfHu6115Je5xB3AE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5348
X-OriginatorOrg: citrix.com

On 15/04/2021 14:55, Charles Gonçalves wrote:
> Hello Guys, 
>
> I've enabled the log_lvl=all guest_loglvl=all, tried the xl debug-key
> +, configured the build with 
> ./configure --enable-debug
>
> Do I miss something?

./configure is for the userspace tools.

You want `make -C xen menuconfig` and select CONFIG_DEBUG to build a
debug hypervisor.

~Andrew

