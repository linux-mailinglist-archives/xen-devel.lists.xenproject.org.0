Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCF53065E6
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 22:24:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76458.137997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4sIG-00075j-6Y; Wed, 27 Jan 2021 21:24:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76458.137997; Wed, 27 Jan 2021 21:24:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4sIG-00075N-2V; Wed, 27 Jan 2021 21:24:04 +0000
Received: by outflank-mailman (input) for mailman id 76458;
 Wed, 27 Jan 2021 21:24:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=csCD=G6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l4sIE-00074W-Rv
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 21:24:02 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5bc3d4da-19f3-43be-bc76-bedc0e653785;
 Wed, 27 Jan 2021 21:24:01 +0000 (UTC)
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
X-Inumbo-ID: 5bc3d4da-19f3-43be-bc76-bedc0e653785
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611782641;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=f5ZDJMO5emoth4O1sp5rLL8udgr9Z1fIDTA31f1W/z4=;
  b=GMxr9/Gykip5ggv4UGwbyi1Q431QazuK+L3GS+pX16kd1ojFvUeZkVKg
   +OR3kF45Dfse1InUvLqV6BsWslags+Wx0sVemEBAYrwRW4hpyfSLs2Bvv
   5Z45wxAV8/ZahHPELM7ttqs16dss9PUa0QIqfoC7ZXDlcjeqH/ASIiNdC
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: GoLxNjNFoBUVmvLrbjWkFhv6yg7u6oNgtLHwhATB+HUJrU1BqLDmJhkaCpBYOwoYKXie4ydbJ5
 ZaYZjpXuAyLV3GQIk/vOj1o+o/iKUAivHqx4tAW5zG62BzjkNdhaEwrNhOMk7COYY1kNMwZsmv
 eYIf4CUBsvFvolNQEw059Mp3KVZ3XEGRQpnzvK6R77VRrH1LvmFzRp2H6wP9b8VdgXVWqSvjA8
 2/k+ph9fDe2QKAFjRC1M9bbjlxrU5i4+SlbzE2c0Z7mQDkVKZ5qHURk3scvqu5yJYouiJODff/
 gAQ=
X-SBRS: 5.2
X-MesageID: 36002372
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,380,1602561600"; 
   d="scan'208";a="36002372"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BtEGWc6Q5bsC6dWZ2fUgRM/QuPxFn8HlFF6MgBGt0bqeUJ7Z2rHd+UkeNW7qzWrQeqdwZJN/fj6f8fvL4OzZ3sDpZz7B5kmXGs8ocv0rM2g2rbf8iZYco98IEvQvR/+WVsuFELnxd8n7QO9NKNcdePbIx1z/N8sPR5pOs7rPqLPurZJ9/DHc0poFjG7d2If2N66PYb6Cy7NyeeIn6zreGNwNRYDai5B9ZJs3VqCMFT4tX52bKUTpQ73ai4FTBNZC/r0hnsscG/QD9xuFKP4q8FCNFMglT3betaksI5A/0OhZwbgFr/9xENcp/OqRh5tgufAtqTqz3GSeDgGCLBuMNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5ZDJMO5emoth4O1sp5rLL8udgr9Z1fIDTA31f1W/z4=;
 b=Xl1NiqfQsbkpo80DCI7EuAJacllEHv1D3lPorQqiPbgJex+MI5Ljo9kAgyPSBLh262ojHtRQ95PfPHeweQV385jLvMXg3zEwsp3rz7Gu2byF1Vu4Dg7xCD4rDV8xuYQf9ukJ3tx7YRUWAXWl3uXHxqBqgSaKeG38T5sq3PrNf0kUuIu+WgNpHEKOIo0CayEIOKRjlUxiRVYZIOjcFJtKm99+c1q+RU6sSfEwCtMSePFUjXGnKJnMbaMZ/Y47G8NbEknXv4jU+VNKB/bPp7+n/ljuw+tvkTt4/phnS00lbO1bWoddJeYNhBddce/SuWnIp/BUDHlpczwmGZKsImzhww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5ZDJMO5emoth4O1sp5rLL8udgr9Z1fIDTA31f1W/z4=;
 b=KmaXe65GgmJBU3Ri8eECdqwcJYqi/ES9UX2s+wDl90GC/En0dSBJv5cyIPD6iqvXCACGQ5NMSmJR9gDqw0LuvwX9vKAUfYhbJJVHecbZGii0qV8yGVFNmAzVbU2A3r4+6cLQ+jlgZc7hNRgUsbVMv3v96ilq/CVSn+nfuOfWlos=
Subject: Re: more randconfig failures
To: Stefano Stabellini <sstabellini@kernel.org>, Doug Goldstein
	<cardoe@cardoe.com>, "fam@euphon.net" <fam@euphon.net>,
	<Bertrand.Marquis@arm.com>, <famzheng@amazon.com>, <wl@xen.org>,
	<julien@xen.org>, <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>
References: <alpine.DEB.2.21.2101271311470.9684@sstabellini-ThinkPad-T480s>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <45a1b4b2-afd7-9b70-e857-d0c23f2fd26e@citrix.com>
Date: Wed, 27 Jan 2021 21:23:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <alpine.DEB.2.21.2101271311470.9684@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0038.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::26)
 To BYAPR03MB4728.namprd03.prod.outlook.com (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 862deb5d-13d6-40b0-0953-08d8c309d9ea
X-MS-TrafficTypeDiagnostic: BYAPR03MB4053:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4053720548BD198C497DCF06BABB9@BYAPR03MB4053.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6ohc50D328ouIv9vvC8jKeQFrIemcb+cYLp2TYN8Ta/1af4YD2YU183LBJQsi0afnmv9qy96fYqX3FrsPAGKOEvGeXNwU8zpGXDl3QZgX4oYcGzh4Py175F2YxVRSMP94bWM3jAD3JcFJkman9DdPCqvgsy9Q65NAXA/Xgc0xNwtacw+xloK1tXepAoNOEYk3n60KTeQJqt1H5ca1iW5w0B7zJIJH9Iq41yc5pQ8tau9GY17ADxwgkSwBITvk1OyPgxXw5cFQ41Ew2qGkvgWQu89eiQ8Y5cRncCc3tN4y6NYc9I7z3L02uOx0G7c4XrD+6B418OJwYl8xfwtouJrwOColxHNAmrHvHUrq9neP7oXdHkqknKRdtAjXeLQa8QaKHCCCg0vcwMu275qS2VQzaOjHbum+yMS2ueWXkmwjq4cRWxlyxb/IFoWq5rj7G0HTS9PB5dZ4rC+bpxopEp834HZzMOr6bcf8sTdAJtuxXj/cSpHwK5GeLpc48iy7CcGMzyYTziNA1gQJgZtpc/Zs+YSpGAVVaazHRXgY6WfwhzdbM8WsDCRUgSJh11PC5cBSV4d7ojEeF1Dt14KyRxYSDfio/iz2o3UbjIysYiR738qFoSq1Tgd82+xMiedkPFeOAockL/Ek81MU/dFc4v6J/A5sbh1Y5hFu59y+K+OikwAIh3+zTFaPGVGig79fvmA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(16576012)(316002)(16526019)(110136005)(3480700007)(4744005)(478600001)(31686004)(66476007)(66946007)(66556008)(8676002)(2906002)(966005)(83380400001)(31696002)(8936002)(4326008)(6666004)(7116003)(36756003)(956004)(2616005)(53546011)(186003)(5660300002)(26005)(86362001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VC9QYkVQSmFZakovdkJ4UC9MM1dMUnltV1BadW5CSjBRQTJNSlUyRVMwUDcy?=
 =?utf-8?B?TCtGdVFWZ1lLMlYyZFBqQjVuazhHemxLK2hzQ1JKRENWY0tlbkxLdmJaNlpV?=
 =?utf-8?B?U0JCdXlRbEQ5L1lFamtuNjdGZDFHbDdwQ3d6dWV0ZHpzWnJ0cWI3Mkt5TGpH?=
 =?utf-8?B?aUFSN2RmTlUram4vcXJHNEJjSllmZUlQYmJWMGdwOE1jUHgyRWxsaTlEMHdr?=
 =?utf-8?B?RUNIWkhpcy9ZOVIxdCtaeWYwR0RONlVOYm1HalFETm1hN20wRmdTRk9RVnhF?=
 =?utf-8?B?eGk5YjY0WktiaVMweW4ycXBxeFpEODBqOGVmRE5qMGRMeWZUWk9PS1JadmVD?=
 =?utf-8?B?Rk5tdDZOTmFrMGlEZkNBV1hqMTJpemZDZGhGclV5RmhVc0VlSUViaHV2enVY?=
 =?utf-8?B?aEl2TlBzWW9mcHd5UG1DUWtkVkprUzhzcDI3WVdEL0pBaW9TYWs2MTVwODVx?=
 =?utf-8?B?ZktHMEM2ekVnL3Bmc3Q2UStLTGV6UldsaDcwQmJuQkxrN2FMSVcyVWZMMkdr?=
 =?utf-8?B?OUo1aTJXYkF5UjErbktMamp5RHBTMFVQd1pObi9BWHIyRlp1d1lXam5wM2s2?=
 =?utf-8?B?R09JbkEvZTlBTkY0Ri91Njc0T2c5YmFsaVN0bXJxUlZ3Q0FXME90bFJOTVpJ?=
 =?utf-8?B?bFlnZVB3eFhFWkhsVXNWaThxdEVQSnlJRWhRWmRYaXRqZUF1WE9QQjltMTVU?=
 =?utf-8?B?UFhYUHIxSnhRTVBZUllqSHJSWStESFhYY08vd09pZXkvTGJQODk4bUw2cUFx?=
 =?utf-8?B?VHNSTU1kcUxZQWRVUlBKSFRlNThnK3ErZnlmVi83aHBaN2JwY2JDSk5LZGM0?=
 =?utf-8?B?YXYzb3ZheEdtamJrS1h4L0wvWWh6RVBEM2FzVTJhYUNKN1ZiQlh6bnFTdTFz?=
 =?utf-8?B?bEJUQ3F2OG1DbTRkbkFybHpCVVJKUmp6SGJyNVJCejBhQVQ3Y3drNmpLMnQv?=
 =?utf-8?B?NFBYc1RWMm44aXllQW5oaC85WWNuRWpRZmZMem9FMWJQa1pnOWx6OW4yS3JB?=
 =?utf-8?B?STJCNE1KRzVCR2dWL2ltb0RKaE9uaEFITVVlYUZoQTNLcXZTZi9CdkwvNDJO?=
 =?utf-8?B?OHJ3WFZibjlXWEdVRjJoYzRxcVBxcHdVYnN4cXBTdU9ISGV4M01qN1hKQzdZ?=
 =?utf-8?B?K2FueWJyRklRck1Bamh2R2I3THNIS1Q4V0VPMGo4d2JKSUZUdWlxQWZGUlV5?=
 =?utf-8?B?NXVWZzRaZG9ycFlQU2laWXBBSzcrQjBLeWwxd280cmU0NmdTRVdqcm9wUEww?=
 =?utf-8?B?TlU3eTd1SWNEbG4xcFlMYzZ1N25JZmRTREZlVkZlckl4TmtwV0I4OGZNVlZJ?=
 =?utf-8?B?NVB1OHBmZGgxVUt3dHdYWkZiRDJ1VUczTFFnS29KUlBvNDUzOTg4N01TYkdu?=
 =?utf-8?B?eDZ1L2xsMHpWRVlQakEyYktDQzJOemVrNHY1clAyWGJ3M0VKejJmMDE4b3Y0?=
 =?utf-8?B?Z0RnVE5Fc2VJN3FjbDEvSDRxNjRXbVF1SDJxN1dBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 862deb5d-13d6-40b0-0953-08d8c309d9ea
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 21:23:55.2909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmAeVi1dRG/3htzG92FcPLn6+V9qJoCyknos1JP1+2Ct0UhiCRcwOnQ0YCvmbv7YABw/DqhIpjLfk9mv31IxLagj4mIreHedtVE7S8cht7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4053
X-OriginatorOrg: citrix.com

On 27/01/2021 21:16, Stefano Stabellini wrote:
> Hi all,
>
> These are two recent randconfig build failures reported by gitlab (the
> two patches that triggered the CI-loop are two patches to the
> MAINTAINERS file -- certainly not the cause of the build issues):
>
> x86 randconfig failure:
> https://gitlab.com/xen-project/patchew/xen/-/jobs/990347647

This has been known and a source of intermittent failures for ages.

I already laid out how to fix it, by removing some inappropriate Kconfig
dependencies.  I'll get around to writing some patches when there aren't
more important tasks to do for 4.15.

~Andrew

