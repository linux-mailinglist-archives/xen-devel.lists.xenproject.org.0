Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A6F4D5152
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 19:43:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288592.489436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSNju-00045X-Oc; Thu, 10 Mar 2022 18:42:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288592.489436; Thu, 10 Mar 2022 18:42:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSNju-00042L-LE; Thu, 10 Mar 2022 18:42:18 +0000
Received: by outflank-mailman (input) for mailman id 288592;
 Thu, 10 Mar 2022 18:42:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XE96=TV=citrix.com=prvs=0613c794d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nSNjs-00042D-Ob
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 18:42:17 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc99944f-a0a1-11ec-8eba-a37418f5ba1a;
 Thu, 10 Mar 2022 19:42:14 +0100 (CET)
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
X-Inumbo-ID: cc99944f-a0a1-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646937734;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=nVI4z8iNBd/kRyEyeVnYFlnzBShQ15AmHDIeSwR6WJ8=;
  b=CbD8JLRr7Y5ZIYxcOTo4cN3Xg1gAgBEaUNktT4G+ZfZSMGsrOCiU1NDn
   UJxiXxqwLzrbyx21vgW7tqTHzTxbtiirrI53i1d0erqRGnzP1BXiMXXgf
   foiISR+R3kGC96KYvt7rj6Zy0TsskK+hiXQL/P4GVHQLGRyhInvQC0bJn
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66347577
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Rb7zMKoZEihWxiUGfBRYfUZjDDheBmLQZRIvgKrLsJaIsI4StFCzt
 garIBnTPKzcYDH9f91/bNng9kIP6MWHz4BlGgE4/ntkRiMTpZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvW4
 Iuq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBBIjyg94HSURkCjByMYl05aT2LX3imJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI5DfVF/s5B7vERL3H/4Rw1zYsnMFeW/3ZY
 qL1bBIxMk+cPEAQZT/7Dro/ksf4ily8TAFx62C5p4Q7yUvxzwJuhe2F3N39JYXRGJQ9clyjj
 mfF4kzwBxgIM9rZxTft2ne0ge/LlCj4cIsXHa+/8LhmjTW71mEVTREbS1a/if24kVKlHcJSL
 VQO/SgjprR081akJvH/VRClpH+PvjYHRsFdVeY97Wml1a788wufQG8eQVZpZNsrvsIybTUv3
 02OmZXlCFRSXKa9ECzHsO3O9HXrZHZTfTRqiTI4oRUt2fzdu7splE/zV8dvHIqHk8bEFTSt6
 mXfxMQhvIk7gckO3qS92FnIhTOwu5TEJjIIChXrsnGNtV0gOtP8D2C8wR2CtKsbct7FJrWUl
 CVcw6CjAPYy4YZhfcBnaMEEB/mX6vmMK1UwanY/TsB6p1xBF5NOFL28AQ2Sxm80aq7omhezO
 Sc/XD+9ArcJYhNGioctP+qM5zwCl/SIKDgcfqm8giBySpZwbhSb2ypleFSd2Wvg+GB1z/1ha
 crCKp30UyZEYUiC8NZQb71NuVPM7npirV4/uLihl0j3uVZgTCL9pUg53KumMblisfLsTPT9+
 NdDLcqaoyizo8WlChQ7BbU7dAhQRVBiXMieg5UOKoarf1o3cEl8WqS56e5wJORYc1F9y76gE
 oeVARQDljISRBTvdG23V5yUQOi2DMgl8i5jY3BE0JTB8yFLXLtDJZw3LvMfVbIm6PZi3bhzS
 fwEcN+HGfNBVnLM/DF1UHU3hNAKmMiD7e5WAxeYXQ==
IronPort-HdrOrdr: A9a23:b8lDlKqjo+nOCF4iIJwVDVAaV5uLL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossSkb6Ky90KnpewK5yXbsibNhc4tKLzOWx1dAS7sSrLcKogeQVBEWk9Q96U
 4OSdkHNDSdNykZsS++2njELz9C+qjGzEnLv5ak854Fd2gDAMsMj3YbNu/YKDwNeOAvP+tiKH
 P23Lshm9PUQwVvUi3NPAhiYwGsnayvqLvWJTo9QzI34giHij2lrJTgFQKD4xsYWzRThZ8/7G
 nsiWXCl+aemsD+7iWZ+37Y7pxQltek4MBEHtawhs8cLSipohq0Zb5mR6aJsFkO0aOSARcR4Z
 zxSiUbToNOAkDqDyeISNzWqlDdOQMVmjvfIJmj8CPeSILCNWkH4oF69Pxkm1PimjsdVZdHof
 92Niuixulq5VmrplWM2/HYEx5tjUa6unwkjKoaiGFeS5IXbPtLoZUY5149KuZLIMvW0vFuLA
 BVNrCW2B+WSyLsU1nJ+m10hNC8VHU6GRmLBkAEp8yOyjBT2HR01VERysATlmoJsMtVcegJ28
 3UdqBz0L1eRM4faqxwQO8HXMusE2TIBRbBKnibL1jrHLwOf3jNt5n06rMo4/zCQu1E8LIi3J
 DaFF9Iv287fEzjTcWIwZ1Q6xjIBH6wWDz8o/surqSReoeMMoYDHRfzPWzGyfHQ0cn3KverL8
 qOBA==
X-IronPort-AV: E=Sophos;i="5.90,171,1643691600"; 
   d="scan'208";a="66347577"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7F+D1rH3FWogvf3f/Jdpgd3txz1AFLfQerq5IBDxrOC+1ZLfWcOdkJjXUP2/4fHagEOqeu2rW+SIFO3P/ctrugFW4ytChoqCg1WIClHxf/l+jjvxaZ0Ekg0E339F8s8hmXtZkr5tz1jIDaEKrrv01zW4yD42xhme5DrKXDs/zRjZCNoYB4JXKl99T8Rq8ziRDrJV+bq+qv+oaO2AKBUdBe9zzvzzjmQ76AExH2j1pwDM0xenF1VBTE8NqYSnhb0Zv8Q1mqJdrTFyJJea+MQ3sLKdSmJrj3Flu5h6ysXUoSHBXtskvGwvPdO+UAAwX8lCZapCq/FWNRT99NsswYWkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVI4z8iNBd/kRyEyeVnYFlnzBShQ15AmHDIeSwR6WJ8=;
 b=es52F4VYSXS4Te8ZYeR23+WM81qBZERa+hB2jiVe3lMQwT5KJCvi3g5MTUTwbHWWcx8O00uA3oe+FZLMoP5mWWV9+OJNQW0R5ZTvLdBPHO1Py8VkyuQrfLNvLpRF090vG20bSz1uGJaup4eU3B6YILBVaIIZV7tiPzSSOEVoA7qGb6vTr3cphb36cUeHgBsadzoOBWLp9khLfX5FtWFIqviQ3MLM/38L5IPhd/b1gmKglE00bo4Zdwj9mIuS7LFanmCXrKsYdfymb5kJyzkRam2wo8spWez0owW1Cnv0g9pec7eBQpkCJ/JOO/bFTwWtovc2nwpA29qSz/hhlIJZgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVI4z8iNBd/kRyEyeVnYFlnzBShQ15AmHDIeSwR6WJ8=;
 b=t87O5OkJcwxyt2xJUJowau/aGTF3TGRam+wvfJPAMnfErVD0cxVT9j5oN93DqwhsoBPhVPSGsu4GM5lqFnkAN/ZJ26GoVmWdY2UU76AYjSLQBvwaY4MEMgO8nPP0otL3kWylHQ/FjVKLbhac8ZRPXbq/z+GjGMN3zhPG9YWkV7Y=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, "Bjoern
 Doebel" <doebel@amazon.de>, Michael Kurth <mku@amazon.de>, Martin Pohlack
	<mpohlack@amazon.de>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/cet: Use dedicated NOP4 for cf_clobber
Thread-Topic: [PATCH] x86/cet: Use dedicated NOP4 for cf_clobber
Thread-Index: AQHYMvUk0XiHSYNleUqdwHU2YHv5TKy1jjMAgAALzQCAAASOAIAAB8IAgANQ2gA=
Date: Thu, 10 Mar 2022 18:42:07 +0000
Message-ID: <d65a64fe-72b1-efc5-1804-8f74aca6d803@citrix.com>
References: <20220308140126.8815-1-andrew.cooper3@citrix.com>
 <18fb4115-94d8-16c2-e39b-1be895e254f4@suse.com>
 <476a25f8-86eb-0df5-b481-fc4cd5ecbb18@citrix.com>
 <83fa28ce-f2db-2451-356f-0dc0266834f2@suse.com>
 <48c6720a-070e-85db-f1c3-448714232946@citrix.com>
In-Reply-To: <48c6720a-070e-85db-f1c3-448714232946@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42e26607-145b-40c3-d67c-08da02c5ada5
x-ms-traffictypediagnostic: MN2PR03MB4605:EE_
x-microsoft-antispam-prvs: <MN2PR03MB46057953D663179EA0B28EF4BA0B9@MN2PR03MB4605.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6a1tOa8b8SBMeWbjZA082/8HVi/83B3fLY5PvOkvyPyWW06A92uXqIHkbKxZrJLIkVWJfGbpKBfvdKTKZQgdZ4W35sJzgZSi8VQSk3yM74G7KRWRk+efdANZQPQUfx5U9B29LHQNugH2s9zE5TzsqEEXZ9BPcJ8m8Y//uu6r62ZBkH9KPWNJVgZoqFp5jA+ezq7bb+yLgqtqf3VJADkgiLyCV4FgczZrJ3gUFDsLjFqGpwlkiPnhV7YOb/RwuYmIYGhIn+GrNaksqcB+2TJJJeACE0Xx3Pes+E7hOt/LoKj12vveOY6xAqpnb/30J01TdDingr2kn0gBqEdtBvF9QSH112l5SnMBtY7UPGnXL+CoZoNXW/O2PrCVFUeOg0N6Q/J/i4j+3wye9Uj3pxXxyS9UQCQubHxI2/HQ5r88APWLKX8d9KtWZ0VOl9n+w0FHjMK4KTz4FwHgi2Y+xxg37wJN2YOW/YezO5NNefxaxAm/iXRMsN55QDQRV+PC+ZLwL+Wm/CjBmYp79mr5Q9l+/bf5mmL8uOxv7m9V+is1exdlzqFq7M5N3sfqIA0THBw7NIzJrV1glOPoj6Ce3BgHPAGLFOMbKe14M34xPuL/v4xVywZ7Jd2nUivHcwRgkRg+AGtyNDAbJZbVC1nuP/3d3T31YehAdQw2HbCO68nGrmmYVqdCIkELaIvbdNJtaAgJCTUK55JvW3HGdKWH1QXTiPykcWpj/i0Ds7b/xEsyxRTktmVeFnAIc5nE/iOKKWMmHZr1fp6ycZJqsf6iOaha0g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(91956017)(64756008)(316002)(6916009)(66946007)(76116006)(66446008)(66556008)(122000001)(54906003)(4326008)(71200400001)(31686004)(5660300002)(83380400001)(38070700005)(8676002)(6486002)(26005)(31696002)(186003)(86362001)(2616005)(8936002)(38100700002)(53546011)(6512007)(82960400001)(36756003)(6506007)(508600001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGNTeXlhbXQyK2k1bTlEcHJITWQ2MEFLYUs1bWRjdlBjQWplQWg5ZEhGSmpP?=
 =?utf-8?B?ZTRxaFV3d2pPVzRFWVZWYUVrY1N5YkIyNDhWMGZibmlRQllxbFdDbWhFaGxz?=
 =?utf-8?B?UXN3d1dPQlo4OWNhRVJkMStmT21NRHdPbGUvaEZnZWRhTFNuSVhTbmZlamVE?=
 =?utf-8?B?SWJhN3F2S295ejRMMXpoSUZpeWhRMFJTbThCdERtZHdzT3IwTUhyMU1vMVhj?=
 =?utf-8?B?TGxxRFBCdk85dERQcWZ2VGsxNkhlZGx4dFU3WG9WZ1dWenNNQy9wejU4UjFz?=
 =?utf-8?B?SmdVNlZxS01RWE9UNWNHLzErWmwzbWFkakx4RWJEL243NTl0cEZlK0RTN29l?=
 =?utf-8?B?ZjYwdzJtYVBzUGhCSzFqNlVyMU1nZnhpMmhaY21oRkF4aTNUK21DY2pCMDQ1?=
 =?utf-8?B?bVRFYzNlT1ZOQmRrNWNGSUxQRjYzRTU1UkZqZDlZVys3Z2xnY2F6ZmQ5cStr?=
 =?utf-8?B?a1g1ZEE1OFJSMWtlOWZXN0lvM3ZSNTJSNTlKcTRkSGlmSkFKRCs2YmFQb0tE?=
 =?utf-8?B?ekNQcHFqekZheDhPYlBCTWJxZmhNNm5mRWlXamJSK2NkY3FNU0NadDE1bC9y?=
 =?utf-8?B?NHdqVEdOY1pETVl1cmczSlU4MzJCbVZnMDNLcjl3SDBzSUw2WVNwSTZYQlY3?=
 =?utf-8?B?aXpZRDJyYzhCV2Q2U0RGTVYzTmw5S2V5emYwang2UXNZT1lhSjUzWklSZzky?=
 =?utf-8?B?Qkw1TW1yaUJYUTI1ZDZWMHkwR0RMQXpNZ1FueUxtd3M3WFJwcHdTUGhXbjN5?=
 =?utf-8?B?cDd2OWFxbGRUZUh3WFhUY2JCajlHQThoK0dSb0VGVVBITHJxNWZDR3h1ZUV6?=
 =?utf-8?B?WmU3ZUhHWmZFTHEwMkEzczM4ZDd6OUVDOG5LUmtrOXhkQmErc1FRQTJLT0FB?=
 =?utf-8?B?anRVN213dWVyeERTb1ZuSU83Y093NG1aaGtKaWtVcFNhLytOZGtwK1ArRmx4?=
 =?utf-8?B?UmtpQzdOcGo3RGFFNTFkV3ZqYkZrb2dqdzdrNWI5ZDF1b1l6eEVtaE9ZYkdC?=
 =?utf-8?B?bUVsT1JZckZhejB5dzErbzJ4NVJlVW5YcTF1RDVDeERtMmNnRXBrR3JHU1pR?=
 =?utf-8?B?NkFacUxIMGVRdU10Ulg1ZndiSG9HbldLbVRTVk5URmIvSVFraEV3MHk5RGlv?=
 =?utf-8?B?UmNyWFFlSEhDZmFPaEdiSzZFT0c2MmRzVjVmNEVyTlNTcEdWajAwb1V3MjlF?=
 =?utf-8?B?REszK0FzSW1PK2tOQjlMbVZsNkRKem14cTY4T29UNG84aWJuVmplVlcwN21R?=
 =?utf-8?B?cCt0Z0JCNm9hYTFLaXJjK1hja1VZajFtQjBvUnltWDJZRU4zM2FhN1lqKzJO?=
 =?utf-8?B?U1FxWitGamFYVmNWMUFITHRQZXdDOEV2Zks1WkxDekFmMHh3a2g0R0xFN1ZK?=
 =?utf-8?B?alRhMWNMRk1MZWRpVU9mcVN0N2MrSDNYd09HcjdxNSsvNmh0Lzc5a2RXbHFx?=
 =?utf-8?B?Q2pqTXRGWFEyeVpIVDY2ME5TUThTbjhGcWpFR2FydGhaV0x6bmhsYzFEV1Vp?=
 =?utf-8?B?N2xqMmRWWUhKRlVTMzBJRG5sT1E4VmF6OWIrR0RLdEx2Zm50TGFVMWd5NEdK?=
 =?utf-8?B?RGFYME1oS2ZlUTd5dldsU045dVR1Z1R5U09paDdMTnFkTzFidS9WQm4yMW16?=
 =?utf-8?B?b00vK3JoaXdDMUViTGYrWkoyK2xHUlV3c1JqVXlxVTlDMXlTZ3F1bWhWcFVa?=
 =?utf-8?B?emI2S3pXVVh0Ym80SFpEWTlKNmN3di96VUVVM1pQRUhrdjgyMEhSbmNNV1l3?=
 =?utf-8?B?MVlvM1hrLzNPcy9uVmcrdERsR1hxUXlsREU5dHpKS3RIUkhBN3FXMXpIVVFv?=
 =?utf-8?B?ckF6S3VpQnJYVUtxTFhiMHNiNUUrK3NHZm9OeU5qTzVxY1Rnc3VLL1d6cmpN?=
 =?utf-8?B?OUlWOEU4OW05VDJUbTl3dXpvRGlrTEtuWnBnN3U2cGp3aHp2SklRRGROenkx?=
 =?utf-8?B?cnJsSVk4aWtRRmhranFIeHFiMkRJZTlMdVFVZWZ2clhEdE9MWVZ4S1YvRXQz?=
 =?utf-8?B?SURGR3Rwd243V2ZpTkpTUFFLeDJ1K0RuNVlzakIrVUZRN3l0b0xHcTNqMTVi?=
 =?utf-8?B?b0JzQlRNektRYmtIOXYzQVA1cit5Z29DWWxqM1FaUlkwYW1UL3JndVhOSE5U?=
 =?utf-8?B?OEQxdi9SazJ4Z3djODZON0hpakFvY2EzWndLdGhyWkh0bHA5WDdJT1plY1Iv?=
 =?utf-8?B?dmxHbWNJOUVUeW5HdEc3QVlHU3FMdG8yWWRIRkF6UnRaYmlxMDZvWlRuY0dP?=
 =?utf-8?B?V1hSc3R5QXp6bEY0b2VyZ1MwT2pnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D2779CEEBF2D8D48B63E09264141ACB5@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e26607-145b-40c3-d67c-08da02c5ada5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 18:42:07.0392
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1CmKdT7VA6/ItLaOH/KvK30o4KOJ+tknoBWWlYmRH6ZIZbZgWdy0K3A+FQnHnE4bOfS9m1zOFUi5jOKkbzmZ3WysXaey5avmG+L/AqW5voQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4605
X-OriginatorOrg: citrix.com

T24gMDgvMDMvMjAyMiAxNjowMywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+Pj4+IC0tLSBhL3hl
bi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9lbmRici5oDQo+Pj4+PiArKysgYi94ZW4vYXJjaC94ODYv
aW5jbHVkZS9hc20vZW5kYnIuaA0KPj4+Pj4gQEAgLTUyLDQgKzUyLDE2IEBAIHN0YXRpYyBpbmxp
bmUgdm9pZCBwbGFjZV9lbmRicjY0KHZvaWQgKnB0cikNCj4+Pj4+ICAgICAgKih1aW50MzJfdCAq
KXB0ciA9IGdlbl9lbmRicjY0KCk7DQo+Pj4+PiAgfQ0KPj4+Pj4gIA0KPj4+Pj4gKy8qDQo+Pj4+
PiArICogQWZ0ZXIgY2xvYmJlcmluZyBFTkRCUjY0LCB3ZSBtYXkgbmVlZCB0byBjb25maXJtIHRo
YXQgdGhlIHNpdGUgdXNlZCB0bw0KPj4+Pj4gKyAqIGNvbnRhaW4gYW4gRU5EQlI2NCBpbnN0cnVj
dGlvbi4gIFVzZSBhbiBlbmNvZGluZyB3aGljaCBpc24ndCB0aGUgZGVmYXVsdA0KPj4+Pj4gKyAq
IFA2X05PUDQuDQo+Pj4+PiArICovDQo+Pj4+PiArI2RlZmluZSBFTkRCUjY0X1BPSVNPTiAiXHg2
Nlx4MGZceDFmXHgwMCIgLyogb3NwIG5vcGwgKCVyYXgpICovDQo+Pj4+IEluIGNhc2UgdGhpcyBy
ZW1haW5zIGFzIGlzIC0gZGlkIHlvdSBtZWFuICJvcHN6IiBpbnN0ZWFkIG9mICJvc3AiPw0KPj4+
PiBCdXQgdGhpcyByZWFsbHkgaXMgIm5vcHcgKCVyYXgpIiBhbnl3YXkuDQo+Pj4gT2gsIG9zcCBp
cyB0aGUgbmFzbSBuYW1lLsKgIEknbGwgc3dpdGNoIHRvIG5vcHcuDQo+PiBSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBUaGFua3MuDQoNCkl0IGRvZXMgb2Nj
dXIgdG8gbWUgdGhhdCB3ZSBjYW4gZXh0ZW5kIGNoZWNrLWVuZGJyLnNoIGZvciB0aGlzLg0KDQpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2luZGlyZWN0LXRodW5rLlMgYi94ZW4vYXJjaC94ODYv
aW5kaXJlY3QtdGh1bmsuUw0KaW5kZXggN2NjMjJkYTBlZjkzLi4zYmFhZjdhYjQ5ODMgMTAwNjQ0
DQotLS0gYS94ZW4vYXJjaC94ODYvaW5kaXJlY3QtdGh1bmsuUw0KKysrIGIveGVuL2FyY2gveDg2
L2luZGlyZWN0LXRodW5rLlMNCkBAIC0zOCw2ICszOCw3IEBADQrCoMKgwqDCoMKgwqDCoMKgIC5z
ZWN0aW9uIC50ZXh0Ll9feDg2X2luZGlyZWN0X3RodW5rX1xyZWcsICJheCIsIEBwcm9nYml0cw0K
wqANCsKgRU5UUlkoX194ODZfaW5kaXJlY3RfdGh1bmtfXHJlZykNCivCoMKgwqDCoMKgwqAgbm9w
dyAoJXJheCkNCsKgwqDCoMKgwqDCoMKgwqAgQUxURVJOQVRJVkVfMiBfX3N0cmluZ2lmeShJTkRf
VEhVTktfUkVUUE9MSU5FIFxyZWcpLMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCsKgwqDC
oMKgwqDCoMKgwqAgX19zdHJpbmdpZnkoSU5EX1RIVU5LX0xGRU5DRSBccmVnKSwgWDg2X0ZFQVRV
UkVfSU5EX1RIVU5LX0xGRU5DRSwgXA0KwqDCoMKgwqDCoMKgwqDCoCBfX3N0cmluZ2lmeShJTkRf
VEhVTktfSk1QIFxyZWcpLMKgwqDCoCBYODZfRkVBVFVSRV9JTkRfVEhVTktfSk1QDQpkaWZmIC0t
Z2l0IGEveGVuL3Rvb2xzL2NoZWNrLWVuZGJyLnNoIGIveGVuL3Rvb2xzL2NoZWNrLWVuZGJyLnNo
DQppbmRleCA5Nzk5YzQ1MWExOGQuLjY1MmFjOGQwYjk4MyAxMDA3NTUNCi0tLSBhL3hlbi90b29s
cy9jaGVjay1lbmRici5zaA0KKysrIGIveGVuL3Rvb2xzL2NoZWNrLWVuZGJyLnNoDQpAQCAtNjcs
NyArNjcsNyBAQCBldmFsICQoJHtPQkpEVU1QfSAtaiAudGV4dCAkMSAtaCB8DQrCoCR7T0JKQ09Q
WX0gLWogLnRleHQgJDEgLU8gYmluYXJ5ICRURVhUX0JJTg0KwqBpZiAkcGVybF9yZQ0KwqB0aGVu
DQotwqDCoMKgIExDX0FMTD1DIGdyZXAgLWFvYlAgJ1wzNjNcMTdcMzZcMzcyJyAkVEVYVF9CSU4N
CivCoMKgwqAgTENfQUxMPUMgZ3JlcCAtYW9iUCAnXDM2M1wxN1wzNlwzNzJ8XHg2Nlx4MGZceDFm
XHgwMCcgJFRFWFRfQklODQrCoGVsc2UNCsKgwqDCoMKgIGdyZXAgLWFvYiAiJChwcmludGYgJ1wz
NjNcMTdcMzZcMzcyJykiICRURVhUX0JJTg0KwqBmaSB8IGF3ayAtRic6JyAne3ByaW50ZiAiJXMl
eFxuIiwgIickdm1hX2hpJyIsIGludCgweCckdm1hX2xvJykgKyAkMX0nDQo+ICRBTEwNCg0KeWll
bGRzOg0KDQpjaGVjay1lbmRici5zaCB4ZW4tc3ltcyBGYWlsOiBGb3VuZCAxNSBlbWJlZGRlZCBl
bmRicjY0IGluc3RydWN0aW9ucw0KMHhmZmZmODJkMDQwMzc3ZjAwOiBfX3g4Nl9pbmRpcmVjdF90
aHVua19yYXggYXQNCi9sb2NhbC94ZW4uZ2l0L3hlbi9hcmNoL3g4Ni9pbmRpcmVjdC10aHVuay5T
OjU1DQoweGZmZmY4MmQwNDAzNzdmMjA6IF9feDg2X2luZGlyZWN0X3RodW5rX3JjeCBhdCA/Pzo/
DQoweGZmZmY4MmQwNDAzNzdmNDA6IF9feDg2X2luZGlyZWN0X3RodW5rX3JkeCBhdCA/Pzo/DQow
eGZmZmY4MmQwNDAzNzdmNjA6IF9feDg2X2luZGlyZWN0X3RodW5rX3JieCBhdCA/Pzo/DQoweGZm
ZmY4MmQwNDAzNzdmODA6IF9feDg2X2luZGlyZWN0X3RodW5rX3JicCBhdCA/Pzo/DQoweGZmZmY4
MmQwNDAzNzdmYTA6IF9feDg2X2luZGlyZWN0X3RodW5rX3JzaSBhdCA/Pzo/DQoweGZmZmY4MmQw
NDAzNzdmYzA6IF9feDg2X2luZGlyZWN0X3RodW5rX3JkaSBhdCA/Pzo/DQoweGZmZmY4MmQwNDAz
NzdmZTA6IF9feDg2X2luZGlyZWN0X3RodW5rX3I4IGF0ID8/Oj8NCjB4ZmZmZjgyZDA0MDM3ODAw
MDogX194ODZfaW5kaXJlY3RfdGh1bmtfcjkgYXQgPz86Pw0KMHhmZmZmODJkMDQwMzc4MDIwOiBf
X3g4Nl9pbmRpcmVjdF90aHVua19yMTAgYXQgPz86Pw0KMHhmZmZmODJkMDQwMzc4MDQwOiBfX3g4
Nl9pbmRpcmVjdF90aHVua19yMTEgYXQgPz86Pw0KMHhmZmZmODJkMDQwMzc4MDYwOiBfX3g4Nl9p
bmRpcmVjdF90aHVua19yMTIgYXQgPz86Pw0KMHhmZmZmODJkMDQwMzc4MDgwOiBfX3g4Nl9pbmRp
cmVjdF90aHVua19yMTMgYXQgPz86Pw0KMHhmZmZmODJkMDQwMzc4MGEwOiBfX3g4Nl9pbmRpcmVj
dF90aHVua19yMTQgYXQgPz86Pw0KMHhmZmZmODJkMDQwMzc4MGMwOiBfX3g4Nl9pbmRpcmVjdF90
aHVua19yMTUgYXQgPz86Pw0KLi4uDQpjaGVjay1lbmRici5zaCB4ZW4uZWZpIEZhaWw6IEZvdW5k
IDE1IGVtYmVkZGVkIGVuZGJyNjQgaW5zdHJ1Y3Rpb25zDQoweGZmZmY4MmQwNDAzNzdmMDA6ID8/
IGF0IC9sb2NhbC94ZW4uZ2l0L3hlbi9hcmNoL3g4Ni9pbmRpcmVjdC10aHVuay5TOjU1DQoweGZm
ZmY4MmQwNDAzNzdmMjA6ID8/IGF0IGhlYWQubzo/DQoweGZmZmY4MmQwNDAzNzdmNDA6ID8/IGF0
IGhlYWQubzo/DQoweGZmZmY4MmQwNDAzNzdmNjA6ID8/IGF0IGhlYWQubzo/DQoweGZmZmY4MmQw
NDAzNzdmODA6ID8/IGF0IGhlYWQubzo/DQoweGZmZmY4MmQwNDAzNzdmYTA6ID8/IGF0IGhlYWQu
bzo/DQoweGZmZmY4MmQwNDAzNzdmYzA6ID8/IGF0IGhlYWQubzo/DQoweGZmZmY4MmQwNDAzNzdm
ZTA6ID8/IGF0IGhlYWQubzo/DQoweGZmZmY4MmQwNDAzNzgwMDA6ID8/IGF0IGhlYWQubzo/DQow
eGZmZmY4MmQwNDAzNzgwMjA6ID8/IGF0IGhlYWQubzo/DQoweGZmZmY4MmQwNDAzNzgwNDA6ID8/
IGF0IGhlYWQubzo/DQoweGZmZmY4MmQwNDAzNzgwNjA6ID8/IGF0IGhlYWQubzo/DQoweGZmZmY4
MmQwNDAzNzgwODA6ID8/IGF0IGhlYWQubzo/DQoweGZmZmY4MmQwNDAzNzgwYTA6ID8/IGF0IGhl
YWQubzo/DQoweGZmZmY4MmQwNDAzNzgwYzA6ID8/IGF0IGhlYWQubzo/DQoNCk9idmlvdXNseSB0
aGUgY2hhbmdlcyB0byBjaGVjay1lbmRiciB3YW50IGNsZWFuaW5nIHVwLCBidXQgSSB0aGluayBp
dCdzDQplbnRpcmVseSB3aXRoaW4gc2NvcGUgdG8gY2hlY2sgZm9yIEVOREJSNjRfUE9JU09OIHRv
bywgYW5kIHdlIGNhbiBkbyBpdA0Kd2l0aG91dCBhZGRpbmcgYW4gZXh0cmEgcGFzcy7CoCBXb3Vs
ZCB5b3UgYmUgaGFwcGllciB3aXRoIHRoaXMgY2hlY2sgYWRkZWQ/DQoNCkJ1dCB3ZSBhbHNvIGhh
dmUgc29tZSBjbGVhciBlcnJvcnMgd2l0aCBkZWJ1ZyBzeW1ib2xzLsKgIEl0J3MgcGVyaGFwcyBu
b3QNCnRlcnJpYmx5IHN1cnByaXNpbmcgdGhhdCBpcnAvZW5kciBvbmx5IGdldHMgZmlsZS9saW5l
IGZvciB0aGUgZmlyc3QNCmluc3RhbmNlLCBhbmQgYXQgbGVhc3QgRUxGIG1hbmFnZSB0byBnZXQg
dGhlIGZ1bmN0aW9uIG5hbWUgcmlnaHQsIGJ1dA0KRUZJIGlzIGEgbWVzcyBhbmQgbWFuYWdlcyB0
byBnZXQgdGhlIHdyb25nIGZpbGUuwqAgQW55IGlkZWEgaG93IHRvIGdldA0KcmF0aGVyIGxlc3Mg
bm9uc2Vuc2Ugb3V0IG9mIHRoZSBkZWJ1ZyBzeW1ib2xzPw0KDQp+QW5kcmV3DQo=

