Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB904B458B
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 10:22:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271267.465655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJXZ5-0002PQ-LD; Mon, 14 Feb 2022 09:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271267.465655; Mon, 14 Feb 2022 09:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJXZ5-0002MG-I3; Mon, 14 Feb 2022 09:22:35 +0000
Received: by outflank-mailman (input) for mailman id 271267;
 Mon, 14 Feb 2022 09:22:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jzps=S5=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nJXZ4-0002M7-7v
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 09:22:34 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2e1abfc-8d77-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 10:22:33 +0100 (CET)
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
X-Inumbo-ID: a2e1abfc-8d77-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644830553;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=rYkfkLUhq/ht2Astbyq1XPgusmFyRU50M5DZUeZP9H8=;
  b=Ogx5YA2jjKnMdzoBYCOlawPc9KTin9ycGUVYriRZnQYacDvkNHgzw+r/
   ErnuMyZPEWmv+BcGPVfv28pr5gYhufAIllH1RdbDzFcRxeoBM0eSy/eO+
   kPvr8e0hsGzqRcC1o60PbSABJuBAvY5EZhfp8hKll90xWlNDTRnuv+DFo
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NXQlrb/lw4cAeVsGqpiZyQecvvmy42F0gYKj1lyOIg5hz8cyBXp8jhwDyJZLcZx6JU8NrcbGzj
 kLAh8AzqKoR7HKQitdCPshmrXCdxx0Hl+hZ+l7UO2lE5H3Wn20IrCzckOoFqIPVJ0sESOhZT8G
 0NnnP7rFrtEXoXoj5/mEn1Cg+tIUnms2OcQK78dhbpN3j9JWihcdzOUdqT0YhxBjjrTDgqcpYX
 bSY1vwpuQWT/epGlAPt9liZKGLTU5l6m2/UM5BgBwY+7a95qxdOfpUmsstPlOp0CUE1zG+6QDG
 6aOvttRQlT9OLtc6uRsIRzuM
X-SBRS: 5.1
X-MesageID: 64037144
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fBOPlKzFONxS03bLLzp6t+f+wSrEfRIJ4+MujC+fZmUNrF6WrkUDn
 2cZWmyAMvmMYmGhKNlyPo+x8R8B75KGn9ViGVA9/iAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wbdl2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt81O5
 4h/67q5cBo4G6SSqMMsFAUfFxgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYEEhGxv35wSdRrYT
 +oAamFkcE77WEJSOm43VJ8hzeuw2GaqJlW0r3rK/PFqsgA/1jdZz7zFINfTPNuQSq19jkue4
 27L4Wn9KhUbL8CEjyqI9Gq2ge3Clj+9X5gdfJW6/PN3hFyYxkQIFQYbE1C8pJGEZlWWAowFb
 RZOo2x38PZ0pBfDosTBswOQvUGr4yxCfdNpDvwf4V+97ZuT/0GdPz1RJtJeU+AOuMgzTD0s8
 1aGmdL1GDBi2IGopWKhGqS89m3rZ3VMRYMWTWpdFFZevYG/yG0mpk+XFr5e/LiJYsoZ8N0a6
 xSDt2AAiroalqbnPI3rrAmc01pASnUkJzPZBzk7vEr4tGuVh6b/PuREDGQ3Ct4acu6koqGp5
 iRspiRnxLlm4WuxvCKMWv4RO7qi+uyINjbR6XY2QcV9qGT9piP7JNsKiN2bGKuOGpxaEQIFn
 WeJ4V8BjHOtFCfCgVBLj3KZVJ1xkPmI+SXNXfHIdNteCqWdhyfclByCkXW4hji3+GB1yPlXE
 c7CLa6EUCZLYYw6nWHeb7pMjtcWKtUWmDq7qWbTlE/8j9JzpRe9FN84Dbd5Rr5lvf3U+F2Pq
 76y9aKikn1ibQE3WQGOmaY7JlEWN3krQ5fwrs1cbOmYJQR6XmomDpfsLXkJIeSJRoxZybXF+
 G+TQEhdxAatjHHLM1zSOHtidKnuTdB0qndiZX4gOlOh2n4CZ4ez7fhAK8trLOd/rOEzn+RpS
 /QletmbBqgdQDrw5DlAP4L2q5ZvdUr3iFvWbTalejU2Y7VpWxfNpo3/ZgLq+SRXVni3uMIyr
 qeOzATeRZZfFQ1uANyPMKCkzk+rvGhbk+V3BhOaLt5WcUTq0Y5rNy2u0aNnf5BScU3On2LI2
 RyXDBEUofj2j7U0qNSZ17qZq4qJEvdlGhYIFWfs8rvrZzLR+XCuwNEcXb/QLyzdTm795I6re
 f5Rk6PnKPQCkVtH79h8HrJswf5s7tfjveYHnAFtHXGNZFW3ELJwZHKB2JAX5KFKw7ZYvyqwW
 16OpYYGaenYZpu9HQ5DPhchY8SCyeoQy2vb4vkCKUnn4DN6oeicWkJIMhjQ0CFQIdOZ6m/+L
 TvNbCLO1zGCtw==
IronPort-HdrOrdr: A9a23:Bz1EyqCiUQ4xkf/lHeg2sceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPH/P6Ar4WBkb6La90Y27MA7hHPlOkPUs1NaZLXPbUQ6TTb2KgrGSpgEIdxeOktK1kJ
 0QDJSWa+eAfWSS7/yKmDVQeuxIqLLsndHK9IXjJjVWPHpXgslbnnZE422gYzRLrWd9dP0E/M
 323Ls4m9PsQwVcUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZvzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDj1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXoyEfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplW92/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ghMCjl3ocUTbqmVQGagoE2q+bcG0jbXy32DXTqg/blkwS/xxtCvg8lLM92pAZ3yHtycegC2w
 3+CNUbqFh5dL5gUUtMPpZzfSKJMB25ffvtChPbHb21LtBNB5ryw6SHlIndotvaPqA18A==
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64037144"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kt2M6BhtWrLeOl8jXfiJggw86dv33OVQWk8jwrfF4wajEXYpqY32SElg3szDgrCSbt/pQdjBvmcUGEk1478jgg4vXc5DcnA9s4ch0M0wLgFFc3oAC3gAKsqYHnKGiUvLrDP8QLXdiUhpJAzuuFa6mIDWzfV/5O70bTqTkmBw1qAApeyaEJJkV5c+nZzDVzkLK3v0+pDiDoL+C5nWCNHmJ17NH8VpeBIJ+LVcSR5bhhXnDoop8uk7BqxRf29sxhT7lziy2AFfyFXNa+0QeE3aFzqHLkFhrKdfKsor4jbqxrhCQi1BLru/65bcFkwGf67gl7KtaK8RcwLxj2zVktpFDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSRV7VK9yrauXdyLSbSueMKkeR6/fnPifTYno4dZ87s=;
 b=azy5X5HFs5sU5kdqa5jvfPvDwh7uLfmVURFqhdheCAaKZCmos5OsBJbHO28nz9V09yojLinW9yI/rlmokR9PrY2+zivC8wEDLRGa9Jzh2xQ7FUXeRCgj5N+VKjdXwCdbvQQy37VreeKArOzIddsaslfUzmozUEsy0mJHFT5UxxGTd/dhEd5cK7QEl267ugdWA9qEYNbOXDkvrcmdMy5WuOcDyqUhg9WbY6rOqP5p23ecwU4POyo3Kx3dMg9hJNr9QdwXqp4Dy3Am/iWV1t47nAbkv70JIoveulrwBO3X7ombx1Tifro+ww5dajsepnGeug5aGTqtqlcNL6kn1RUBFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSRV7VK9yrauXdyLSbSueMKkeR6/fnPifTYno4dZ87s=;
 b=dO/2uObaE/fkh+ZsE+S/vV/v+mUGKDTGK1XIPyt0EzV/gxZX3Lk/Th8bplgmXf7WNrXialjrwIHKhJPQz/2IKMb74Z0ZCv308NTO/g+h5+7MBVtdWq8h7K71F03UHmmE070oaHgVyb0FCeFBPCEFvbvWwCfYcv+WhvKxf++aQS0=
Date: Mon, 14 Feb 2022 10:22:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/Intel: re-indent family 6 switch() in
 intel_log_freq()
Message-ID: <YgofT7jG9CFSunkO@Air-de-Roger>
References: <92d00aea-9984-3940-2e2a-d54281e4c3a1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92d00aea-9984-3940-2e2a-d54281e4c3a1@suse.com>
X-ClientProxiedBy: FR3P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bda64aa-893a-48c7-fa3c-08d9ef9b84bf
X-MS-TrafficTypeDiagnostic: BN9PR03MB6043:EE_
X-Microsoft-Antispam-PRVS: <BN9PR03MB604320876AFDAE9CE69E3EA88F339@BN9PR03MB6043.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xNLKsNNTq1XFV05SoCUSk1Nj7muj1ddxtjDe4jVDtjue+B2zNQvFz2c2Iz9Fs85fUZeNoAXmMlbLAMYZj+KLozEOzr3HKknGNcnR4kDVpOyjDtTEzw3bsuX3MczFHoomnBGYIw2EvDK+FnIQxEeZqmZPnBdBuMsCpmUOBRLL2QHtVcspVijXv+cCJcECcbo9M2fWCB/850fDLpeofTmF7WYGjzcSnRbpsqX4qJwE1tiQInkobFDLEwhifNn/bRBhqPNrEYpMzy9GdyIndhddJxjXuGNyRR6yPi+wRUiBtwS51lW20Ck8iUNkp+0ZcKbsxPqaDaXb6iqnryjEtBq6djUjCmQ2H3wkOf9DAhuWN1DHT7Z62zc8FvnSL+3uU1jfDtnrG/nFeP55tpZ4PY0KdSNHxPpqeSLfooDGaravyCZbqYVQm/EkF8ORJhLzVQHXp0OVWeTXGiRIYXWGP8lax2q6zQmZuB5nQOzqWoYjWcGKlfTq6cB2uezj9HH/9wztvYVlFX0hgN9YO2zSnm5nOsMJBctD7NUAPqYaGwr6ax3FS2zSHZI8Rx/ibkWNPH+a5LaS39OvGjXwngGz3m8+Re+DZD1KBJnz4WZ2yTFmHv5tXKsXwZbhUXnyeKH34FY4tOBWTdAZHL8Y9XAGT+lPIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6506007)(66946007)(66556008)(26005)(8676002)(66476007)(9686003)(6512007)(33716001)(508600001)(6916009)(54906003)(6486002)(86362001)(6666004)(316002)(82960400001)(186003)(38100700002)(4326008)(8936002)(85182001)(5660300002)(2906002)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlJpeVlWcU5wQkI1NVhBYUVJN3dnMFN6citiVGNubnZNWTEzWXlobTVtUDBj?=
 =?utf-8?B?a1NseVdrUklKcEdnSzlkcVBVR2Q3L2U2ZkJtbmx1aEhNVlNzSzdEN3JpeVJD?=
 =?utf-8?B?eVRmOEtuOWphaUhtOVdvbGVNVmtLRHRsSENKUVlxTFJtQnM3cDZwL211RUtJ?=
 =?utf-8?B?dGVTUHNzZERyUzdSYlZlQTVWd0pGdndvZjZlMTE2Smsxd2M0bVpwTHVQRDJu?=
 =?utf-8?B?QklteEhabGhjR2NTSkRkSVovaWFRbG11elpzdWtET0w1REFJdG5mTEl1MitV?=
 =?utf-8?B?MExQdm9HVFdkNkljcnFPK1VqMmlLQjFkbXJQbUFRTlBIV1hRWkt2N1NLcWYw?=
 =?utf-8?B?SFFmZlExTkpLdnBkdDQvQVppZ2hDeHVGNkJnaVRIOEFOSzViRTFRRHJPa3Fo?=
 =?utf-8?B?dTNkMm9oeVdNTlA2ZE9JUjJqdUdDK0EyNFRKYlM2K3VnZTNDUWU3S2xhOTAy?=
 =?utf-8?B?RXNyMSs2WkdVYXFwUE1OUTFpOXUwcXM0Ymd2WWNjaE1KRzkyOGxMQzloL1lE?=
 =?utf-8?B?K0hmb21nOGVucC9MRlpBMVB3TEd3L2ZSUTFuS0hSVHUzTjlpOHZyZTZ1RVlZ?=
 =?utf-8?B?aFVKdTlRbUVDOUhRMThucTRZcHdOYXBSYVV5aFRTSzNZeVdyaTBPZGJzRkpB?=
 =?utf-8?B?SjFiSEpQUTBhODMrWHBrdlo0bkQ1cjd1SW14REU4NHVPUHBrMCtUaWNTaDZB?=
 =?utf-8?B?SzZJTUl6SnNWSTVvZ09iakZCVmljbG1VL0gzOXVuOHNmSXBPcmxETWtPNCsr?=
 =?utf-8?B?QWhSMWtlemZsZVRIMHJkWlFKQzVkcjJ0dGQrOVlQMDJUcTRCR3JvcjlCQklx?=
 =?utf-8?B?U0t0ZmVyZHd2ZjM0K1pvMEdsemZ0ckRZN2Y1SlZGVSs2R29XTEF3ejhsWkho?=
 =?utf-8?B?ZmQxT1RkMzk0Q2pyTlc2b0J0OWFEaWdBeEw2ajNlaXYvczV4ZENkOU1DS2tT?=
 =?utf-8?B?V25ZY3VvUUcybkJmMDkwaytJNkJodjQ2QTRmd1IvcXkwUCt0RE85S0swOVFS?=
 =?utf-8?B?QVRnMDA2MWVST05kTG5pZXBYT2NuQnBQRmVteWV2U3VkdUxteG5RamxQSi9x?=
 =?utf-8?B?STJoVjdqVjU3SDl3MWp0QlVHY3BkU1BXa3lydW81YVJGME1oazBLeG0yS0JR?=
 =?utf-8?B?eUUyK0E1MnMzbjR5cFFQLzQ0VlZJS0VFTUxISGZLU3pjb25zeEUxb0ZrRlhs?=
 =?utf-8?B?aXdqSi90MG9ZcC83WEx2cUZLazJiRisvTVNJTVJHd054b1l6czNBRXNFUHdv?=
 =?utf-8?B?LzdRLzArODA0a2tRb0ZoY2VWODBxRTJtTWMrakx6U3Z3MXBuTlVBTlFLUXBU?=
 =?utf-8?B?QWEzVmdlbG8zcUU5VzlON2J5RHBGRE9iTXI3WFlaYkMxRnVvaGdoaXVid0Zz?=
 =?utf-8?B?TW5WWXlBVXdsbHVLUmJWN2gzeExaQTlVQVYyMVZVSGNJTHVYd0ZPOFRLcVFT?=
 =?utf-8?B?RXZ5OVA0SU9yeWhBWHpuZlJiNzhpUWVTUTd6SEN1YWNQbDFsd3JKOHhkeXJj?=
 =?utf-8?B?QlBaYzV2VkZ3V01EWEw0MW80Y2F3eUlkOGJUNUl3RjRPcUFBWVpWRFZSM3Yv?=
 =?utf-8?B?TE5IeUpORm1MTFdSSGpORyt6VkxRMnVxcjl0cXhUeFg4UEpsMURsZmpUWU1n?=
 =?utf-8?B?U3VMTnhvRVhxM21tN2JYWHBtUXo5Z2k5Nmd1anQ5T1Qvdkl2QVBoSGNRYWRj?=
 =?utf-8?B?VHNiUlE5SWx3czRmYzhILzVycFlEKzZwU1pYd1k0RDhqL3pnbzNzM0pkVy9k?=
 =?utf-8?B?VW1GZk5WVlI1L0F4Z2hpVzUxRmxMYTV4U3gzREc0NjB5NGppUURBaExvSkRq?=
 =?utf-8?B?SzYvb0lnVHFudkU3WVAwMU5yTTcrV1NqMnV2WWU2RUdob0tkOGdYNUcrQ3lp?=
 =?utf-8?B?TmJzaXZXOG5HTXArZ0VGM3RGUTZBR2hub3VreU94bmFhdWg2VnZBdTFuQVJ4?=
 =?utf-8?B?RkxoQ3JwVS8ra3k1dzRud04vMFcvSXJrU0p2a2Q5Uzg5OTk1RWkwNGc5VjIv?=
 =?utf-8?B?Z3VscjZHc0lOMEVzMmJDdnVRL0pYcmRKYzBFeWNwc3NsanVKQkducktoSlhn?=
 =?utf-8?B?RE1DaFJOcEhZS3UyNURUWkNQRmc0NkRiZGpPSFp0VEUrNnFlSmwxRjhkajlP?=
 =?utf-8?B?c1pwaS92SHhjbTllZEVkSEU4Q29mcUM1dFl5RW85Z29QOTFFMnlXWGtIM29p?=
 =?utf-8?Q?dnfk1Dm8I/NeWK3n3mMOcoQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bda64aa-893a-48c7-fa3c-08d9ef9b84bf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 09:22:27.6404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHDa0k9fx9Epyucr/ZrvU3vRYXi0teotEysKVwLcx2cVoB/iBUOhRQC+y/7QUuBRiRaqSxCxS1AD15vQBzOg/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6043
X-OriginatorOrg: citrix.com

On Mon, Feb 14, 2022 at 10:18:47AM +0100, Jan Beulich wrote:
> This was left at its previous indentation by e6e3cf191d37 ("x86/Intel:
> also display CPU freq for family 0xf") to ease review. Remove the now
> unnecessary level of indentation.
> 
> No functional change.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

