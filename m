Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D634D2D33
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 11:36:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287693.487804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRtgG-0008QS-56; Wed, 09 Mar 2022 10:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287693.487804; Wed, 09 Mar 2022 10:36:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRtgG-0008NY-1q; Wed, 09 Mar 2022 10:36:32 +0000
Received: by outflank-mailman (input) for mailman id 287693;
 Wed, 09 Mar 2022 10:36:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QNbA=TU=citrix.com=prvs=060736ad3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRtgE-0008NO-9z
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 10:36:30 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c60ba64d-9f94-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 11:36:28 +0100 (CET)
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
X-Inumbo-ID: c60ba64d-9f94-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646822188;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=CsPJlfO/GHIJxoKbH8IOB0uUxTOThLRqur4WRoxVZKQ=;
  b=A0mlrhrj3It4LG7rOZ8EVsNCP7L2UXbHKKRjXark1Cnz2N/ORwYVigR5
   2pArue2ZYsBrABADl9TA9f1nKt9TuPu47/DiftLWe1B4gX7gEgp5FjxH8
   HiqtiZ36W1NZLswppn/uMzGFuvz6GZTFnMBucv++buyO4onhicAK7e6dU
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65799152
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:14z7EKwmwsPXlrgl6hV6t+eCxirEfRIJ4+MujC+fZmUNrF6WrkVWm
 zFKXGDUb/aPYmf3L9lzOdiz8E8H6JHdzdIwSwBs/CAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYz2YnhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpljLqsQ18nI/X1yMcDFD5DNTxiLbx40eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2J0RTKeHO
 pBxhTxHVDDOSQZMGG0uUYMfw+vrpGavVTBSpwfAzUYwyzeKl1EguFT3C/LrfdiNSdRQj1yvj
 GvM9GTkATkXLNWajzGC9xqEnfTTlCn2XIYTEryQ9fNwhlCXgGsJB3U+X1ahveOwjEL4XttFM
 lEV4QInt610/0uuJvH+UgO5pjiYvxcac9tWD+A+rgqKz8L84RufQG4NTTdDadkvnM4wWTEuk
 FSOmrvBGjhHoLCTD3WH+d+8vT60fCQYM2IGTSsFVhcepcnuppkpiRDCRcolF7S65vX3Fiv32
 CuitzUlivMYistj/6em+VHKhRq8q56PSRQ6ji3VVG+46gJyZKa+epelr1Pc6J59wJ2xFwfb+
 iJewo7Hsb5IXcrleDGxrPslJZe17a6LLWXl0X1xWL460Smx62+dVNUFiN1hH3tBPsEBcD7vR
 UbcvwJN+ZNeVEeXgb9Lj5GZUJpzk/W5fTjxfrWNN4cVPMAtHOOS1Hw2PSatM3bRfF/AeE3VE
 bOSao6SAHkTEsyLJxLmFr5GgdfHKs3TrF4/pKwXLTz6idJyh1bPEN/p1WdiiMhjsstoRy2Pr
 75i2zOikUk3bQEHSnC/HXQvBV4LN2MnIpv9ttZacOWOSiI/Rj1/VKGNm+N9J9A790iwqgsu1
 ivtMqO/4ACj7UAr1C3QMiwzAF8Rdc0XQY0H0dwEYg/zhilLjXeH56YDbZonFYTLB8Q4pcOYu
 8ItIp3aatwWE2yv021EMfHV8dwzHDz21FnmF3f0P1ACk2tIGlWhFinMJVC0qkHjz0Of6KMDn
 lFX/liCEMRZGFg6Upq+hTDG5wrZgEXxUdlaBiPgCtJSZF/t4M5tLSnwheUwOMYCNVPIwT7y6
 upcKU5wSTXly2PtzOT0uA==
IronPort-HdrOrdr: A9a23:jeVSTKvhQGsEiWskHsgY2gwI7skClYMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtVD4b7LfCZHZKTBkXCF+r8bqbHtmsDY5ts2jU0dNT2CA5sQkDuRYTzrdHGeKjM2YabQQ/
 Gnl7Z6TnebCDwqhoPRPAh2Y8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX2y2oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iGnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJMw4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAkqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocbTbqjVQGZgoBT+q3tYpxqdS32AXTq+/blngS+pUoJgXfxn6ck7zU9HJFUcegx2w
 2LCNUsqFh0dL5nUUtMPpZxfSKJMB2/ffvtChPlHb21LtBPB5ryw6SHlYndotvaPKA18A==
X-IronPort-AV: E=Sophos;i="5.90,167,1643691600"; 
   d="scan'208";a="65799152"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0zX7E/ChRvWqJJDcAqDQINf3QSCtgO/vC90Ru9qYUbs/Pjd3+XEbik3AjwImCxj4Su6CY75gJZeuJsH4w44MYjQ4fjw6wcZ4YVbcY4CvSXz6+mCNQwJRRjIasN947cZb43cAlMk8CGfhnwx8Fwwu8jTHcX3XmvClUzixgeLVgCbtW6grJ3seOR3kMlGqoHNYAaBA0dNq5VpKdWFQid3Y0PlWn+2Lbw/SBW0Fl+PmLvca8ZQODliUXoQauncpKqOuW0dHV6tb60daBDXuA06xNp2C1k5I74b7szKKEFCEI2xOdkEUfNH3jE4O6k91BQK+bC6tjYY3HkkXK8o2hAJUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7pJyileA/tpK9ap+hGFdWh0M1RALSvNlLeh7PsR5uk=;
 b=Q0hxSENvBlLfdwD3cVVV0+akiCykZypJwncs5bbtnDu4HfBlEaYsIRC321NA6de1u2ezzcOyYIFL8DtfwZa54Hl9SHZgLppSGFO61YX6HVSjlvjCR/9ZCzNXOE81hW0FVVFIebW90glH5R5eG8UbmT0yl0yecmDY4XwqNISQJ2rwK2UZcHe5xyXjUQp/HDJWuntAX+y6UUoHr8hlmWhfE+GD0OUhy2AgoHhx8P/pMPscRg+q7FJlwYxhsP7oGb9axCnFWr+dqLH7mmIe2cfye/hkxtvOwfkCagkx4e3a1N3EposTHnFHFbfSNZRQTkv6zmMHIQp2juZ8tcZ1jrxlkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7pJyileA/tpK9ap+hGFdWh0M1RALSvNlLeh7PsR5uk=;
 b=H6I+RkJXsmDKyJMeqSX7EZIzoA6pWanpmfzWZMmpHY+iedn1JzknV6vekWoMJIiHFhKgBhTMb41GZWox1McDeSKhorN9wNSUUXZqLURqQk2ThmR7JBJZ/gZXzO5Ft2Gq71xKNW050gerR6x+l1lwuIA/6cZN5QixyjLo/CQkTxQ=
Date: Wed, 9 Mar 2022 11:36:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v6 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Message-ID: <YiiDIQY11N4hmmhv@Air-de-Roger>
References: <20220307150609.10662-2-jane.malalane@citrix.com>
 <20220308173118.31490-1-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220308173118.31490-1-jane.malalane@citrix.com>
X-ClientProxiedBy: LNXP265CA0079.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e99118b8-4974-4f99-d30e-08da01b8a765
X-MS-TrafficTypeDiagnostic: MWHPR03MB2734:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <MWHPR03MB273404E5AD87FAA66B0B62488F0A9@MWHPR03MB2734.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9F5l08l3z4L05BjdEG/W65e3vkfK9KvqjYrZirx5IV6y9DUHNVvj7XTDNN5XCxiDeHXnbiiIMgkWdJ5ikfRJeY4C3T5DRBL/irr9EdYUds/21Dsdzzn7jRoXU8NObjuJw+9cU+dZXBYtf7nJUzb78YnvG0aWPeT1fiyJOA4uMw0Iv5u8OkVFUb0yabQSIR2Z/hdS0ZyWIPTYNfWuLlBAHruVR5+lK/tipiMrLmVoPI4Q0X6IJqyLczIyLCIzQ8iEQMG+qu+HtwPOlInzrrWcnsHtqYrv9Q2H+s7OIqmtbq+lXz2lZrli/xq+/GM68ufwdL7gWY1Is198NzK8PTlUhdT0erlbv0EKxWKEKbEHTY19KmOFrC5Fd5Vm4whjaj04DrhqtGcVutK4g5gVnByHh+GoJ7zPAIvzjhBqoppQlzC1NxUwpTYkBB9YQYdvmjbx9i9k85Nj1xppXsyHR3O3MnW2PbC622w4YLVcX0v8V0MTDmZ4a2npawnbG+6rOKyQ62LnJjUGVFu/8irfejWXsHKTg/52c2Wvz4OcSRnk43cOx24V0TqLsPkCKOyVxkCm30JtNo5BeWJDtWYULI3cl1C85NcjWFNZc0+TBhdoyCChIhHMb4iIEmGDhmGpWWmiLJ3EgTFkj+0eIWW8JmXllw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(83380400001)(6512007)(6666004)(9686003)(5660300002)(7416002)(6506007)(82960400001)(186003)(26005)(2906002)(86362001)(38100700002)(8936002)(85182001)(316002)(6486002)(508600001)(54906003)(6636002)(33716001)(6862004)(4326008)(66556008)(66476007)(66946007)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHFhbENXVFhTYTlRSktwcEFrNWg4TmlMaVRXVWVWSUIvQjF3L3NHazNTSmIv?=
 =?utf-8?B?UUtOVlVOeXVvWXhzYy9VdE1KSVd3T2Nyd0VlNUhyUkJOZTFyN3pFek5LNFFH?=
 =?utf-8?B?aC8wZ2d5RVdqVm1IMVVEaVNBaWVaaUhBS3BsNy9rMyt5VkFSc2d0cDJWNS84?=
 =?utf-8?B?WDIyeUg5UnNBVlFsVURVelJkamh0NlBQUTNVK1NzZ2Zma0NIaFpZa2FObTB5?=
 =?utf-8?B?NTlTb3hVZVExZzVBcm1ndWFYL3VpbkYvcVErZ2U0b1hzYllWU0hsVmtyMEhM?=
 =?utf-8?B?d0hNR09YZG5CZHVRVmRza2tkdlhwUzBHK2dtRmQ5UVRueHQ2cEZHMThkMXJm?=
 =?utf-8?B?WTFzejBhRVRUbHNvU2pTd1c3VnlKZFl6U1FsUzE2VDVHSmVHdjROU0FzbzE4?=
 =?utf-8?B?R0tRcFN1YUhNaVhxdmRiWUZEcVFtdGxNQmhpTWMxSll4ajdoaTF3TlBCd3Vy?=
 =?utf-8?B?YWRYSFNjY0NlMS9rbFU2S21raWdGNkY1aVhlSjBKY1l4dzlySG45aHY5WHlX?=
 =?utf-8?B?aVJsRzFic1dMc0JrUGxzQ245aHBnVUptY2phckdsQ1lDZWZyMUZkTlBhOWZC?=
 =?utf-8?B?MXNWSWRCdzRvSFZ6dkc0bU4waUdHRVI0SnVPYUxXRGpUZjlTZkpUdTY0bjFQ?=
 =?utf-8?B?Z2tJalI2Y3kxckN4YXFmZ2dlOVN6MjNkdjMwdmZYRDU1OGpuNlZzbXYwVUps?=
 =?utf-8?B?YWIzWFNhbDNuZC83ZEgzY2J3QnhLemJ6Q0dtbVU4SE9JUTlSc0hDM0hZMWJt?=
 =?utf-8?B?N3h2N2JUSTFpTXp4cnpzb2RZb3BROVVrS3VpL29uY1pibWJ0ZlVLMTk2cHQz?=
 =?utf-8?B?akNrRW5TeWx4ak1UdXNhNUZ3NFBXTTEzUmxzQ1ZuYTdIckdQQ2tPM0NGUFJM?=
 =?utf-8?B?RVBFRENqUjZKcDRYa1M0YlRTZythTk5ldU1UYWZTdC9Qb2RrSUZZLzExVnJ1?=
 =?utf-8?B?aHJDYWVnYmJtejJUbE5pUmpyN3ZiUG1Cazh0UTFPUUk4ZGpxV05DMTRia2VY?=
 =?utf-8?B?TkliWVhaM2FnNUhiRlVoTGM3YnV0RGpUcEdLRFdobVY3RUtUSy9QNkFBTC84?=
 =?utf-8?B?VHZwMlo0R2JuVXFYSlpNeDQ5alNhS0tBVmhoZU12Q2U5aHNxMkpDVEF5Tkgz?=
 =?utf-8?B?MHlSTnF5NTBMbXQ5NG54SGlmYzErK2tkWHVrQXdiekYwUmtpY1ptMWJrbmZq?=
 =?utf-8?B?SlRHQmN1eitZZDRVZHZCUEpmYk5lZ2lRVndPOVZXMmI1MlNVT1dtMjZkb1Q2?=
 =?utf-8?B?TXJXTzY1NnRXZnhER2htOHFhSEtJbkhGZHFERXFKZ0c1dzZoNWdtbE5xR25F?=
 =?utf-8?B?Tk13NWdaaFlDb1dLSjNvSXp2a1pHY2RPYmVySzVJNGx3SSs4STBvQTlKanZK?=
 =?utf-8?B?aThYQTIxOHA5UEwxTUI5U0FrZjJQcG9aZldtaGF3d0NURC9aSHhXQWtjYVlM?=
 =?utf-8?B?LzJFYnBENjNGdXBtMC9keHJFekZrZ3NraThVeDd0bVNmM3djd3FZUTF6a1Fk?=
 =?utf-8?B?QUxTcUEwaG1SNXlUNkYxSFE0OEZlcHA1cDFKbUVyRm9RUXltcjlObG8yamFy?=
 =?utf-8?B?cDJGbHBVSmxjSnJ2ZHg5enE0S0ZCTnEwbGkzVWRCZnU5eU5lTzk5OTZCdHpr?=
 =?utf-8?B?M2hMOFh6ZjZyUHEvaWxBZ3J4NWxGREpFQkt4RUVJRmNhTDlBS29xN1F1QktY?=
 =?utf-8?B?M0lYOERHbUM1QnNGWFRxeTVvUmJvaVh6TGxlZ0o2MHA0eXJ6TS9MQWxqZmlh?=
 =?utf-8?B?L2hNWFMzenhzWnhUaGF6VmlWc3JvZ25xSDVVNnlMT0FIY0ZjUkRNcWZ3L2Nn?=
 =?utf-8?B?UFRybmJBTTROZHltUlVKV2wxQkNDZUhNdVlLQkFPdVJBVkI4SnBkVFBLNXZk?=
 =?utf-8?B?K0lwZkRXY2FSTUV1a2JGcEF6V01KWVdHdkM4VzVkZWxBQjdNOTh5THlvdkx2?=
 =?utf-8?B?TmtPRTAxNWRQUGNueTdLeTJVdXo3UDFlbEVZU3ludDFucmhPcUdxM25nVkkz?=
 =?utf-8?B?dlFiazB1UXhHNkFmUmdReW0rTDNvTkY4MURKY2ZHakpFbEZYUW1MTmxJdk5m?=
 =?utf-8?B?Y01nUjk5OGZFbDk0WEdWbXFvenNMTWUweFlZdENWeDZ1UVVBRVFqb1l5MzhU?=
 =?utf-8?B?MldUeUF2UHg1MXU0NW9PUzlvZkNKVEtaMCtNUjJ3Q3JGU1RCYTBsbkJGMDJI?=
 =?utf-8?Q?kY4A5IO2tMwJR0h3kATYKy4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e99118b8-4974-4f99-d30e-08da01b8a765
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 10:36:22.2455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lpuagAoKvWAuOwm7baDiCaS9Q8kRs0YdJ/QHS5Xv8pTcRedMnDJlfojJgLz3IvK1ubt6GO8IUNgP0zShuEKTiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2734
X-OriginatorOrg: citrix.com

On Tue, Mar 08, 2022 at 05:31:17PM +0000, Jane Malalane wrote:
> Add XEN_SYSCTL_PHYSCAP_X86_ASSISTED_XAPIC and
> XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC to report accelerated xapic
> and x2apic, on x86 hardware.
> No such features are currently implemented on AMD hardware.
> 
> HW assisted xAPIC virtualization will be reported if HW, at the
> minimum, supports virtualize_apic_accesses as this feature alone means
> that an access to the APIC page will cause an APIC-access VM exit. An
> APIC-access VM exit provides a VMM with information about the access
> causing the VM exit, unlike a regular EPT fault, thus simplifying some
> internal handling.
> 
> HW assisted x2APIC virtualization will be reported if HW supports
> virtualize_x2apic_mode and, at least, either apic_reg_virt or
> virtual_intr_delivery. This also means that
> sysctl follows the conditionals in vmx_vlapic_msr_changed().
> 
> For that purpose, also add an arch-specific "capabilities" parameter
> to struct xen_sysctl_physinfo.
> 
> Note that this interface is intended to be compatible with AMD so that
> AVIC support can be introduced in a future patch. Unlike Intel that
> has multiple controls for APIC Virtualization, AMD has one global
> 'AVIC Enable' control bit, so fine-graining of APIC virtualization
> control cannot be done on a common interface.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>

Overall LGTM, just one question and one nit.

> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
> index 5b4fe72c8d..7e9c32ad1b 100644
> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
> @@ -712,7 +712,7 @@ CAMLprim value stub_xc_send_debug_keys(value xch, value keys)
>  CAMLprim value stub_xc_physinfo(value xch)
>  {
>  	CAMLparam1(xch);
> -	CAMLlocal2(physinfo, cap_list);
> +	CAMLlocal3(physinfo, cap_list, arch_cap_list);
>  	xc_physinfo_t c_physinfo;
>  	int r;
>  
> @@ -731,7 +731,7 @@ CAMLprim value stub_xc_physinfo(value xch)
>  		/* ! XEN_SYSCTL_PHYSCAP_ XEN_SYSCTL_PHYSCAP_MAX max */
>  		(c_physinfo.capabilities);
>  
> -	physinfo = caml_alloc_tuple(10);
> +	physinfo = caml_alloc_tuple(11);
>  	Store_field(physinfo, 0, Val_int(c_physinfo.threads_per_core));
>  	Store_field(physinfo, 1, Val_int(c_physinfo.cores_per_socket));
>  	Store_field(physinfo, 2, Val_int(c_physinfo.nr_cpus));
> @@ -743,6 +743,17 @@ CAMLprim value stub_xc_physinfo(value xch)
>  	Store_field(physinfo, 8, cap_list);
>  	Store_field(physinfo, 9, Val_int(c_physinfo.max_cpu_id + 1));
>  
> +#if defined(__i386__) || defined(__x86_64__)
> +	/*
> +	 * arch_capabilities: physinfo_arch_cap_flag list;
> +	 */
> +	arch_cap_list = c_bitmap_to_ocaml_list
> +		/* ! physinfo_arch_cap_flag CAP_ none */
> +		/* ! XEN_SYSCTL_PHYSCAP_ XEN_SYSCTL_PHYSCAP_X86_MAX max */
> +		(c_physinfo.arch_capabilities);
> +	Store_field(physinfo, 10, arch_cap_list);
> +#endif

Have you tried to build this on Arm? I wonder whether the compiler
will complain about arch_cap_list being unused there?

> +
>  	CAMLreturn(physinfo);
>  }
>  
> diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
> index 712b7638b0..3205270754 100644
> --- a/tools/xl/xl_info.c
> +++ b/tools/xl/xl_info.c
> @@ -210,7 +210,7 @@ static void output_physinfo(void)
>           info.hw_cap[4], info.hw_cap[5], info.hw_cap[6], info.hw_cap[7]
>          );
>  
> -    maybe_printf("virt_caps              :%s%s%s%s%s%s%s%s%s%s%s\n",
> +    maybe_printf("virt_caps              :%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
>           info.cap_pv ? " pv" : "",
>           info.cap_hvm ? " hvm" : "",
>           info.cap_hvm && info.cap_hvm_directio ? " hvm_directio" : "",
> @@ -221,7 +221,9 @@ static void output_physinfo(void)
>           info.cap_vmtrace ? " vmtrace" : "",
>           info.cap_vpmu ? " vpmu" : "",
>           info.cap_gnttab_v1 ? " gnttab-v1" : "",
> -         info.cap_gnttab_v2 ? " gnttab-v2" : ""
> +         info.cap_gnttab_v2 ? " gnttab-v2" : "",
> +         info.cap_assisted_xapic ? " assisted_xapic" : "",
> +         info.cap_assisted_x2apic ? " assisted_x2apic" : ""
>          );
>  
>      vinfo = libxl_get_version_info(ctx);
> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
> index e1e1fa14e6..77ce0b2121 100644
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -343,6 +343,15 @@ static int vmx_init_vmcs_config(bool bsp)
>              MSR_IA32_VMX_PROCBASED_CTLS2, &mismatch);
>      }
>  
> +    /* Check whether hardware supports accelerated xapic and x2apic. */
> +    if ( bsp )
> +    {
> +        assisted_xapic_available = cpu_has_vmx_virtualize_apic_accesses;
> +        assisted_x2apic_available = cpu_has_vmx_virtualize_x2apic_mode &&
> +                                    (cpu_has_vmx_apic_reg_virt ||
> +                                     cpu_has_vmx_virtual_intr_delivery);
> +    }
> +
>      /* The IA32_VMX_EPT_VPID_CAP MSR exists only when EPT or VPID available */
>      if ( _vmx_secondary_exec_control & (SECONDARY_EXEC_ENABLE_EPT |
>                                          SECONDARY_EXEC_ENABLE_VPID) )
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> index e62e109598..72431df26d 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -756,6 +756,9 @@ static inline void pv_inject_sw_interrupt(unsigned int vector)
>                        : is_pv_32bit_domain(d) ? PV32_VM_ASSIST_MASK \
>                                                : PV64_VM_ASSIST_MASK)
>  
> +extern bool assisted_xapic_available;
> +extern bool assisted_x2apic_available;
> +
>  #endif /* __ASM_DOMAIN_H__ */
>  
>  /*
> diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
> index f82abc2488..ad95c86aef 100644
> --- a/xen/arch/x86/sysctl.c
> +++ b/xen/arch/x86/sysctl.c
> @@ -69,6 +69,9 @@ struct l3_cache_info {
>      unsigned long size;
>  };
>  
> +bool __ro_after_init assisted_xapic_available;
> +bool __ro_after_init assisted_x2apic_available;
> +
>  static void cf_check l3_cache_get(void *arg)
>  {
>      struct cpuid4_info info;
> @@ -135,6 +138,10 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>          pi->capabilities |= XEN_SYSCTL_PHYSCAP_hap;
>      if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
>          pi->capabilities |= XEN_SYSCTL_PHYSCAP_shadow;
> +    if ( assisted_xapic_available )
> +        pi->arch_capabilities |= XEN_SYSCTL_PHYSCAP_X86_ASSISTED_XAPIC;
> +    if ( assisted_x2apic_available )
> +        pi->arch_capabilities |= XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC;
>  }
>  
>  long arch_do_sysctl(
> diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
> index 55252e97f2..7fe05be0c9 100644
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -35,7 +35,7 @@
>  #include "domctl.h"
>  #include "physdev.h"
>  
> -#define XEN_SYSCTL_INTERFACE_VERSION 0x00000014
> +#define XEN_SYSCTL_INTERFACE_VERSION 0x00000015
>  
>  /*
>   * Read console content from Xen buffer ring.
> @@ -111,6 +111,13 @@ struct xen_sysctl_tbuf_op {
>  /* Max XEN_SYSCTL_PHYSCAP_* constant.  Used for ABI checking. */
>  #define XEN_SYSCTL_PHYSCAP_MAX XEN_SYSCTL_PHYSCAP_gnttab_v2
>  
> +/* The platform supports x{2}apic hardware assisted emulation. */
> +#define XEN_SYSCTL_PHYSCAP_X86_ASSISTED_XAPIC  (1u << 0)
> +#define XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC (1u << 1)
> +
> +/* Max XEN_SYSCTL_PHYSCAP_X86__* constant. Used for ABI checking. */
> +#define XEN_SYSCTL_PHYSCAP_X86_MAX XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC
> +
>  struct xen_sysctl_physinfo {
>      uint32_t threads_per_core;
>      uint32_t cores_per_socket;
> @@ -120,6 +127,8 @@ struct xen_sysctl_physinfo {
>      uint32_t max_node_id; /* Largest possible node ID on this host */
>      uint32_t cpu_khz;
>      uint32_t capabilities;/* XEN_SYSCTL_PHYSCAP_??? */
> +    uint32_t arch_capabilities;/* XEN_SYSCTL_PHYSCAP_X86{ARM}_??? */

Nit: comment should likely be:

XEN_SYSCTL_PHYSCAP_{X86,ARM,...}_???

Thanks, Roger.

