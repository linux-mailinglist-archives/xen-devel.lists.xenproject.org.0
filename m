Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D43774CD0EF
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 10:20:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284087.483230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ46P-0002JK-Cu; Fri, 04 Mar 2022 09:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284087.483230; Fri, 04 Mar 2022 09:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ46P-0002G9-91; Fri, 04 Mar 2022 09:19:57 +0000
Received: by outflank-mailman (input) for mailman id 284087;
 Fri, 04 Mar 2022 09:19:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZVQB=TP=citrix.com=prvs=055bc9087=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nQ46O-0002G3-30
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 09:19:56 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3dbffc00-9b9c-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 10:19:51 +0100 (CET)
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
X-Inumbo-ID: 3dbffc00-9b9c-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646385591;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=sR3H3ct19tdmO7Mwwl5hHJgUNFLV5vH6INWa0rrIHaQ=;
  b=GnDeMFU2ZQjNuFUrJGWAHym8LoQcT+mIn93CoTxp90GFczvKJXtHIBtL
   xg3vzhLoli9iUxz6EjOTJMeXT8kPzaEk1fEdPphGypd3i4cBXYB1DGBrt
   fMWwAUYqctuos6Crdoaxh0jpOP4wj61ZeCqDm6PwunVsMoid3Z8HwqfVK
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67800808
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rj/1HKLQ/n1jcDp7FE+Rx5UlxSXFcZb7ZxGr2PjKsXjdYENS1zxWz
 msYCjiGa/6LZGT9KNh0YIW/8RsP68PTnIdgTwZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh2dY02YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PVDh8yATCUxBKj3tedAdxpYMQp3BoQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glv1pgWTa6OD
 yYfQQplN0jBajkXAAZUEqA4hNaq2ELNbxQN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wt
 m/Aumj0HBweHNie0iaetGKhgPfVmiH2U55UE6e3ntZoilCOwm0YCDUNSEC25/K+jyaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCsnhAuC+pVMfUA7Tqgyffw4Aa7LWE/Z2sUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZos7SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCskPOZJhKTysDA3CMqsyq7DFDFtW
 1Bex6CjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9wOu2okdRwxbJpfEdMMX
 KM1kVkLjHO0FCH3BZKbnqrrU5h6pUQePY6Nug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm3BvrUuOFMuT50n2jtKjiIu9FO5t3K2mNbtisstpYWz9r
 r5iCid9404HAb2mP3KOqtZ7wJJjBSFTOK0aYvd/L4arCgFnBHsgG7nWx7YgcJZihKNbiqHD+
 XTVZ6OS4ACXaaHvQelSVk1eVQ==
IronPort-HdrOrdr: A9a23:MI0DSaEit74SxMQhpLqFCpHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcT2/htAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtRD4b7LfClHZKTBkXCF+r8bqbHtmsDY5ts2jU0dNT2CA5sQkTuRYTzrdHGeKjM2YabQQ/
 Gnl7V6TnebCDwqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sP0f2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0aqSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7uvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WvAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 VT5fnnlbdrmG6hHjDkVjEF+q3uYp1zJGbKfqE6gL3a79AM90oJjXfxx6Qk7wM9HdwGOtx5Dt
 //Q9dVfYF1P78rhJ1GdZU8qOuMexrwqEH3QSuvyWqOLtBzB5uKke+y3IkI
X-IronPort-AV: E=Sophos;i="5.90,154,1643691600"; 
   d="scan'208";a="67800808"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=We9Ggm8ucBcz6DrRzgqQ0A04C4kYFyaWDyIHZAJVexwcEgcwOu5YcvrVqm2cpspejSs9udX/Nr/zmSL0cWTyiehH7CuQlpVNDT2JUvaOpuaK0HMadKksP7f/jqVGNsJFET21reOZTbvopGqjT4OO1lIBXysgr9qYMXrk9FBkngGRqze3VygXhGrfTlEw9WmvxcqWBe8h/LSJXNKJrhjfrTKnIBNA0FzGXsif0HeXnN27MOo+urtAHjiszPHgO3iuElS0wE99JaWP/6Bvd1Xebx03JCp7OQcuY2momKoxVtui8wy7L1qBXcsp5Se5Y3YmVtKSQid+isCsj2/Dd9v7IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9P1ZjLL1kVlW6J4Z49boFuPRdd4bDtOHBhk1MH43gNI=;
 b=QXA1mkzfEsXpeQiikuvis8BA2xzH7M945n3Ieg2hhjyE2UGSTZE+yO9oJ1Huy7gvBRVkgEMWCX/KNROoIcmUpm7SPgf90ERzjomk26ps8AvK0HIOTrO0jAYuZ3wcXhR3W5Ar324ewOSb1thcOoOzoL/XoeSettpjfTMwvkPiLxcjNCZ8qZ0eM95/qsFjRFkZUAQzD6T2S21Wf7AzNh0PJFOZusgnkLIFr2opFfqcwNqbiCYPD1UYreeM3CA26tuLq5ba+qv1tIZSFa1l7vQM8OjK2NDmiJ5N9kv33glRhq5zGXgrcrzkMrILJcxj80tGeqLLVWcB+ANYxnOo4/TQIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9P1ZjLL1kVlW6J4Z49boFuPRdd4bDtOHBhk1MH43gNI=;
 b=LitrltJrmk5t1XJXsu12bGKPcVAzRbe9uxxqfUaBajW84l+n2VqP3TZGLy7xraRAw46YyYFDYj7I8eZEwM5JdAI7F8UEkucksPSyW3UUUb7hAR8V/VH36uykvVxlKqbP89DkMZDLjG0m5dEC45wUMRHqSJuRrNrlt7UsLUTvD48=
Date: Fri, 4 Mar 2022 10:19:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/build: use --orphan-handling linker option if
 available
Message-ID: <YiHZpmrYt+QvE7ex@Air-de-Roger>
References: <5c374fd3-017d-3c40-4ded-25a3b1c978a6@suse.com>
 <YiCkUebvg0gaBm4/@Air-de-Roger>
 <3c335ca5-63e3-6389-cba5-b9047a4ce3b9@suse.com>
 <YiDaQY1ToO8G2QYd@Air-de-Roger>
 <abd691c8-9c7e-40d7-3f18-d96f826b8539@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abd691c8-9c7e-40d7-3f18-d96f826b8539@suse.com>
X-ClientProxiedBy: FR3P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3425801-4477-4386-d2b8-08d9fdc01b85
X-MS-TrafficTypeDiagnostic: SA0PR03MB5449:EE_
X-Microsoft-Antispam-PRVS: <SA0PR03MB54494721366313CC756FD9648F059@SA0PR03MB5449.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EoF0cYXJnAK50seqAU64YEzIYfYQBASi/XK32bHTmjyCUz62pIdXtbjSR7ShFlUX7fi6gm8lYZGoX/X05L1udouwqv/iM+MWjaY+h3A9q068NIRNia1a02B/qwepENiOD54+kGkj1OCLBlaR/f5pArZ6ZHVeROwm04bfM6BbYLTkcUv4C7MEtj07WVEXjm69F3Xu5AjrkWY5z7s1lQyUDnvReCcsaj9mCHcuet4BwPysGCsle+hzGbOB7ph1xk7AInepCY6wLxRKfdiXed+5jGSaVoR6KMz3UeJVbCgWQGxBNv/jw+8puezlOoZqPNqaZtw8rGRzvD2kHgtN90AWWoGHJt1bs7VI9xbix6YU0v6uDAqSF0UxtmYzDFI7gN4SrwPec3uu4smJ+IqUR0qnY23yzilYQuMjwpu/9LFKV7Yu/k/l7wFBvSGGqpGOUiavPaqJ0K46NYoYU2/ZEX0bTazvb7/WrlmFQoLIV28uRs/2tnmNu4kpoE2xtB0hUXvGObsKZ+lOQgNCReVTjv1dQlwPkU6sP6lbNpnMKEkxyrfZBTx/RIhgQiIy6i7Qfkl4z9ZX1U9E8IGlOhsRx/4PvLiWfYXLVqkhvb45W7JuFSZgDMkrNjBnGTnY2gs+WY8f66os4DgJfbxJcRPSAIGe65DZqSRZwf0PQWGAZCl5AzOwPhenTeg9DPAEOIjtappsGbb2l54KNQs+MRe3w2MK3rDMDNkg2nV6pBHW9ktTSgNJE4QMddfj6MLPCAMyySUf+WxPKV3wO/TYh2eIMAnq55QIBlcQaYm4jUmuRD2AAKA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(8936002)(316002)(5660300002)(6916009)(54906003)(82960400001)(6512007)(186003)(9686003)(26005)(83380400001)(53546011)(6666004)(6506007)(85182001)(966005)(6486002)(38100700002)(66476007)(66556008)(66946007)(4326008)(8676002)(86362001)(508600001)(2906002)(33716001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SERwejZSTE9uckdjT1hCVjRXM3VHd0FuakFnMWFYaWpBWEx6Q3A0YTJ4S1E3?=
 =?utf-8?B?QTFhd0NaWCtLZ010QzcxQVpzYWg5U2ZLbHFXMlJGYlBEbHdUUko0eG0rM2xP?=
 =?utf-8?B?TS9oWDhGUTF3aUljbldzek85ZC9ZKzcrMFVRRndwdVh5QXk2NXkyOWtsSTFK?=
 =?utf-8?B?UVBRdmpwZ3JnMzZueWhrcmpFRXphazdkcUNDa2UxNjd0YXJhRW51NmJILzBY?=
 =?utf-8?B?bjlhOGt4M1k2Q3BNUmpjbm1CQjRKbndUWTRRdjE3cjhqUy9xdEt3V1hveTJG?=
 =?utf-8?B?ZThjR2pRcmxEYkZLNUtVNjYxUkhRUHh2RE1YMG5veVdWdDRSSVpTaVpmNkFi?=
 =?utf-8?B?dVBOSUJYSllRY3Z4REd1MStYd0xnZzdyYVFLeEtYUXZUeTF5cDVQaVZsME5E?=
 =?utf-8?B?YUlEMnp0RUUzeGk4UFR2dXMzN0hPRitRTENkZnlPNE04ei9YZ2hsUFJLSkY4?=
 =?utf-8?B?bU5CVG1tQjQ2OUdOSThybHJqYWNITEFkNTE0KzJnOGMwM2JYb2ttb2dXem1k?=
 =?utf-8?B?UTM0VFM4am9uaHh5SGtKQ3FLdlJSaHJkZTVrYkp5YjdiWnU4OTV5bHFwd1hl?=
 =?utf-8?B?VlNnWVFrdURzOFBFUzdleWUxWXNpYWsvVUtsQUJFWVFZemVzck9wSVJUaXZX?=
 =?utf-8?B?bTlUUzRoNXRpQkZpaWdYaTN3SWVaV2trdVBMbXhJYXhyalk4SmtTR3Y5cUlr?=
 =?utf-8?B?ckJiS0owUnVzMnMvazIzclNObHlsKzNDV1F0Q0NDRFZWaEVuMy8wZ2NhV0lI?=
 =?utf-8?B?SnIrUHBtdDdsQzJDQWZtYnVmekROL1VJdEFjTG1HdEdHZDJDdmc0VXhlMXM1?=
 =?utf-8?B?NlVxdURzR3lxQzN4YlF2NEZ5RUFuUmx4OWpVa1dRZmZLbDRqbWVBM0M2ejk5?=
 =?utf-8?B?T2RHdXFRNXhkQlBrc3FsWVdpWmNRRE5zZ3p2WGlzcFhjdXlkdndPbXVTSDJa?=
 =?utf-8?B?Z3JIbTFjOGtCdHlFb1p6Z0ZqNVNhazRLWmJvTDdnYTdYKzFBckJSUHJLckFy?=
 =?utf-8?B?WGV4T2J0QVhnbGVSTjJIUlBRaG1TSmxyMldVQlo3M28zMzBjak03bE93emc5?=
 =?utf-8?B?VEVlWEdaWmozK2ZWa1lxYVIxVjlXQWVZNXhCaVdmQjB4aVB3ZE5IWlhXSHdy?=
 =?utf-8?B?WmZiYXVEbVRNSlkrUFAvQ0RnSGQvTklkVDVlekMyamNudHRGYUMyUHFWVWZ6?=
 =?utf-8?B?QUsyb2ovNDgxSEp0cVpZMTEvamF2a1MxWnFFWVZPTWVyZjlsQUt6Ly9lYytQ?=
 =?utf-8?B?RmhqK3NOZ1AyWGYvNkRjTEdVdGQrcjBhY29pSVRqM0VFbmtFdTdrVVBKZkxY?=
 =?utf-8?B?bWp1N1lJNFFBNWZNQzVDTExRNFVUNG9VQ2MxZHZZdzZJbTlRaTlvWkZMSkQ0?=
 =?utf-8?B?NGV0QVBQMk5lMVAwcWtDV2xUWlVzZG1OTmUwdGR4akNtSm90Q3dkSWQ0cHRn?=
 =?utf-8?B?QWtJZlM0bGxhZlF0UHJIYysyS1JJSm9oVGVqQjI0YnRUdDhZUWMvTzlrVERh?=
 =?utf-8?B?eVI5NjlXRzVHUFpOOUVmWFQwU0o0YzVKL3hGc0E5dGdVRDFxSmp5WkxWdUhV?=
 =?utf-8?B?b3c0aXN3cDBIR2ZZTVBjMndCcE5rYVVwYUtycnF6cjMyVGNxc3RodnRmYU5R?=
 =?utf-8?B?K21XUkhOZUJSZmZzMVZIY1ZHZUI4WFBlVURxREJCYkJ3SUVSZE01dEpEZGFn?=
 =?utf-8?B?Qi82TkY1VDVVZEFhSFlpVk5CQXNLYzl0VHdnM0VrMS9hYzBCNlgrSTlmR3p2?=
 =?utf-8?B?VDI3dVg2ZWZHa3RTMmFzZjViVHNiangwZUE0WWdrd0RsV2dHc0lkNFRVUDQr?=
 =?utf-8?B?aFFWeTBnUWlKMHZPRmV0MG1PY2hISUtNZ0VnVlFsc3FOMUZFMlYrdjRIU3Jy?=
 =?utf-8?B?c2c0ZU5tc1czRFF6NW4venBTWkpLTjM3V1BtMElVQmlxWFVLUlBoU2s2Wlhs?=
 =?utf-8?B?MnRqb1RPUHRUYjhSaU5uY0l1S3FHY1d1YjVSR2xSS1VRYjFZQy8xZ2JXQkZX?=
 =?utf-8?B?aThRNTBtTkM0RTFjRzB6WWF0MjdUM3JwdFdjNXZpekRhQmVWQXhpZGszNWtS?=
 =?utf-8?B?ZmR0U1kxRjBoVzViSDcyeTBQL2Vqb3VLeUVDVTMzV2tOMVc5M1lFWHVGNWJv?=
 =?utf-8?B?NGt5NjNCUTYrVWx5K0FGSXJJNytyMGI3VGZYRFNXaDdtZTdZN1ZiTkFzaVQ4?=
 =?utf-8?Q?Vo6q4I1aYPjS/0Uimy9AApM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3425801-4477-4386-d2b8-08d9fdc01b85
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 09:19:38.8657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: do3Wr0P5kbgHPmcx29VyvU17gBQS4dzwwodiSiaNeuw/kmwmavVSUyq8U90VL+vGVb3XaDr2SGbtvsbpfl/mnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5449
X-OriginatorOrg: citrix.com

On Fri, Mar 04, 2022 at 09:02:08AM +0100, Jan Beulich wrote:
> On 03.03.2022 16:09, Roger Pau Monné wrote:
> > On Thu, Mar 03, 2022 at 01:17:03PM +0100, Jan Beulich wrote:
> >> On 03.03.2022 12:19, Roger Pau Monné wrote:
> >>> On Wed, Mar 02, 2022 at 03:19:35PM +0100, Jan Beulich wrote:
> >>>> As was e.g. making necessary 4b7fd8153ddf ("x86: fold sections in final
> >>>> binaries"), arbitrary sections appearing without our linker script
> >>>> placing them explicitly can be a problem. Have the linker make us aware
> >>>> of such sections, so we would know that the script needs adjusting.
> >>>>
> >>>> To deal with the resulting warnings:
> >>>> - Retain .note.* explicitly for ELF, and discard all of them (except the
> >>>>   earlier consumed .note.gnu.build-id) for PE/COFF.
> >>>> - Have explicit statements for .got, .plt, and alike and add assertions
> >>>>   that they're empty. No output sections will be created for these as
> >>>>   long as they remain empty (or else the assertions would cause early
> >>>>   failure anyway).
> >>>> - Collect all .rela.* into a single section, with again an assertion
> >>>>   added for the resulting section to be empty.
> >>>> - Extend the enumerating of .debug_* to ELF. Note that for Clang adding
> >>>>   of .debug_macinfo is necessary. Amend this by its Dwarf5 counterpart,
> >>>>   .debug_macro, then as well (albeit more may need adding for full
> >>>>   coverage).
> >>>>
> >>>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>> ---
> >>>> I would have wanted to make this generic (by putting it in
> >>>> xen/Makefile), but the option cannot be added to LDFLAGS, or else
> >>>> there'll be a flood of warnings with $(LD) -r. (Besides, adding to
> >>>> LDFLAGS would mean use of the option on every linker pass rather than
> >>>> just the last one.)
> >>>>
> >>>> Retaining of .note in xen-syms is under question. Plus if we want to
> >>>> retain all notes, the question is whether they wouldn't better go into
> >>>> .init.rodata. But .note.gnu.build-id shouldn't move there, and when
> >>>> notes are discontiguous all intermediate space will also be assigned to
> >>>> the NOTE segment, thus making the contents useless for tools going just
> >>>> by program headers.
> >>>>
> >>>> Newer Clang may require yet more .debug_* to be added. I've only played
> >>>> with versions 5 and 7 so far.
> >>>>
> >>>> Unless we would finally drop all mentioning of Stabs sections, we may
> >>>> want to extend to there what is done for Dwarf here (allowing the EFI
> >>>> conditional around the section to also go away).
> >>>>
> >>>> See also https://sourceware.org/pipermail/binutils/2022-March/119922.html.
> >>>
> >>> LLD 13.0.0 also warns about:
> >>>
> >>> ld: warning: <internal>:(.symtab) is being placed in '.symtab'
> >>> ld: warning: <internal>:(.shstrtab) is being placed in '.shstrtab'
> >>> ld: warning: <internal>:(.strtab) is being placed in '.strtab'
> >>>
> >>> So seeing your mail where you mention GNU ld not needing those, I
> >>> think we would need to add them anyway for LLVM ld.
> >>
> >> Hmm, that's ugly. How do I recognize LLVM ld? I can't simply use a
> >> pre-processor conditional keying off of __clang__, as that used as the
> >> compiler doesn't mean their ld is also in use (typically the case on
> >> Linux).
> > 
> > Hard to tell, `ld -v` for LLD will typically contain '^LLD' I think,
> > but I don't really like matching on human readable output like this.
> 
> Same here. But Linux'es ld-version.sh looks to be doing just that.

OK, so be it then. We can always improve afterwards, as I don't really
have any better suggestion ATM.

> >> I also don't want to add these uniformly, for now knowing what
> >> side effects their mentioning might have with GNU ld.
> > 
> > Wouldn't it be fine to just place them at the end, just like it's
> > done by default by ld?
> > 
> > Are you worried about not getting the proper type if mentioned in the
> > linker script?
> 
> I'm worried of about any kind of anomaly that could be caused by
> mentioning sections which a linker doesn't expect to be named in
> a script. That's hardly something they would even test their
> linkers against.

I've raised a bug with LLD:

https://github.com/llvm/llvm-project/issues/54194

To see whether this behavior is intended.

> >>>> --- a/xen/arch/x86/Makefile
> >>>> +++ b/xen/arch/x86/Makefile
> >>>> @@ -120,6 +120,8 @@ syms-warn-dup-y := --warn-dup
> >>>>  syms-warn-dup-$(CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS) :=
> >>>>  syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SYMBOLS) := --error-dup
> >>>>  
> >>>> +orphan-handling-$(call ld-option,--orphan-handling=warn) += --orphan-handling=warn
> >>>
> >>> Might be better to place in xen/Kconfig with the CC checks?
> >>
> >> Well. I've tried to stay away from complaining if people introduce
> >> new tool chain capability checks in Kconfig. But I'm not going to
> >> add any myself (unless things would become really inconsistent) up
> >> and until we have actually properly discussed the upsides and
> >> downsides of either model. Doing this via email (see the "Kconfig
> >> vs tool chain capabilities" thread started in August 2020) has
> >> proven to not lead anywhere. I'm really hoping that we can finally
> >> sort this in Bukarest.
> >>
> >>> I'm also wondering whether we could add the flag here into XEN_LDFLAGS
> >>> and EFI_LDFLAGS, as those options are only used together with the
> >>> linker script in the targets on the Makefile.
> >>
> >> Not for XEN_LDFLAGS at least, and undesirable for EFI_LDFLAGS. See
> >> the respective post-commit message remark.
> > 
> > But the calls to LD in order to generate $(TARGET)-syms do not use -r,
> > and are all using the linker script, so it should be fine to use
> > --orphan-handling=warn there?
> 
> But XEN_LDFLAGS is also used elsewhere together with -r. (Whether
> that's actually correct is a different question.)
> 
> > Could we do something like:
> > 
> > $(TARGET)-syms: XEN_LDFLAGS += ...
> > 
> > And similar for $(TARGET).efi?
> 
> Yes, this ought to be possible, but would again lead to the option
> being passed on all three linking stages instead of just the final
> one. When there are many warnings (e.g. because of the same kind of
> section appearing many times), it's not helpful to see the flood
> three times (or likely even six times, once for xen-syms and once
> for xen.efi).

OK, I think our build system is already quite chatty, so wouldn't
really care about seeing repeated messages there. We can find a way to
generalize passing options to the final linker step if/when we need to
add more.

I'm fine with doing the LLD fixup as a separate patch, so:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

My personal preference would also be for placing the ld option check
in Kconfig, but I'm not going to insist.

Thanks, Roger.

