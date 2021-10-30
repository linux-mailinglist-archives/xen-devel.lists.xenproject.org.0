Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6004407F4
	for <lists+xen-devel@lfdr.de>; Sat, 30 Oct 2021 09:54:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218717.379272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgjBK-0000u9-3g; Sat, 30 Oct 2021 07:53:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218717.379272; Sat, 30 Oct 2021 07:53:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgjBK-0000sC-0C; Sat, 30 Oct 2021 07:53:38 +0000
Received: by outflank-mailman (input) for mailman id 218717;
 Sat, 30 Oct 2021 07:53:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b4cL=PS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mgjBI-0000s6-5j
 for xen-devel@lists.xenproject.org; Sat, 30 Oct 2021 07:53:36 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b3471d4-3956-11ec-8525-12813bfff9fa;
 Sat, 30 Oct 2021 07:53:34 +0000 (UTC)
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
X-Inumbo-ID: 7b3471d4-3956-11ec-8525-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635580414;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=+xn9QZhfUiGdzHPSaKyZLJ5GAwI6vtsT6ydfVfA5RoU=;
  b=e9IbTmUvwPaeBXE0zDXRIy8jBY7qQHuBN52+1tzbg3pc17byLnUN5SsI
   NAuT5juW18j1VmIK01yda2KxJlUiRCtPyldE2HzXq9ezXlQGaAiXkoKpf
   Tw81gfnjC9ypQAtaL77mw6wRKNS9NRmb4tRoeS7NSYDAX9ezbaXqddNND
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HzU8GZT1m77svVQDHoja5CToL11dWaDmNAV9SDJyMRm2ZxMUWSdH32rdwgYtkKWZC3nimkhluA
 dgJfFEHbcvjMuYKzdx0CFC8KjTmPKdu0AkdtPF2iKUhzEhgoAxXMJst/Nmg+c5IHw/Jh8hb2Gf
 a2L5kXpH/lBeJCHOxABYGj9zk8fh7rN+GTeMMzcC/Zs7yjcYxiJXoGfIZQymGnxy0+XrCVFhhz
 FXtHJ2c/Tz7oWcYadkUu/lRqe2Dm11JoEvXIAxvFdtI7Ae3CWnQmKb4VF6/uHGbmAPltvIShbk
 E2oRZugYecRTd0taa1zdq66l
X-SBRS: 5.1
X-MesageID: 56677409
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8s4hcqChlDCBDBVW/3jlw5YqxClBgxIJ4kV8jS/XYbTApGsqhTZVm
 2UZWWnXbqnbNGKhKtBxb4jioR5X6Mfcx4VhQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX5500M7wIbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/sSW5lPEsz
 I9xqt+Rax8wIPzFtLgFTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHvuUuoAEhGZYasZmTa7RS
 NggZzNTNBXFWy9FIH4HMMgytbL97pX4W2IB8w/EzUYt2EDfxRJ8+KLgO93UfpqNX8o9tkSXv
 GXd5EziHwoXcteYzFKt822urv/CmzvhX4AfH6H+8eRl6HWtwWgUBAwTREGMi/CzgU6jWPpSM
 0URvCEpqMAa71e3R9PwWxm5pn+svRMGXddUVeog52ml1a788wufQG8eQVZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAXMGsDaCksXQYDpd75r+kbjBjCU9JiG66dlcDuFHf7x
 DXikcQlr+xN14hRjfz9pA2ZxWL3znTUcuIrzj/HbmmEswcjWJHmRq6w8EaK5NocNJnMGzFto
 0M4s8SZ6ekPC7SEmyqMXPgBEdmV2hqVDNHPqQUxRsd8rlxB71bmJNkNu28meC+FJ+5dIWexC
 HI/rz+983O60JGCSaZsK7y8BM0xpUQLPYS0D6uEBjaij3UYSeNmwM2MTRLPt4wOuBJ1+U3aB
 Xt9WZz0ZZr9If8+pAdav89HjdcWKtkWnAs/v6zTwRW9yqa5b3WIU7oDO1bmRrlnt/7Z+1+Er
 I4FbpDiJ/BjvAvWOHG/HWk7dgliEJTGLcqu95w/mhCre1IO9J4d5w/5nup6Jt0Nc1V9nebU5
 HCtMnK0O3Kk7UAr3T6iMyg5AJu2BM4XhStiYUQEYAb5s1B+MN3HxPpOKPMKkUwPqbULIQhcF
 KJeJa1tw51nF1z6xtjqRcCm8dE5K0jz3Wpj/UONOVACQnKpfCSQkvfMdQrz7igeSC2xsMo1u
 bq70Q3HB5EEQmxf4Az+MZpDFnu94ioQnvxcRUzNLoUBcUng6tEyeSfwkuU2M4cHLhCanmmW0
 AOfABE5o+jRotBqrImV1P7c94r5QfFjGkd6HnXA6erkPyft4Wf+k5RLV/yFfG6BWTqsqrmif
 +hc09r1LOYDwARRq4N5HrsylfA+6tLjqqV01ANhGHmXPV2nBqk5eiuN3NVVt70Lzbhc4FPkV
 kWK89hcGLOIJMK6TwJBeFt7NryOjKhGlCPT4PI5JFTByBV2pLfXA19POxSsiTBGKOcnOo0S3
 up86tUd7Bayi0R2P4/e3DxU7WmFMlcJT74j6sMBGIbuhwcmlgNCbJjbBnOk6Z2DcYwRYEwjI
 zvSj6venbVMgEHFdiNrR3TK2ONcg7UIuQxLkwBedwjYxIKdi69lxgBV/BQ2Uh9Rn0dO3O9EM
 2R2M1F4ePeV9DByickfB22hFmmt3vFCFpAdH7fRqFDkcg==
IronPort-HdrOrdr: A9a23:lea7kam6sl/ilplQ5RrJ4F/J6kHpDfIS3DAbv31ZSRFFG/Fw8P
 re/sjztCWE6wr5PUtKpTnuAsi9qB/nmqKdgrN8AV7BZmTbUQKTRelfBOPZsljd8kbFltK1u5
 0PT0DZYueAaWRSvILf2k2ZCNY7hP2K7aiEjfrXpk0GcT1X
X-IronPort-AV: E=Sophos;i="5.87,194,1631592000"; 
   d="scan'208";a="56677409"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fCyKVZvnlpeVtjNCUNoESM1s4trefVVu/tUPn/6sIi95hGxVHKLBJVGf0s2Ys8oZNVBY/ZnQoDRQ7kfY3CO59JIuaqQztldU6XUjTSZg+RP0+aNAPuIUgAiyDIxxu+0Fx+3HzDsvfeHs+oTqdbRIvJ4H4kVlMTNtIoAr+ijbsrhbT6GICa1RqIBH07o0k4szg1klEGfRj/uK5yazHPzzwbDIQBH1HfjUghDboJ8g9nQ8TON+lzOl4PsEjEIMMsa5w6KrWk53QHN2mK3tSj2pG/CovmFeXf6mj5JBap6ukX7UatX36hso/8NtRUrlwdXoNfUiPJNKDGWmW8o7mnNtkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MVJ1k9E/HU64AYnlrTPywAaZ3jOuUc+JxseXIJ8jVeM=;
 b=N3ke0DeNSvH/HvWA2J7/08deNhg/TDOOur/ANgjn3cbpJxvIdltAST5tS7EcQNKC1SOVuvchkyMavziFmy2P+UjSnNIhYSwU5OWLVva0zKbuh/3WmL2CgGHUj+Ae4BXRhZhCnLmkv58K7aTvb15FOVMxJ7mv3i29Ze/2p5IJiOmLd0VkB8ZsJiRNqqiELdReaqqS4Jqzg4yWJqMllnC5MKKuUHPuX/qY5IMj3krwVDB1EichqSjXVckvIMSiBx1eftedPLN574Hogbu2dTAoW/uhqU2Up01yQQr+hG1wre2nm6MCE9gNjNSb9zkmStHSBzJINe1AAwur1vKOL7dDjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVJ1k9E/HU64AYnlrTPywAaZ3jOuUc+JxseXIJ8jVeM=;
 b=hc3HZwfQFOD1BJMUB7x/px+TgMAj3TuvC+moJHhG/fYqPG4V0RLdKoNta2x4bTXK8epveSzULQeQCoeG/gjkgUhmoFOjmNd5M6KXdNkx+ddvSrqLnZrYzrWJHPiiT+V0e5RPE5x3jQDQCVtFmtkuXpkQOJDF2voP/O7lqiveADs=
Date: Sat, 30 Oct 2021 09:53:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Ian Jackson
	<iwj@xenproject.org>
Subject: Re: [PATCH for-4.16 v4] gnttab: allow setting max version per-domain
Message-ID: <YXz579WNpHe7aO91@Air-de-Roger>
References: <20211029075956.1260-1-roger.pau@citrix.com>
 <ffd27f87-9e47-12cf-2cfd-1688a19c445f@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ffd27f87-9e47-12cf-2cfd-1688a19c445f@citrix.com>
X-ClientProxiedBy: MR1P264CA0130.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 226dfa93-30df-40d1-adc9-08d99b7a5a13
X-MS-TrafficTypeDiagnostic: DS7PR03MB5445:
X-Microsoft-Antispam-PRVS: <DS7PR03MB544507840648014BDECDCC968F889@DS7PR03MB5445.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2C3eamT9JA9CS6o8NGEhbsa0DD843NNamdx3HujpsjUZdThTOzX4zHK/zm30kb8rnjOMfXPMygfJzsLT88HZyXg4sQx5h4Ts8ctKlKl+YByTKSs3d7yqK6gxVKwJkdXtZbVFDuAoR6CUhw/Y8SO3WJw7g+Yy8GYG7bFB9/kVB0Jai3NQ5+H+EdLIWWTbry9CbqIZ5VnqNawocg1ByC/ZBdo9rxfaA5p2pIpOu+1RBjNjKoj21vwFo15WV44YBUcbr9yQD48ZRkgOgdKUHEulqpQaYsORLFZm13F11a+No3wa+o6OPsR+dcfvkIGhQxHwy9ri7k46+0xPnaKVaSmrZ/8uasA397FfpIIucB+yODNFkjNHkYdsc671Ff5wT4VnjQFQPZ9ql7cEUpUhr6aCNncdbfyd1ksqYAftf3VluL50b1+kp5lpoFhWJyNp7Ci10xdx83MYEyDm64Nb2redxPL0CYtDPXxEQqkht/HKSuTNnmOpUCjs2sR0Er80/Mx7CjNMEcIBd4tgA39BiF3B2XmLBD0gpjk348gMBMm4l0IGrSdxsbnjB8Mh27LFQKk6seg5CFeljOO6rP3+N2OPQADhN/P+YnHKTjlijYQpQOEdgq0ZAEb3j8UU8Xhk80E2UUmLaCVIqbSuHKlCbAt0/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(6486002)(26005)(66476007)(85182001)(508600001)(186003)(6496006)(6636002)(8936002)(82960400001)(86362001)(956004)(8676002)(66946007)(4326008)(54906003)(9686003)(33716001)(38100700002)(66556008)(6666004)(5660300002)(6862004)(53546011)(316002)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qm95NGQrYTdkSTVnNUo0WVpNc2ZIM20xRGdDaGZaNU10OTF0Z1lsR2M2em1p?=
 =?utf-8?B?YitGZHdScXYvWWpUNlpsRkhiSG5DYncrQ2pBMnVDMjFqZGhDbndXelNCQ08x?=
 =?utf-8?B?YU81VUhHUFNHeENwRk1XRzllU00vZkE1OGFLclhtV2RtaXJBZzB5bjlEUzFs?=
 =?utf-8?B?dFlkcEpNZGxXa3pYd2g5dTdrdG9vNkxhNEtrakRoTElEc3dEWXV6NStrcCtI?=
 =?utf-8?B?YzQwd1Qvc05BY1RCSEdoQ0ZiSGkyWkJBelcydHAyL0YvS3JHTWI3K2tLWW0r?=
 =?utf-8?B?REhmdFVrL0pXbFYvQ3E5YmpaKyttcVRzSkVYeXhUNStNYWJ3Z1pvWGtNbk1v?=
 =?utf-8?B?TUZIdW92SXNQdSt2UTAyT2V2cXA2ZFAxdk44MlE4YXk5YVBJUU1TcUJnb3Av?=
 =?utf-8?B?a2pzZmFGbnN0SHBrM1ZPYmNLekNqVE1vYTJJM3c4T3ZOajdJNENuT0E1L1Jn?=
 =?utf-8?B?czF0UkZJRzB0ZXRWTEx3aXh1YUw2NTRGVW4yZ0FjYlpBajJMT1dWVllCeWlz?=
 =?utf-8?B?anRrRVN0eG41ZmRFcjcraHhBckZmSEg4WTVhS3VhL0p6bmdVRkdaSCsyVFhs?=
 =?utf-8?B?bG44UmFrM2UwYk5QcmZWd3VGa0l0ZlY2YWV2RGVtUDl4clRTNmJOMUpYV0or?=
 =?utf-8?B?WjFkWlJuS2hOOSt1RlRBZjBVNlVjVVhTREZkQ09xeThSVTllQmdkTVhSWEVa?=
 =?utf-8?B?MnRFbnRjVS9zT2ZtNEJJOUZBNVhtOGt2cnlkZHFqSG9Nazg2UWFodTdrM3JL?=
 =?utf-8?B?aVp0VU5JdHVON0hseVNzSVF3THg4YmVXajZQdkNTNXVOLzZlK2k0ZndvdEY4?=
 =?utf-8?B?MkhBQWNiaWJmTStiM3JLQ3BlL01xYmUxMzB0bm5tdDZTSlJsR0VrS2dMSFRI?=
 =?utf-8?B?REl6SDd3S1RDZFEzRGNyK3BUREJWRzdsU0VKQmhWWm1nNHpYbEVKR1Z5aFQr?=
 =?utf-8?B?MHVPSUxXbHM2c2RsTEpXdUFQeEtWaHdHbmRIOFZTMnZpUjg5eXpodmtFUE82?=
 =?utf-8?B?NHRQTlZYZmF3cVd4OHY1QzF1aU1IN1FRVHMzWGJrVEJsNE0zc2tFWU0rUUNH?=
 =?utf-8?B?cXJsdnJHRVUyNG96ekxPYWFYZ09BWTJKRS9iMElaamJaeWdSZlJ0c0xTYlNK?=
 =?utf-8?B?Z1k3U1p6ckJ2WFRMZFhnMEovZXkxckxrUkNxTFFYTnlLUWZZZWIxTGhBYnJt?=
 =?utf-8?B?K0FzNDZVYWxIaEtwSHErcmx6QmFhVWp2cHdpWmJCcXZ3TUNWSHkxZlRsbXFR?=
 =?utf-8?B?YWpSV0tTZlFJeDk3Zjd5TERKQzUwYmNhU0lvaHJFdDh6bjlCdWIycFBZb0d1?=
 =?utf-8?B?UkxZSnJZM0VWNzRNUkVnSXppR1FPMUx6V21UV3ZOeGt6ZWpyUHNkc0pPcXZQ?=
 =?utf-8?B?ZWo4QXAvbzZuZ3VQWE8wVXRPcnZCK1dpb0NUaTJPUnhuRmJIOHNlek1FVFZn?=
 =?utf-8?B?RkUvVFFSU2FWV0hTWldmNFBaTDQwbHVtbVFwckRFNkYwQ2hraXZSMkNZQ3lH?=
 =?utf-8?B?cWp0RWJteGpuVVJleWZOOU1rSjQvMnlPK2ZBY0tIUFVUMGtWZ3BMSzFXcys3?=
 =?utf-8?B?VVlwSUhxRE1HenI5RnJRQ3EzYTlYWTBYZ202Mzd0UVQ1TUluV0djY1pNbkV0?=
 =?utf-8?B?UDNxZ1VoNFo2b0IwK2U2SEFTUmFLNVdRN1FUbXlqRGk2YjJnM005Mlp0cmhw?=
 =?utf-8?B?WU1UaHpxUkVjcDQ1M0ZBcm1HSFhrZ1IvWmhLSDNBNTlaNzUrQXBTendkSGRS?=
 =?utf-8?B?WU9hSklsL1l5ZzVxTzBLNDRzOGJodFVIeUE5SVZnMVp1QmVrNTZiVWN0cDYv?=
 =?utf-8?B?MWhoc3FCSTVKRFJyZEdITlFtYnl3emlyWVFWQnE1QWpVajRvT2tDZXZvd3Fm?=
 =?utf-8?B?bjJWazBFdFk4OUZDaUh2dWhVQ0dVVTBIV29FOThvdzV6eDNNY0ZidEo2ckJT?=
 =?utf-8?B?c2dYQTgrNHF6SnBRcnd2Z1RxbS9BNDZqVkdCUEMyWUxxQUNuWEdoOXo3QUN2?=
 =?utf-8?B?dkZYWE5FMnNNZzdwR28vRW43YmZMeXF2YWU5blhrc1o3d1lqbGJ5Szh2VjNT?=
 =?utf-8?B?bk1yQVh5b3FETnl1TDRaL1Ntc2dHbG9JTUY4MWF5bWJPUjNyZVdXRTRwa2ll?=
 =?utf-8?B?UTBadlVRN1FNMkpFeDJpRUtObG1kaDRnZlJ6Z0x6aWpqazdkdHNNRnNVQ3FW?=
 =?utf-8?Q?GX6FV6Yyapc+JkToTnwF9dU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 226dfa93-30df-40d1-adc9-08d99b7a5a13
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2021 07:53:25.1082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5JjyzrjxMyH/laEHouSxmkSXzxcl8UKzNP6lT+VbW3/HmQi0f6wBPzPl+QPYfPUTC0v4g6b71TP9cxAO33P+Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5445
X-OriginatorOrg: citrix.com

On Fri, Oct 29, 2021 at 05:39:52PM +0100, Andrew Cooper wrote:
> On 29/10/2021 08:59, Roger Pau Monne wrote:
> > diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> > index e510395d08..f94f0f272c 100644
> > --- a/xen/common/grant_table.c
> > +++ b/xen/common/grant_table.c
> > @@ -1917,11 +1918,33 @@ active_alloc_failed:
> >  }
> >  
> >  int grant_table_init(struct domain *d, int max_grant_frames,
> > -                     int max_maptrack_frames)
> > +                     int max_maptrack_frames, unsigned int options)
> >  {
> >      struct grant_table *gt;
> > +    unsigned int max_grant_version = options & XEN_DOMCTL_GRANT_version_mask;
> >      int ret = -ENOMEM;
> >  
> > +    if ( max_grant_version == XEN_DOMCTL_GRANT_version_default )
> > +        max_grant_version = opt_gnttab_max_version;
> > +    if ( !max_grant_version )
> > +    {
> > +        dprintk(XENLOG_INFO, "%pd: invalid grant table version 0 requested\n",
> > +                d);
> > +        return -EINVAL;
> > +    }
> > +    if ( max_grant_version > opt_gnttab_max_version )
> > +    {
> > +        dprintk(XENLOG_INFO,
> > +                "%pd: requested grant version (%u) greater than supported (%u)\n",
> > +                d, max_grant_version, opt_gnttab_max_version);
> > +        return -EINVAL;
> > +    }
> 
> I think this wants to live in sanitise_domain_config() along with all
> the other auditing of flags and settings.

The reason to place those there is that the sanity checks for the
other grant table related parameters (max_grant_frames and
max_maptrack_frames) are performed in this function also. I think it's
better to keep the checks together.

We should consider exporting the relevant values from grant table
code and then moving all the checks to sanitise_domain_config, but
likely a follow up work given the current point in the release.

> Also, it can be simplified:
> 
> if ( max_grant_version < 1 ||
>     max_grant_version > opt_gnttab_max_version )
> {
>     dprintk(XENLOG_INFO, "Requested gnttab max version %u outside of
> supported range [%u, %u]\n", ...);
> }

It was originally done this way so that the first check
(!max_grant_version) could be adjusted when support for
max_grant_version == 0 was introduced [0] in order to signal the
disabling of grant tables altogether.

> 
> 
> > +    if ( unlikely(max_page >= PFN_DOWN(TB(16))) && is_pv_domain(d) &&
> > +         max_grant_version < 2 )
> > +        dprintk(XENLOG_INFO,
> > +                "%pd: host memory above 16Tb and grant table v2 disabled\n",
> > +                d);
> 
> This is rather more complicated.
> 
> For PV, this going wrong in the first place is conditional on CONFIG_BIGMEM.
> For HVM, it the guest address size, not the host.
> For ARM, I don't even know, because I've lost track of which bits of the
> ABI are directmap in an otherwise translated domain.

This was only aiming to cover the PV case, which I think it's the more
likely one. It's possible there's people attempting to create PV
guests on a 16TB machine, but I think it's more unlikely that the
guest itself will have 16TB of RAM.

> I think it is probably useful to do something about it, but probably not
> in this patch.

I'm fine with this, we had no warning at all before, so I don't think
it should be a hard requirement to add one now. It would be nice if
there's consensus, but otherwise let's just skip it.

> Perhaps modify domain_set_alloc_bitsize() to impose an upper limit for
> the "host memory size matters" cases?
> 
> For the guest address size cases, this possibly wants to feed in to the
> max policy calculations in the same way that shadow kinda does.

So grant table version will basically clamp the amount of memory a
guest can use?

What about guests that doesn't use grant tables at all, do we expect
those to set the future max_grant_version to 0 in order to avoid the
clamping without having to expose grant v2?

> > diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> > index 51017b47bc..0ec57614bd 100644
> > --- a/xen/include/public/domctl.h
> > +++ b/xen/include/public/domctl.h
> > @@ -89,14 +89,20 @@ struct xen_domctl_createdomain {
> >      /*
> >       * Various domain limits, which impact the quantity of resources
> >       * (global mapping space, xenheap, etc) a guest may consume.  For
> > -     * max_grant_frames and max_maptrack_frames, < 0 means "use the
> > -     * default maximum value in the hypervisor".
> > +     * max_grant_frames, max_maptrack_frames and max_gnttab_version < 0
> > +     * means "use the default maximum value in the hypervisor".
> >       */
> >      uint32_t max_vcpus;
> >      uint32_t max_evtchn_port;
> >      int32_t max_grant_frames;
> >      int32_t max_maptrack_frames;
> >  
> > +/* Grant version, use low 4 bits. */
> > +#define XEN_DOMCTL_GRANT_version_mask    0xf
> > +#define XEN_DOMCTL_GRANT_version_default 0xf
> 
> This needs to be a toolstack decision, not something in Xen.  This
> doesn't fix the case where VMs can't cope with change underfoot.
> 
> It is fine for the user say "use the default", but this must be turned
> into an explicit 1 or 2 by the toolstack, so that the version(s) visible
> to the guest remains invariant while it is booted.

Please bear with me, as I'm afraid I don't understand why this is
relevant. Allowed max grant version can only change as a result of a
migration, and A VM being booted cannot (usually) be migrated, as it
requires guest cooperation (and a fully setup xenstore).

Any guest allowing migration during boot (which is AFAICT the only way
for a max grant table version change) should be capable of handling
the max grant table version changing on resume, whereas this resume
happens in the middle of the boot process is a guest decision, and it
should be capable of handling such changes, or else refuse to suspend
during boot. Any resume process will always involve a
re-initialization of the grant table.

If the intent is to make this compatible with transparent live
migration I think there are also other grant table structures that
will need to be migrated in that case, and thus the version would
already be conveyed there.

Thanks, Roger.

