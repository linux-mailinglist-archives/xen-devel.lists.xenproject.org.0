Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D091E310DB1
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 17:15:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81844.151321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l83le-0004p8-7l; Fri, 05 Feb 2021 16:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81844.151321; Fri, 05 Feb 2021 16:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l83le-0004oi-4K; Fri, 05 Feb 2021 16:15:34 +0000
Received: by outflank-mailman (input) for mailman id 81844;
 Fri, 05 Feb 2021 16:15:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cB+w=HH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l83lc-0004od-LN
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 16:15:32 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ed90c9f-312e-442a-94b0-bbcbcdde2320;
 Fri, 05 Feb 2021 16:15:31 +0000 (UTC)
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
X-Inumbo-ID: 3ed90c9f-312e-442a-94b0-bbcbcdde2320
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612541731;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=tx9o70c+H5WdmuAIAHgElwvn2qLRlQMIoDmnhpOZZIk=;
  b=Gz43EEmje54u1s41OcQCcP1uVEKwC5s0IfTE71ViMhd2T2RK2tQmOR8f
   Om/um3OucxFW0+E1eJgUEXOBRNjQCw1tEvgIGYT7TUGW+vjhZzMQNM/MA
   u/kW7x3eGssh8p63k6HLXC2YQ49hWgAwoWCxS7EnIqib3hOoL7McCr+XF
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: B/+ETSqGYnLEvGRQFuEZAJZEK+jQyFjBPqMqgKp1BRpRzm3LSYp30bSaJxbS4jNUjjOlmVBcOF
 SChEckX/5Bgrn4W1mc98OD5J4Y6FlWueDxgaRrUrKS9KZ9QgCBw1hRxzvrYYQwnCENuMiHPxNs
 t50LIs4Db+Eo33BmfxMiYmurfzP/iUJPITwO9vEJnLfJ8h8r6KW9Z6SYtQVAy+68AJpa4sBaj5
 UTDBiYoIJj8MvuuIVMmFzsf9GWE89K+xOYkwB9vZbiT1Qq+PSZOhxHrSCO2A2nlb9bhl3dVwZh
 tsg=
X-SBRS: 5.2
X-MesageID: 37030285
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,155,1610427600"; 
   d="scan'208";a="37030285"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQKvUlpS0i9XPQDalnQpHnkXai7nBxLBqNJ0bLHtfgkxLLtCnViHgsXNFijUT4GH2hwQ1MAk44fEJyImALAFRKzeOnTznTSW3nPOVVU2YhWKUrBJ3P5e/mct5fx67MzXLUqTSGAC+PVwq6CDe4oNEkYOgDmUiA8TCDmpMbbJ7YGQW3xoT3HdDyhdGeKGmsoB1uItacDJ2Rlhx9JFd+A6cQZfS0/rTOIBakxtFM3Ct7LJHS9ujR5zubEJHxabolq2GMn3AyBUN035PKwNCHuPQL8ESLpF+gPGx3BMPLcktVbQ7CHt6E/1jwnBCVTMlW2rGnnbNc0qfO1rFJXIuZrdZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oc3FDCN3o1ZwwMC7DuyIq2R1mf6gvpVM0ajBjiuIH9M=;
 b=EXYVjtvu3lmM09662+RqpjSa5Eoy57VhqLA7EJgOVCbWwlQ/Fpt+PWihcWREDHYRcJmowrGmXqcB8kggx/fvk7/YA1IOckJna+jQxd6epOBX8MB3d5BaWDDmUCfhF7N+LOPqZx/fwZUXICmrnkqNEIdG05ToGGMHshCmZe2UlB2T3y6Uj7Wul0PANBKwi+3dcdb7TloHccM0ZmB5iC3/tebMk5y0yWL7dMgZSoj/FhAPsGe4cDpcJ2/vFdSz8baJPL6Tc7OMbSg2+tXjlrxAhJw7qUfklsjSIoK4NjXVIx5oxP2tcIUdXon+/OeTM1Zb1mXpVRI1a2PLRq3z3dOFIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oc3FDCN3o1ZwwMC7DuyIq2R1mf6gvpVM0ajBjiuIH9M=;
 b=OFBXdM3xrMo64c0q9hWSVSDcjarpykHdLxH2C6Btw8T1DDwifgUM6KQm84kjukI0AqSQgI3uGLKooeTcPc6QxAUxUMrHMtkkvSFsMd++zihL8kgK+04SRlj6RNHCkgFrZd0CXcuJKlDftPiuPhPsqKVmbQ9zn+i965X8HgisTps=
Date: Fri, 5 Feb 2021 17:15:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Claudemir Todo Bom
	<claudemir@todobom.com>
Subject: Re: [PATCH v2 2/3] x86/time: adjust time recording
 time_calibration_tsc_rendezvous()
Message-ID: <YB1vGGl59oNZb5m5@Air-de-Roger>
References: <b8d1d4f8-8675-1393-8524-d060ffb1551a@suse.com>
 <26b71f94-d1c7-d906-5b2a-4e7994d6f7c0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26b71f94-d1c7-d906-5b2a-4e7994d6f7c0@suse.com>
X-ClientProxiedBy: MR2P264CA0169.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::8)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03baa663-6c3f-45b1-78bb-08d8c9f13f51
X-MS-TrafficTypeDiagnostic: DM6PR03MB4603:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4603BBA50F34163DB9AD4B378FB29@DM6PR03MB4603.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9tI7s8mESWJX2ljtYKe57UjEPRllK5KD9Y/MRQ3kuk6GKa3SSbR02gOQFrZFCos188paxkW7Fa5ccf/lNwzDhF+VlLg1YqS+1zefdB8iDoOh49XhJNEQIA/Htcjl8BBdq7oJZtfGK9rS8/XFqpi2sSjacUR77sDAqEBDgHd3CXd5hcauP/ePmDDYLFvWPBdUuo8bMncjX8/3u8CvoihfXtyXQP6F3t8kUrZengDufuGPSpBQ45Ur2Q8NIuj/4gWFX09uGcPyx/v7pazuuisUlFWlW8wCXvXm090DFfqBQn5WqSOjeFDmZAqVjeL5GHK3nxHskbmnioIW1iWTbpBoSvM7J6qhoLjLclHVpMzk0VKzPlWJNsjSN+uJ4bgxUNAagw7+Y3PmNoyGJvtQT07NWfpBCGxxPhaNXWyERZSfiSv2LCVe3Bxuo60vEMpG1gkv0D4t3S10XxtFatnbWplmfgHUtSFcYbNJVEQBF1CMkqMQJgAT+9YmLExHedCToeB0iDVTPiJXmMLTHZTHVDs5yA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(316002)(8676002)(66476007)(26005)(2906002)(5660300002)(86362001)(6486002)(66946007)(8936002)(66556008)(6666004)(54906003)(186003)(83380400001)(4326008)(6496006)(6916009)(478600001)(33716001)(85182001)(956004)(9686003)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bXVZaTVaVVpWU2RKSGZYTG13UkRiN1ZBdm1NVnBkZHZwZ21WTTFzWXNMMWN1?=
 =?utf-8?B?ajNibG9zRy80cHRjL09FZTM0SWkwZElRemYzQk5xdVU3L3J6ZzlvNi9tbVVF?=
 =?utf-8?B?ODlLRE5xUEpuZHN4WXV1c0JUekxkc3BhNzNKUXZWQWs0OXBPQktGZlBoQm1M?=
 =?utf-8?B?T01EK3RPbFBjaGk1Y3NZRGtDT2tkOG1XN0dGamVibnRHVVlBWVhxbU9jT3Fq?=
 =?utf-8?B?Tno2b1ovOU5iTzJvNkhpaW12T3lvQXU5NVpUM1haaU1TYWowUDlwYWJvNStI?=
 =?utf-8?B?blVZYjlhTkIxOGxTZys2MUc3MWpjZXVkdTdkNVp0dW5vdGhZc0U0TFFxalN5?=
 =?utf-8?B?WUNXbCt0NWhFbkJLU1ZCY0hDRVZkWVNPRWxLNDZJOHlwY0ZTUnRpM2s4c1Fh?=
 =?utf-8?B?Zy9WK3ZjOWp0REo1ekxZSUhQU1NsWmZLcHBwN3ExbHRTV3kxQlNhdmtBY2Uz?=
 =?utf-8?B?dy9nREo0eWQ3R1BpY2RpMVMzRHZ2ODJqcEdtaWd3OWRLeUxwZytscHh4RHpI?=
 =?utf-8?B?ejF3aVdQWVFZcnRjQUVCS3lHcGtMVWxrWjdEVVN2dzRlcXZ3cTdHSGY2TUNu?=
 =?utf-8?B?RkhMZTdOOW8vS1M5SUoyNmkyb0RINHl0N01CUWxDUERCZFNyK0Y2cndzOGhr?=
 =?utf-8?B?M0lTYnJqVHE5QjZoVFRTVWkwZlJPZ0x2RlJ4cEtHellKaDM5Q0UzTFhtdUgy?=
 =?utf-8?B?bjAvVEtkN3BxUW95SGF6YUZDUXFBRHlidGtiWmRZZFB0b0x0dEpuLzd3dVMr?=
 =?utf-8?B?ZmhINVhvMlZlOHh5bmx0MjRyZkZvT21RNCsyOGxPQXFKdnp2MnRmMStrVlV1?=
 =?utf-8?B?QWY1dnlZcXVqbHF5YW04QzRldVdDKzFaM3pwQWxDQWpqc0l3U0hLY0hzdlpB?=
 =?utf-8?B?dmU0SlArNmU3QkhSYStDUloxM01rUXMzaHgvSkpCd0dtdlczOUFISzJUeVhq?=
 =?utf-8?B?bWhrRnFZNG9DM2FWclJxeHZlL09nWWJ1TmhXdkYyNXFTazVDUnVubWJMazc2?=
 =?utf-8?B?Q0UwR1pyNVdMNkV3RkloemJEVGhVYzkwdXF6a1JZcENJd2o5NlE5Q1JXRUNJ?=
 =?utf-8?B?QnduVjlrazh0THFGNG5JbVd3Q0FLMnNFWlVURi9ZTmp1S1NpZXp1cFUzVnZJ?=
 =?utf-8?B?elV0bjM5aGR3UlJZbFU2eCt6amtLOHRjM3lMRG4zSjRoSnd0eGxWcWkvc2Rk?=
 =?utf-8?B?cjdCMmtKZnJGYVNNUUtTMVdTcWJIMjdLUTNabVdMZXQ0bHZybkZ5RUNOSUQy?=
 =?utf-8?B?bWNFeFptWmJwbHFxc3licWtwMXhlakN4aUNVYjY3RWFTaVNuQWFGNUEwVzRt?=
 =?utf-8?B?SE1tWkFzMlZqMVRFNGQ2aWZWK0pvSHhFSWdyWUFSZzBlSTdta3pxOFZjSTB6?=
 =?utf-8?B?ZzZUTlp5Mjl4RXUvL2F6YzFSc1ZKcS8zZS9zZUxHZU02T2lIWS9uMWUya0lW?=
 =?utf-8?B?dzRUd2NMdDQ2aWtpdEZ0UXMyZ2ZpUmZKQWoyYXBkMWkyb3l0RzlhWnZvT2lN?=
 =?utf-8?B?TzhqbllmMUxzZGlNRWJyZUJMWXA3czg5dE9TbDN0Risrck85NUFuV2ZtYjVS?=
 =?utf-8?B?WmlwSFdmMG5lQ25DNjBNL1NiZlovaWlFTGdYUkd2NC84clVtQ1QxVXYrbktn?=
 =?utf-8?B?MXp1anVqcFA2WDVPSUFjYVpVNmVpRVc1b0RIa1hzaC9vYzJFVFdrWGsrL2xm?=
 =?utf-8?B?dUNYTzZ6TU4wWURKUkNlSkZvMU1zRU9OK2xPcnFEUzZWSUI4azY3Q2N1KzVK?=
 =?utf-8?Q?0wha60AOaEjMr0vUMeILrYvxjLR4aCDnMJQ6QJ4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03baa663-6c3f-45b1-78bb-08d8c9f13f51
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 16:15:26.2278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XQNSnG9dX1oo2QjUpdDpQkCN3VYqQpSzqUnoCB8bUvtjkprjIqqcPtwDh2/1NNxNh0te7smR0oOE0y29UuHnPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4603
X-OriginatorOrg: citrix.com

On Mon, Feb 01, 2021 at 01:43:04PM +0100, Jan Beulich wrote:
> The (stime,tsc) tuple is the basis for extrapolation by get_s_time().
> Therefore the two better get taken as close to one another as possible.
> This means two things: First, reading platform time is too early when
> done on the first iteration. The closest we can get is on the last
> iteration, immediately before telling other CPUs to write their TSCs
> (and then also writing CPU0's). While at the first glance it may seem
> not overly relevant when exactly platform time is read (when assuming
> that only stime is ever relevant anywhere, and hence the association
> with the precise TSC values is of lower interest), both CPU frequency
> changes and the effects of SMT make it unpredictable (between individual
> rendezvous instances) how long the loop iterations will take. This will
> in turn lead to higher an error than neccesary in how close to linear
> stime movement we can get.
> 
> Second, re-reading the TSC for local recording is increasing the overall
> error as well, when we already know a more precise value - the one just
> written.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

I've been thinking this all seems doomed when Xen runs in a virtualized
environment, and should likely be disabled. There's no point on trying
to sync the TSC over multiple vCPUs as the scheduling delay between
them will likely skew any calculations.

Thanks, Roger.

