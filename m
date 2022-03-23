Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDA14E5151
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 12:30:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293862.499366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWzBx-0000Ni-VC; Wed, 23 Mar 2022 11:30:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293862.499366; Wed, 23 Mar 2022 11:30:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWzBx-0000Lr-Rg; Wed, 23 Mar 2022 11:30:17 +0000
Received: by outflank-mailman (input) for mailman id 293862;
 Wed, 23 Mar 2022 11:30:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1OhW=UC=citrix.com=prvs=074292745=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nWzBw-0000Ll-W5
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 11:30:16 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b3046de-aa9c-11ec-a405-831a346695d4;
 Wed, 23 Mar 2022 12:30:15 +0100 (CET)
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
X-Inumbo-ID: 9b3046de-aa9c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648035015;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Xnj9W3T2r1m7wMkRMMAfmCAIFJxY+vLPuYrS4T1sSCY=;
  b=Nc88GO4cUPep6ApEcKWMTbiX/ZonpvNzQB84OD+Z7WjFSd/Q74sRcszm
   wbEOkPrdJfFiLo6Gw9axEEwg/vJN0/5P+p9ONg0b3bsgPa8KL7VR7s14p
   QLCVNb+e0l7tilysiiOguKaARGs6qJVMj4R8tZG/l/luhGn/6ZtV+sus/
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66957137
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:t/IuwaJcLj4Kc8XQFE+Re5UlxSXFcZb7ZxGr2PjKsXjdYENS1WAFy
 GAYXj+PM6zbZGL9Ltl3Ptm08U8P7ZKBzdc2SABlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh2dQz2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 P5Ih5ruYyItBbHJu8MQECh0PDxQBpQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glu150RRK2BD
 yYfQTh+XS3dcTpiA1BNF5BhkuGqmFLaYRQN/Tp5ooJoujOOnWSdyoPFDt3RfdCbQNRPqWyRr
 GnG4mfRDwkTMZqUzj/t2mm3mubFkCf/WYQTPL617PhnhBuU3GN7IBcbT0ehqP+1zEu3QctCK
 lc88zAr66M18SSDTdTjXhv+vH+NuDYdXcZdF6sx7wTl4qjJ5UCfD2sNTD9EYfQnstM7QXoh0
 Vrht8ztLSxitvuSU3313qeZq3a+NDYYKUcGZDQYVk0V7t/7uoYxgxnTCNF5H8adjNLvHirr6
 yuXtyV4jLIW5eYJyqG68Fbvkz+q4J/TQWYd5A/aQ2ak5QNRf5O+asqj7l2z0BpbBN/HFB/b5
 iFCwpXAqrBVZX2QqMCTaM4ILrf3zdOBCyHZonliXKgN2CmDwEf2KOi8/wpCDEtuN88Ffxrgb
 0nSpR5d6fdvAZe6UUNkS9nvUpp3lMAMAfygD6mJNYQWPvCdYSfdpElTiVisM3cBeaTGuYU2I
 t+lfMmlFh724ow3nWPtF4/xPVLGrx3SJF8/p7iml3xLMpLEPRZ5rIvp1nPXP4jVC4ve/G3oH
 y53bZfi9vmmeLSWjtPr2YASN0sWCnMwGIr7rcdaHsbafFY5ST56Wq+Mneh+E2CAo0izvr2Vl
 p1achUFoGcTeFWdcVnaApydQO2HsWlDQYITYnV3YAfAN4kLaoez9qYPH6bbjpF8nNGPOcVcF
 qFfE+3ZW6wnYm2ep1w1MMmsxKQ/JU/DrV/fYEKYjM0XIscIq/rhoYS/IGMCNUAmU0KKiCfJi
 +b5h12BHsZbGVgK4QS/QKvH8m5ddEM1wYpad0DJPsNSaAPr9o1rIDb2lfg5P4cHLhCr+9dQ/
 1z+7cswzQUVn7IIzQ==
IronPort-HdrOrdr: A9a23:Ptnv26tVz3er9G+bGmDUYbgo7skCk4Mji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK7yXdQ2/htAV7CZnidhILMFuBfBOTZsljd8kHFh4pgPO
 JbAtRD4b7LfClHZKTBkXGF+r8bqbHtms3Y5pa9854ud3AQV0gJ1XYGNu/xKDwOeOApP+tfKH
 LKjfA32AZINE5nJfhSQRI+Lp3+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+iemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30l0dFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNNN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wSJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tABynhkjizylSKeGXLzcO9k/seDlBhiXV6UkboJlB9TpY+CRF9U1wsa7USPF/lp
 P52+pT5fVzp/QtHNFA7dc6MLuK41P2MGDx2UKpUB3a/fI8SjrwQ6Ce2sRA2AjtQu1O8KcP
X-IronPort-AV: E=Sophos;i="5.90,204,1643691600"; 
   d="scan'208";a="66957137"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXTkjpj2wFxkSwSQxkUCvooOxthrGEh/NGqMScccMUxj1cmG8dVPGJ7WJrsYgEzPC+niM7XRD5IxaCYZPR2LrFyr8Uu6ErRj9+ISQnLkUgDT05Aq4byjIr2hLK4D5PS+39ui5QiDGWH6ou1Fr6lRYprFmbcVqUf2VuLjDMDXbeTjKDbPyC3tlzXmIUjh1BMhQkivejNtlmiAUYwh8coylO1tVplpi0GAApfLFnS8OFi+Bwm0jCr4RNKBr+wwe0XAWRBK+d58XTKXVaa48UtROyK2D54/xm8UBoGWBA5nVWDSL8gyxTlpjJO/QGplzrtLq3D9/VchW2vwLy0cUglDLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYb65670eCnKmrXDFHeHWevTmZgqcxIpSxqTpMtnowQ=;
 b=mAdCWMxnJULMf64dPd0licOPNwomG6czbpkI0iVH67W6g9RjRR9V5LGdc1oTBWCXn4jU5Bpei3MpSLyV5Qt6MyfMIOEz4UqZVB2RA1nG0bhzBq4T8d2+5TYvl+yAd8wKic4GX/G3EtHXyhBSx8R5lrkjc5Hs01wSp27qt0Sqlf5Wh0B4bD0DbrkDhMJEIOUb0Ab5wG2iuOLOVbfkBVv0M1O/BsaG++2lw0K7UrlQGpOLTjSYOuir+oa10ovDqeRxQuPnnFYQcZdOt2DDEXKLwOD1Ibh1CMROjnoPhbyZAofHkzcideAOQnhzwVVU3Ykcj3RTkklrPx3QecMpd41K0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYb65670eCnKmrXDFHeHWevTmZgqcxIpSxqTpMtnowQ=;
 b=hr4TRB7QMPeexRM/Qy3/k42qS3UPGr3XfAwcGW32Ch0B/WT4l6PzoazOiU3mL8bEnXPQL9PxAURHERL0QrStHqj7ouqWGE8pf8c46TcVSmSBLeiiJ2zoyDT+odxjcviIKD+rH5twfHpQOIXliSLyVNckEiE4ayYI7NpSK7dllsE=
Date: Wed, 23 Mar 2022 12:30:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>
Subject: Re: [PATCH v8 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Message-ID: <YjsEuMBKI4Kp7kDL@Air-de-Roger>
References: <20220316091315.19281-1-jane.malalane@citrix.com>
 <20220316091315.19281-2-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220316091315.19281-2-jane.malalane@citrix.com>
X-ClientProxiedBy: LO4P123CA0090.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56713707-c13c-4c10-e242-08da0cc07997
X-MS-TrafficTypeDiagnostic: CY4PR03MB2613:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <CY4PR03MB26130E39488E25E4F04AB9698F189@CY4PR03MB2613.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8CzEy1dupWTcT6LGRVaJKdQQIKsCYdAHTNOi99X6tuo9IQ4pcoNlH8O77TsTMtg9YKXWn10jQf9R/3w64gVCQ8kzmdfLy0RUll52KmIy84QdlmF4iuc3Nz9b7VXDZGhIEEfmV4mYQVuPJ0HsZ8kLlhtVLiLogDDJSOPFLopk/BLuxZ1RQ/CtdxflAPic07kIP5O8oi2RJdjh8Sa0D+SYggtGtBB69ni+EbLv5HPJ5w7roNF240/HQp9lCjMsC0xeC2y8RtAUVdmHvuSuSJwBguNeafUnxjTDS3yqQSWgmZKaO1rE33jXfYeGnaByJcJW8QrIYTV4cJmAUIQKTqt4lmB/Yjldl7Is7lQaaCPo43cRqhcxzAlWJGUQT+vD/OPpqBklsrqze8DX3nzuQ2XOrLZUkk1NhCk8hlF2BYrJ5z7WUidPH9rkm8qZm7hRQfgi24e6xW2KcjVcdAEgFU/0apdbzK/Grgr6ALCuaIS1lHpdNt5hg1wDXkOnBAs1mSuH+1Y6JWZw7GgJ14fgaesjf0dKB7DnpWXTlvZlRrsh0+WxL7DFnU6WnOyg7/MCpLkux12tbC7j/01M/KVybWTWyC4xKIYOqhtw3i6zp5QVrr0MJN5ByxmjwTDJbU9YpcDEI3np0i1e495+88arMNvM1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(8676002)(4326008)(66946007)(6862004)(83380400001)(508600001)(6512007)(33716001)(9686003)(66476007)(66556008)(85182001)(8936002)(82960400001)(38100700002)(86362001)(2906002)(6486002)(6666004)(316002)(6636002)(4744005)(54906003)(7416002)(5660300002)(186003)(6506007)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTdCR2Fyb2Ztc2VYUjFWUlIvLzVJcndTYlpTV2c3SFNTQ3lEYnJPS0s5dzEv?=
 =?utf-8?B?ZlVDRHFmQWZBRXA3M0NJTVFWZmQ2dXRZSXZZejhrYTZoRTlBaEhTSzRwdWZL?=
 =?utf-8?B?aW9TcGZjYXkvaXJnMmNJdWJReExOSUVzMG5MOW56R21kSENKKzc4c0kzSFJH?=
 =?utf-8?B?anNlMzg4KyszakYzaDJ4MmN4UUhQTXRhcUNIaWp3cWpWZVo1UFlGVFZSZ1RJ?=
 =?utf-8?B?RFJadkg0UUdsMmRXdUhYTCs1L0FhYmlhbWVycWUwZ21TUHVCUzRkOHdUZnFO?=
 =?utf-8?B?M24weExLeGZ4VnAvUnRlMWNCdzFlNkhpc0ZtOFU2dEpPNFZUVm53ckJYYjll?=
 =?utf-8?B?MmFjazJIYlhqNi9LVG04SE9yU09BcVYzMDJTZWg0dnpKbkwrZTR4a2kzNmtr?=
 =?utf-8?B?TUV3QlBBRFNEWENtMjMrMU13N3VQclZrQUcwZWVycE9RNVFIN1RQcWMwTzUx?=
 =?utf-8?B?UXZxazZLZ2ZCTUdUWkNqdFhlcGxQdDcxcHlSVXh6S25pNHIyTEtkdjFhei85?=
 =?utf-8?B?YW1VWlVCMm9HaVEydklvQkttTy9DaHZZQ2gwSmZFVUZua0NTVG9aQWR0NXVj?=
 =?utf-8?B?L3haZm5rRjNNYWMxcVE0UEdlTytaTEw2djNpdi9FYjhLMGF3NkQ0NytpZGp3?=
 =?utf-8?B?L2lCUFcvQW5ua0xFUnhUSzVqRHZiWWtqRXpBeGdMTDFZYVdtSkk0K1cvNFZG?=
 =?utf-8?B?K2d5UGdpaFZpdGdxdVg1VXRDSW5wTWF0VU9Db1Z5a2Q3WHNha2JzMTFTS1lC?=
 =?utf-8?B?Nnh4am5LMktOakgrSDhwWlFqRHM3dlcxVzBYQWdicWpiOFdQM01kWFNuNlJV?=
 =?utf-8?B?NXM5Zmc4R05YaVZEMGtiUlBlSnRrVUlYRFVyU0dXdkdoR1dLQXIxSk9ZQm1m?=
 =?utf-8?B?K2ozVkZxL1IwTGx0TEZOTmlxRUhrUXo3RFlkeHJOTjcyOFZhVEVYUU9iVUhZ?=
 =?utf-8?B?STNSTVgzMy9MOUNxUk9laXdNeHh3UFVUWGw3emdDdVY0R2F2UUFwK2pSOEdY?=
 =?utf-8?B?MnhsbGVFZzRTcENWRG1mRGNDZ2lyNllCbVhXeWJEcWJJN0pGblhONkNsdmhu?=
 =?utf-8?B?VFJMOHBIN2dIc3BzTlRnQ1NNR3hwaXJKaXgzVk13OUtCVzdBYytxTlQ2WkxB?=
 =?utf-8?B?eFB0bDRSSGZvRzFpSHp5ODVlOGRZaEdmVWprQnJQemdLWXI2R0lCTkxQMy96?=
 =?utf-8?B?a0xSdEpuZnhVZjh5dWZPVU9oZ21yb0JxSHl6d3cwcUJPZEJOOGorbEd6aUpG?=
 =?utf-8?B?ei9rUHJ4UWQ4QlMzd3dLS2xHQ1R3d0lZdVpkNGVkOXlUWVVFbHhyVGY4Z0ZO?=
 =?utf-8?B?OXRQM0FwYUpTVll0L0gyUkN5Z3ZDTzhtbzlBRzFhWnd5M1NwN2UzQ2RJaXY0?=
 =?utf-8?B?S1FnbGE4R2VJZm0zM2EvbmtJQldkRU1jaklveFNobXZzcm93SGhyZUo5NVpB?=
 =?utf-8?B?bEgybk1kQWpyWUZsaHU1akdKZUhRRGpSRnJjUnBEM1VNb2NYa0tob08yL1Jl?=
 =?utf-8?B?QjlDNnc4cW4yUzF3ZmtDaFFWQzVLSUxOWVJPWTJGU2YyRE5xd25GNkdTUy9X?=
 =?utf-8?B?Vy9SVFpnb3BtNnEzVHdwbHYyV1ltNUczdWV3bU9aalQ2VnVkV1J1cWZ6ZHpw?=
 =?utf-8?B?WGRMeCsxL3lQM1prWkVjcTlGZmpVWmc3VDY1VGxVQnhqMmtvbEdFaUdITzl6?=
 =?utf-8?B?aDJYUUgzcFljUVQyakNNREgza1FjUjZNQlg2UzZiZVdDSzg1eEM2RjY4NExt?=
 =?utf-8?B?YkM5ZFBIK0YxZndFS1BvMkpuVmxPTHE5VXZGVXhxUUZKZURmbzFLTU1Zd3Jj?=
 =?utf-8?B?WGltK3VFakVlT25KdjduUmJDbkduVkFvUUhPOUE5OG9UNjMzdWx3NWJxZ3hE?=
 =?utf-8?B?TWZyVkIxOHlLcy9KTHprck83MDBFaUVyTWdmajgxVnZ1ZVZCYzBqUC9QdHVE?=
 =?utf-8?B?bEQ2ZEFPMUNJUno4WmhQbUIra2JnUGpJWU1mYkRwdWJ2Z3Z5Y2xtQkc5cXl0?=
 =?utf-8?B?eUFBbDM0T2h3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56713707-c13c-4c10-e242-08da0cc07997
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 11:30:04.3047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZx+0HMSLKgp3CZoR+gdTOAwqvUWyPMPS6uSTmuC4M++5yZEppMKU3ynS2pDm11I7aE/XGSfjVjk9EmX1foeOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2613
X-OriginatorOrg: citrix.com

On Wed, Mar 16, 2022 at 09:13:14AM +0000, Jane Malalane wrote:
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

I'm afraid using cpu_has_vmx_* is not correct here. The
vmx_secondary_exec_control variable hasn't been set here, so you will
need to move those checks to the end of the function, after
vmx_secondary_exec_control has been set.

Thanks, Roger.

