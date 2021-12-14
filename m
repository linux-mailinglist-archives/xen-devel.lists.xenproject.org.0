Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E484740C2
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 11:48:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246580.425243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx5M0-0006N5-Va; Tue, 14 Dec 2021 10:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246580.425243; Tue, 14 Dec 2021 10:48:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx5M0-0006L4-S6; Tue, 14 Dec 2021 10:48:16 +0000
Received: by outflank-mailman (input) for mailman id 246580;
 Tue, 14 Dec 2021 10:48:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xzzU=Q7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mx5Lz-0006Kw-At
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 10:48:15 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54fc08f8-5ccb-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 11:48:13 +0100 (CET)
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
X-Inumbo-ID: 54fc08f8-5ccb-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639478892;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=BuHTTxBxf2AGi62V3tC+LLu8BM7QZz4B0jA19pQPeTs=;
  b=JitUvwB8Rp0f3XP2/7JDZmX6M3hgXhnS5B3duDNzF+VXK+FA+xaunAK5
   QbAwDBbA8lQLPVvS0PUsckWr9zBHgNQjoGTTNlx8Ve2fLND16b/Mg61tT
   RqCOAjE1AQ5PyR8Kq6J+6SM6aUilUpSjmoLzbFp8lK9CgWPhVASyBRjVC
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: IdhPWkE1m2RWgaZTLNFlw8FD2mHIU+tquF9ZMval0BYd9Pv8wP/yjYEfqpuMEkIju4IYcV+f8f
 DNsKfCP9s/PCm+x0IkKrYqnsCOpaI+A47XBjZ+Ny3ssNQSps1NfKuVlWX/vRZ5v5QaekmkE2iA
 VxaAIvEiDxbFVPWzu54AlSmHXOgAk8CGjslpSGaxYQ8ukeNY7xvX6KvamBP7BEaNdt4vVHxqqs
 gqSaJUdOYBk7z/JmXoejFBCxyph3TcMeIy8gMZjoQUbqC55rnyQCKivV5+lugWMRJ1sBq5l3Y1
 3eGx5PE01QOYXa17qm23H/UY
X-SBRS: 5.1
X-MesageID: 59982551
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:a5wQcqM3xBTWop7vrR16kMFynXyQoLVcMsEvi/4bfWQNrUoqgmEBn
 2pJXj3Sa6mKMWOjfownPY+29BwGuZXRxtBlGQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En5400s/w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYowygs/Uh8
 c4djNu9ezoQIKfeu8kZTDANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/ibtI8CgWpp7ixINd39R
 MgdaRM1Vgr/eyd0NllPDrxvwej90xETdBUH8QnI9MLb+VP70whZwLXrdt3PdbSiVchT20qVu
 G/C12D4GQ0BcsySzyKf9XChjfOJmjn0MKoQHrCl8v9hgHWI23ceThYRUDOGTeKR0xDkHYgFc
 gpNp3Ro/fNaGFGXosfVZjSUhS69pU4lHNdiLtQk4hOu567LylPMboQbdQJpZNsjvc4wYDUl0
 F6Vgt/kbQBSXK2ppWG1renN827rUcQBBSpbPHJfE1NZizX2iNhr1kqnczp1LEKiYjQZ8xnUy
 ivCkiUxjq57YSUjh/TipgCvb95BS/H0ou8JCuf/AjLNAuBRPtfNi2mUBb7zt6kowGGxFAbpg
 ZT8s5LChN3i9LnU/MB3fM0DHauy+9GOOyDGjFhkEvEJrmr2qiL5JNgNvm4vdC+F1/ronxezP
 yc/XisLu/du0IaCN/crM+pd9ex0pUQfKTgVfq+NNYcfCnSAXASG4DtvdSatM5PFyyARfVUEE
 c7DK66EVC9CYYw+lWbeb7pMidcDm3FlrUuOFM+T8vhS+efHDJJjYexeawXmgyFQxP7snTg5B
 P4DbZbXkEsGD7WlCsQVmKZKRW03wbEALcmeg+Rcd/KZIxogH2ckCvTLxqgmdZAjlKNQ/tokN
 FnnMqOB4Fag13DBNyuQbXVvNOHmUZpl9CppNi0wJ1e4nXMkZN/3vqsYcpI2e5gh9fBikqEoH
 6VUJZ3YD6QdUCnD9hQccYL58N5oeiO0iF/cJCGiejU+IcJtHlSb5t/+cwLz3yASFS7r59Amq
 rit21qDE5oOTghvFujMb/erww/jtHQRgrsqDUDJPsNSaAPn940zc379ifo+IsctLxTfx2TFi
 1bKUElA/eSU+t076tjEg6yAvryFKeomExoIBXTf4Ja3KTLeojipz7hfXbvaZjvaTm71pvmvP
 L0H0/HmPfQbt19WqI4gQa1zxKcz6taz9b9XygNoQCfCY1ixU+4yJ3CH2Y9Et7FXx68fsgyzA
 xrd9t5fMLSPGcXkDF9Oe1Z1MrXdjakZymvI8PA4AETm/ysmrrOIXHJbMwSIlCEAfqB+N5kow
 Lt5tcMbg+BlZsHG7jpSYvhoylmx
IronPort-HdrOrdr: A9a23:sB4kNa0nOeqn7DA5al8h7wqjBGokLtp133Aq2lEZdPUMSL38qy
 iv9M536faGskd0ZJhAo6H7BEDuexLhHPJOirX5eI3SPjUO21HYUb2Kj7GD/9SIIUSXygce79
 YCT0EUMrHN5C1B4/oSlzPWLz9P+rO6GeuT9IDjJj9WPGdXg/8M1XYBNu5Zf3cGPzWuK6BJbK
 ah2g==
X-IronPort-AV: E=Sophos;i="5.88,205,1635220800"; 
   d="scan'208";a="59982551"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UO7mZqPc+Vd+a2exR3ujj+nteqJFKhPe5BkdpLVpEnCzGXX1hMHpEUbv0++5bNWDTPnBzXg4jZm05qAAyWFu6pJhDpPWJ+Pp9xCTLdcl1NXS8qynbN4IhVA5mOT/7xmurFzpkOxphmMDin/1FrqFHd2Q5/sAKKmVnb0JoodgtaGt/KLt40MxnjR0SC0B9IbGMSubrsLFeDcAGncWQ48M/qOm7a1tc9VMwSzvs4T6LcuQ62Qt1PWicBvDdnqEGcyJVnTxfTNbudpYyQ/p+YPfoH8DL0ViHcmNtI81KaDsGhFJ7FnkPHA1y4exFb4sFonWqX20Yx3duYVYY8vZzo0/pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLfnLl9EECw5E4w32OxKKkKw3mpoSaT52z724tt1lkU=;
 b=DBhJM3BLWnZJsiLYX83p1qv/58fN3KO12DfklJ+S/V6t/S9qjqtrundoZQMEXQD9ZLvvYxpnqtzzdyZ2lBe7cQHp7OI2JWgFB+Mr4N9w/jjjDVucKlMSMjIgbcICXK8LmF3AL6FC724bERQF2D32Jc9C/312R2PtvZcRV068Ml0aQ4ZH+oHasAjpjD2/LZMU5lXbmhXaJMUgFdM2SqWbHSe7gLaLUEzt5DYg4hRYbvYT1AR4VYjBR9fXWwfgI7IgeVhatvAw3+6MW2kf96Rgff9FXdwXxgNHLYtdvMBBbLc7YaQSHLQsgg5sVdMdVneIbivvZ6xw8q98nphANqiaIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLfnLl9EECw5E4w32OxKKkKw3mpoSaT52z724tt1lkU=;
 b=sPEq8f8xS/i5a00YdKfwagVHxc7mjDZzLWdqVPqIpbCOjLi2XENA0Gw/1J2uYqc0BINLG8l3mKTt4YyEV2YdQ2JsGYDcAz8pX/tSnR7Zl/iIaKVWnSMMeXWYb9wAFhYlOMV4t/PhTGaVQiPMtJ+z6SEsB8zbRfBdENEZMpiAS8s=
Date: Tue, 14 Dec 2021 11:48:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5] x86/PVH: improve Dom0 memory size calculation
Message-ID: <Ybh2YJTsGuEsLN8/@Air-de-Roger>
References: <5d675c6c-8cb1-f218-75d7-cb13f8b2e669@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5d675c6c-8cb1-f218-75d7-cb13f8b2e669@suse.com>
X-ClientProxiedBy: MR2P264CA0129.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5bafc02-c7cf-4ea4-b021-08d9beef371e
X-MS-TrafficTypeDiagnostic: DS7PR03MB5590:EE_
X-Microsoft-Antispam-PRVS: <DS7PR03MB5590358B85CB2F5064FD34DD8F759@DS7PR03MB5590.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jOATrXtDAUJm8FzZl77ROkS8mbqHQH1q7Fm3j+PtOr9G4B2buC3Fmrek+zbEsXosBS4NcGUsIi6bfvcg1pe+GfPhZeL8+/AdSoQJN6zNtzd03RSZbSzJ9FDfEgUmTI/QiYsylEDgfAYidig+L/lnzDtnHtKFbzQT/A0pjSTug7UVobVB/kBhJJgWTGevSMrnpgEkWNwmGHE/8im/wdnCIRhAX/1cvj+u5a2LORV0EvZHM8mdfb71gGu/J1UNQv52YlpjZAfbyK0UFodnSFf7Rp2vuMfkY33E2XIQbIpHs9wDfJk29IeGtGFgN1U1HonKAXcXqNV5d8AAxTf0qaNmsWUikYdf7Pq7bX4SCk8warW69n6Mbi0FeqKAPZq6wjfe//Te1zIAxyO5c07jAWthX7nUrK9RYM3rQRFi9hzqduDyCHHRtaMxtqPjkyPAveaVDUgbhiZcLYA1soku9F5LaXOzxAhB583kcFtll+P3Kf8IVzRuIWZzEXtdbxh5p0kJnGn6rEnItd3+dUxbYTBjMiappmM5B/JqgoimCSQAj7xmlJIPfYkwBgwHarCFibh2fwjOqXCb6vGwfkOe+fhdiMq2YAy4PD5icStlsUxTzVaTl0xn3FycXAatk34jjHFURMivizh5Lh5kRc6kAjtw1IxGLkuOn04l+cq/iVqvckeWtyUGRsdf4RWF88yHeQ+GwTi+BEqvC+k4/tbgzHm0iA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(66476007)(85182001)(6916009)(186003)(6506007)(9686003)(5660300002)(6486002)(316002)(66556008)(6512007)(66946007)(38100700002)(26005)(2906002)(508600001)(86362001)(83380400001)(4326008)(6666004)(54906003)(82960400001)(8676002)(8936002)(33716001)(25903002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnM1V3lMd3djNjZDREpULzhMNDRLaTI5N3Z0bmpvTE1qdW5YRDhZQUd5UDlC?=
 =?utf-8?B?Q1MwdEZDUTYweW9SRkVyMngyRmViM1J6YnFIOXZuY1RLMjMwMnBKaFpGZFRs?=
 =?utf-8?B?TlJsRk16KzN3NlhLUFE1Um9VSm5FMm9BR2RvaWYyeWZZUjBUS1JGNS95NDdJ?=
 =?utf-8?B?dmd6QWZzWDNrU3o2aDNmT3ZDd2lJOTg2Q21keXZNeXZ4ejhVL09IckN6MUQ3?=
 =?utf-8?B?REhLNC9JMTl6RW5ITmZrM2kxNFllV0tVR0c5V1RRaEYvRldiSGwzUlU1ZmFZ?=
 =?utf-8?B?UVY1dUdCK1RIZkh5RDhOQW9sUXliaHltQzZxVzRpa1BkdGk2U1FzY2FsS3FM?=
 =?utf-8?B?ZnBVR1BocFR5bm1DL0ZuaTFWNFlGOFM0UDhSMm1VRW05d1V3blNvcUEzaWtZ?=
 =?utf-8?B?OWJwWXdNYTdOMDI4emhyVFc2U2s1UTc3M1pocVozY3ltcHcwbkUxYWxrNG11?=
 =?utf-8?B?WFU5MURDQm1iVnJJY0lSQzBpOUdhQzRVMkxYMnBTcnRWdmVkMytXWk9QT0VK?=
 =?utf-8?B?SFlpSHVVMy90QVNPeGVIaDNURkN5RExaSUh0S3NSb1BpbXVXWEphTFVSaGJL?=
 =?utf-8?B?MGx0NGZHeUJWdFZYdmhySkl5U250V2VhYTFqb0VVMXFHbmpNcnkyQVlBaVZz?=
 =?utf-8?B?c3JoaWZLdWY4TktYeU9PeklzTUoyS3o5ZGVIbSs2Y0NIRjE5RVhEUzQ1emd6?=
 =?utf-8?B?MC9jaGVuQldZSld6d2svOTFNUGE1UHo0ZFlYakhGdXk2VTk1aDhRdTF4Qitj?=
 =?utf-8?B?Skt3U1lUVnFDcUtnSWhTUlZyeHF1cHRCaTN1b3owMXJieDdLNVJ6Y0o1bkdk?=
 =?utf-8?B?bVRHUVY1bWNsdWdBc0E0MDNQdE50UTRpQnV2SlZ1OGpVSmtDZU5Jd3hYLzBR?=
 =?utf-8?B?MXJyNEZlejMvaE1JbGxuQUNKNjZDa2YxakNFVkZHVHdLTnRYekRRQll1NS9N?=
 =?utf-8?B?ZXBWNWN2cGpBcWxiTGgvVjZsZXorSitDaDdXdGxFM1QxZEJYMnVFVkRiMnBS?=
 =?utf-8?B?QkxocGVReEhiQ0c1dkw1cy9HY3VTbmFGMERZeFVoeGZOV25ZNkpXcHFOcHBP?=
 =?utf-8?B?NmV4dVhjRXVGRnhxOXRwMWg0UzNLZ2RrTldLSHZGbU1WS0tDTjVNZmxsM3dq?=
 =?utf-8?B?dzRjWGJyWXQ3dEFlZktVVHdxOFNwakdCNVN2VDFOWWZNYjBETTA4bW5HbUxE?=
 =?utf-8?B?c29BOWZtU0JNK1JiTTh2bUI0Zk9kbUZWLzN1bzlsZjIvNk1ucy90bXlkUjlT?=
 =?utf-8?B?Yk5PVUdoVmdGYVhhUWNKM3ZJWnA3dTQ5ZW5tOHdVc1lnVElucXB4RHJ1Rk14?=
 =?utf-8?B?OXdjcnkzRnNGeCtsanV3REhhWXZaeWtyODUwVGdIejZBOTg3UnI1QVJ4TU9H?=
 =?utf-8?B?NzNUVjMvS3dCMjVhQysvVnRVajV5bi9rdWdmMzdkZnJHWmdzQkVOc1FicE55?=
 =?utf-8?B?VTlHT3hEZmhEd2l3czhvSWkxV0wwVTFHVnhpOGFLdVFVUFZkWklQODRmQS9T?=
 =?utf-8?B?aDFMZ3ZORHVyZ0V5VENyblVQL2p6S016VzZETmdXaWdNeDZqcUtDbFI3clBK?=
 =?utf-8?B?cW1qamY3cjJpTjE4TjlNVWpXTHpGZldnTGRUNWlXa2kzdTZyemtvckdCRkRo?=
 =?utf-8?B?N0ladTNmRGtLRjZ6VjZ3RWxFNWdUTHAxbmFmU2F2TmFKaS9OV0ZoN0JWblUr?=
 =?utf-8?B?amhYbDU3aGZvVzhOV2JBZlZpVHBLaGJLcVpXZjdRNlJ1a3VUeDFXdDRXbXU1?=
 =?utf-8?B?SnZHVW1iMjdqOFY4Q1Y5WldJcWdNWWNxM1hIQkdNd3RPbng2azBUT1JqT0xY?=
 =?utf-8?B?cFA5eEtwZXE0dlFjNXl2bm95YVduNVlRaElsTjgrUkhkRmkwSE5vMzUxTm1p?=
 =?utf-8?B?TTRiVkxyUjJnNFRIdkw1bWJpSzMrWktFS0tJZWFaejgycldINlNwdUt5Y29R?=
 =?utf-8?B?Zi84UFlrSlkrYWUzUlcyZ3I5eFFzdlV5NXRFc1lxb3d0SFphbkNBcUhtNlJ2?=
 =?utf-8?B?YzMzZGNsOVJJVlVDVnA4ekpOcUgvUitSOWY4TXBodG9NMzZpc0hQSDBDNG5N?=
 =?utf-8?B?ZzAwRklFNFVqcEdsdGxKa0ZUYXFsS0EyYVlqMDZVSmpIMzFTSUFvb3Q4Nitr?=
 =?utf-8?B?d25JL1pmTU5sbHpQUXBnVGg4OWpXL2RqQ0JPWW1RckpWZVM4NVU3M2hmTmZN?=
 =?utf-8?Q?hduyXy2xwYq86hzbLqnOLjg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5bafc02-c7cf-4ea4-b021-08d9beef371e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 10:48:08.3055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bwV44VOJw9X+97ZVPjr9fu5v7uFYYnB0O9PMwxL/IRqf+bSXcQ/QD0KpaFRXtOvIkL/c5viBd4nbDWv9eiV4HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5590
X-OriginatorOrg: citrix.com

On Fri, Dec 03, 2021 at 11:27:20AM +0100, Jan Beulich wrote:
> Assuming that the accounting for IOMMU page tables will also take care
> of the P2M needs was wrong: dom0_paging_pages() can determine a far
> higher value, high enough for the system to run out of memory while
> setting up Dom0. Hence in the case of shared page tables the larger of
> the two values needs to be used (without shared page tables the sum of
> both continues to be applicable).
> 
> To not further complicate the logic, eliminate the up-to-2-iteration
> loop in favor of doing a few calculations twice (before and after
> calling dom0_paging_pages()). While this will lead to slightly too high
> a value in "cpu_pages", it is deemed better to account a few too many
> than a few too little.
> 
> As a result the calculation is now deemed good enough to no longer
> warrant the warning message, which therefore gets dropped.
> 
> Also uniformly use paging_mode_enabled(), not is_hvm_domain().
> 
> While there also account for two further aspects in the PV case: With
> "iommu=dom0-passthrough" no IOMMU page tables would get allocated, so
> none need accounting for. And if shadow mode is to be enabled (including
> only potentially, because of "pv-l1tf=dom0"), setting aside a suitable
> amount for the P2M pool to get populated is also necessary (i.e. similar
> to the non-shared-page-tables case of PVH).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

