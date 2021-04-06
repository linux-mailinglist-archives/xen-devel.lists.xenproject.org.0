Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B7B355722
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 17:00:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106048.202786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTnB4-0002PE-DX; Tue, 06 Apr 2021 14:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106048.202786; Tue, 06 Apr 2021 14:59:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTnB4-0002Or-AI; Tue, 06 Apr 2021 14:59:38 +0000
Received: by outflank-mailman (input) for mailman id 106048;
 Tue, 06 Apr 2021 14:59:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WgwS=JD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lTnB3-0002Om-9Y
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 14:59:37 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45ad2683-517b-486a-9109-f764628bb297;
 Tue, 06 Apr 2021 14:59:36 +0000 (UTC)
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
X-Inumbo-ID: 45ad2683-517b-486a-9109-f764628bb297
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617721175;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=+evChVLHJUcKaRLvFSul8cYyPQ6MZ7vPCpZVEdy0ECg=;
  b=bLDB5mEhdXysTiYAojUlvuFSTrvWU1NYn9wnXv84M4HgyYHNeB9qHQwT
   nmQ3NuRM1CDW6LsJAib2a/kQDxZ2v7Wn25Cg4aryikAFuLY3xvhI6EQeb
   Dso+pVrnCh4EPo+gmF+Q2kSbgvVCMU0JJUUysPVYaYs/ioxuqNxzs284D
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: A0huk5ROgeOS/I2RyjX5UF2tYvt6K+l164S10nDGkN7H91zUpwFHgsDfGmLv87QjxnRU02Jjnh
 FUzFZVXUvSg4cvsPigjU9vC5vXpdU11KyXyaIcFReN78HGmt0BWMa8MsypxPEBaok5mUdi870w
 u03AMYY0P2wfUHKU9y79PxRVhozHmkbTA4LxHhB290lasT17AalxL8k1ZkUQvMv0nFU6+xYdOI
 7mxRCnKN7EOswuWX6QTDYD4igO+y7uWriY1pkUvkG+iE6KSyripbgSK8ceJwMCsqZaoz33JR4v
 VGA=
X-SBRS: 5.2
X-MesageID: 40836779
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:0KRYAKNGhtRblcBcTxv155DYdL4zR+YMi2QD/1xtSBBTb8yTn9
 2vmvNe7hPvlDMNQhgb9OyoEq+GXH/a6NpJ8ZAcVI3SOTXOlUmJCMVZ7YXkyyD9ACGWzIRg/I
 ppbqQWMrLNJHdgi8KS2meFOvIB5PXCz6yyn+fZyB5WPGNXQoVt9R1wBAreMmAefml7LKE0Hp
 ad+cZLzgDIERgqR/+2G2UfWKz7r8DL/aiMXTc9GxUl5AOS5AnYi4LSLh7w5HYjegIK+5gO2y
 zvkwv15qKs2svLsCP05ivowLl93PfkwttHLsSQhsYSMSWEsHfUWK1RH4eskRpwjOaz6Es7sN
 SkmWZdA+1Dr0n/U0vwgRzx1xLu2DwjgkWStmOwsD/YjuHSABcZYvAx4b5xQ1/ixGcL+OxY6u
 Zt2VmUspJGZCmw5BjV1pzzeDxB0navrWFKq591s1VvFbEwRZV2toIl8EZcAP47bVnHwbFiKu
 VoAc3GjcwmF2+yXjTctmlr9tSmQm4+KBeAWlQDocyYyVFt7QlE83c=
X-IronPort-AV: E=Sophos;i="5.81,309,1610427600"; 
   d="scan'208";a="40836779"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iczXN9TdJm17Eqo+xHL+MQ2evrLmgcBc8ZvKn9oyAep4/NFzIaMIAEYnYRmOeVqZK3bzY+GFv5d+4oK63ollkpTcN/xcjCjo9oqitr0mM0uedZ+CNJgpmqeT9wnwPV6XsXt6CURlEMTrSyctu3LOikt7r2UWh1CS9X6/UkrEEPsc3S0mzno/jVTVeQiECa0EKwdSpb84yY/MjOuYQ1QJQI8oP6xqpSzstb5C0xrPsLDPGYibaWijglld8OUpRIjQ4La8/msIhumpPo0J1dlNPd7nVkoZ8tgL12Km/qaKjjOzK/xVVY7oxpU0jyJs9igOl33d+wINONCJOGijQZZeGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3G/7MkmYv1N15KpmZkYCQC+N+vTKHuoy/0b4UDlE60=;
 b=BEubVdQMTdNHQdvpae7gvRokUHup8+dnl/9UmJC7wUZ6ka8I4dOsWUTj4WVpz5OqjetF5X9eGvI/IyrWBY01tVGDhnBWw/fieRSwUyN53zRrCJ7tq83ySySHgs77H242CxxzrO8AT31db8rUv1cYOg+XygMqy/ebE4wqLsuoKpxJYfFv4+7/i8TjEwL9rwxau7C07XZF3U3NrILiY4deCFWxAZ9omwvfV0hndrZRlmNhCtb9QWjnkHC+EdaHu/qWVia/bD+IxYE08xu6Rh4dwXXdTnbIcn9vUIS/Pa5puwDXYkPyFFDcu6Ce54sb5nduWJfPRMjZOoJvmyjL7PCORg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3G/7MkmYv1N15KpmZkYCQC+N+vTKHuoy/0b4UDlE60=;
 b=frN7p/zWWVUMyLfa1jr75antgvVBkw5QkvRBBBcCLxhpHPdDvQjs0IX6sqEO5RF7J97wAYkOocNwKp3NFyAXF2+QuqCR+jS+j4JPv9T5jrfXyiSaVHe8jci80uKfGxf9+tbP+0MEsoFmrYFuGt1qTvGAY6yaADyBAn/lAGwp0oM=
Date: Tue, 6 Apr 2021 16:59:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: Rahul Singh <rahul.singh@arm.com>, <xen-devel@lists.xenproject.org>,
	<bertrand.marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, Paul Durrant
	<paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH 2/2] xen/pci: Gate all MSI code in common code with
 CONFIG_HAS_PCI_MSI
Message-ID: <YGx3TsTlAuE9eQ7i@Air-de-Roger>
References: <cover.1617702520.git.rahul.singh@arm.com>
 <4471ba4fffc8a0cef24cc11314fc788334f85ccc.1617702520.git.rahul.singh@arm.com>
 <YGxsfdK9GEefLgAv@Air-de-Roger>
 <75848a0d-d060-6a8b-5ebc-7376ffc14af0@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75848a0d-d060-6a8b-5ebc-7376ffc14af0@xen.org>
X-ClientProxiedBy: MR1P264CA0034.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 398f0979-9fb8-476a-0fe6-08d8f90c9591
X-MS-TrafficTypeDiagnostic: DS7PR03MB5463:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB54638C136BD359C244A898B28F769@DS7PR03MB5463.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zaBtsBTVFWSG3aqUlkJR2ZBwBHvc54Mjfb+jG7MIPylVntmVU32enMNX5LGXtrJDR4NvRLhBJe54u7esYrLqiGMb8dp9adzlsQEAi+EY4aG6AWBq/uqwsGQYkVRLFhmjm2qq9mmGQLVEfUixDK5pETob6DIVDHzvgdNqg6b2aPBKU+qvoSiTnVAXYL4WDnV5dZkdF7L5cVi4U8LXrplo9XAsA4Uwv/4ig3no/AYyDT8jVXDGO4XH4eyRzgvujT5pE1Cj7j8cR1VNJ74pKOsEz2/LaNXJvCgQ5Wwd/BYORSWbRuvbwKtfSXOK600GoonrfApq6lJZYOKJ4ZHQtc800KlDu0N1SGrSYbIrEV9nYTlyH5PVF+kYcyShKa1YEmFhZm5u9ugpuEeYVFSH7Cza3Ow3Yb6K0zQWLme6RMI+t7M1LPbqpmQ5KXnZTm1QXLTrnwcDUWqKChMawYb+4tyYn+ZWx5VLcBOrS6eXp1mZK8T2NtvrsGTJsJu43tuW+HY2c0BaK8aRga5bG8g+sXvvuXpTzwIWwmc82sVfH2Td0zpANskASKGLd2n9xbNFBACKpU5aR6erbQcVNJKIN0lxc1+VGolt0nNxTNC5n5j4ZBBrd99lothI4/xJO+0q+Ao44Dj9g2gnuCHFXTUyrj+ozzNuYxR/oIAZ2beLk8cU36M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(366004)(136003)(396003)(376002)(39860400002)(6666004)(83380400001)(2906002)(66946007)(478600001)(956004)(33716001)(6496006)(86362001)(66556008)(4326008)(66476007)(54906003)(53546011)(9686003)(85182001)(186003)(8676002)(7416002)(16526019)(8936002)(38100700001)(5660300002)(6916009)(316002)(26005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TmVuWDRkU3ZBcDZjNzRXckxJTDNpaW9ibGc3RDFxOFpuaUo0YmJGMk50WnMx?=
 =?utf-8?B?T3FUR3RWdmN4Y0QydFA4cmhWTng2djNBemRrTzkrdjF4ZzZiWnkzeS8wcE95?=
 =?utf-8?B?amdYSmp2YnRlbGczTmxXVThvUzJIV0d3WHZLcnVjKzczbVg2L1FwQi85M3FU?=
 =?utf-8?B?ZUFjTno1YlBhYXJ4VVBwaDR6dUFRc1hKUFJhS2pqc29SV2UwcGQxeUlkMTlB?=
 =?utf-8?B?bWVHdWtCU1U3RUdENVFoRGp0VGplNWJaTm9jaGhLU20yRlIwRVBEVk5LSUhY?=
 =?utf-8?B?czZRdVRLWHZQdFhMNS9kQ1ArcDFGdFFoK3ZxeW5EVHIzYnAxVVZ1akVrMmlv?=
 =?utf-8?B?QUJaOGJlS2Q3RExQOGJOMGhGcjZ0MXhMc2FsU2ZBM0E0UGo5YXVTd1hidTZ5?=
 =?utf-8?B?dHVJRzZZZTErdWwzODNQVTgxTkpQTUhycnhOeXQzWjFxWE1oWk1jdm40M1RZ?=
 =?utf-8?B?bFdja3l4Q1R5YWZGWU93QUQyTTl4RjYyanpXSDQrU0dKZk5tZE1KL1RxdXRG?=
 =?utf-8?B?dDBta1FSQ1cyWWlxQ1JQYVJjOGQ1UXA4aWxlcStraktzcGZoQjdLbmZKeXl5?=
 =?utf-8?B?OTRRdHpHK0VCOVkyRzdOSzZLUTZVVHFybS80N2RMTmI1em56TjJySGZXVyth?=
 =?utf-8?B?NkZaeHFYbkpzSkJaWERMV2V4U0d6Z1czSGw2Wml0SWJNNXFkaU9aNzFVUjVk?=
 =?utf-8?B?MTAzMDFBOTBCKys2VzkzWkYyZ3hhd3JUKzVOOWR6UVd2VHVWSUxyb3haZlYz?=
 =?utf-8?B?WGZRZEtYbGxBS0dDRUZ0VzNBUmh0cmFXaVIyWkxNNHRWaUY3L0JEVWEvRGhG?=
 =?utf-8?B?Q1RxUmtRRlFLT1N6Rm93Mkk5WTRES2liWkdEZVV3b0lHZVMxcVp3bGkzQi9n?=
 =?utf-8?B?a2Y5RzVITjVqL3BQR2NRRTRySkdUVHZjbW1Vd0tnS202Unp0NXk2b1ZHOWxh?=
 =?utf-8?B?UmlLdGxMa0dLTzE5UWRqSWw2d2s4MnFpL2lJL1RtVnlhYVdob0orbEFSWktm?=
 =?utf-8?B?OUphNVhsL3RyVDlmMXYxWWF3OXV4MjlIbkZqOUswNVhFcWRkNEN2aFF4azh0?=
 =?utf-8?B?bGFrOXhaVWJQempyVlJubjlrK3JBSk4vV094cXFUNnk1dDcrenhrWS9GZmxs?=
 =?utf-8?B?UnErdFJMSUhNQ3lSK3d3RytFZ205ankzMWl3U213R0ttY1ZYS2c2ZTdFVWlk?=
 =?utf-8?B?VVhEVTRGNmVQU2pOaGFsV0czK0s1ZVVWUTFHVUQrU20wakV5TTh5TmJJWU9a?=
 =?utf-8?B?Q0dDYkxlN0hBbnZSMWd2aEdBaUgwMmVLL2NsZ253dXlqdG5SclhjaC9lV1c2?=
 =?utf-8?B?dnV6aGZKdm94QSs5VUFUQ20wbDBBMXpvVzEzSGJyVHYyNFJtcllJQWJRQjM2?=
 =?utf-8?B?ZW54WG83aEJCMkVvUUc0Q2JIUXcyQXN0bXFpVkhwSzIwcjBSY0xBazJMZHpE?=
 =?utf-8?B?UWhZaG80T21ZY2NNVjFpZEdaYVJmL1E3Q3hPMXJHNGFCM1llSnV1NVpFREkz?=
 =?utf-8?B?eGozREllY3JpMlRLZzV2aGpDZThmbGJCbERVUzMycUhxbVdxcmVXTzdiL2pR?=
 =?utf-8?B?QmkvUVV5d0s4SmtPOVVsNEgxaTA0MDg3bklsTnE3ZWNKVWNPalZVckF0Z3NU?=
 =?utf-8?B?THlDVy9BYTJ0Z0tCYnFobmJoRzNPdjNQNmtHbW1NSVZheHV6Zk1vaXNrSmwz?=
 =?utf-8?B?VTVkTVViK0JxaEpUd1I0RWdMY0RiY2ZNQkdWVGQ3ZkM3cUY4OHlFNDlqOEdY?=
 =?utf-8?Q?6qj+b9j4OZI1Yj9eU0twXwpkErQhLM/KB7fXzrk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 398f0979-9fb8-476a-0fe6-08d8f90c9591
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 14:59:31.9246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zfqEVD0QeE6KnbdCN3de5XXAuY0v621K415R/bBjMBuJFBsFoEnAE69UZoE9yBqt7s+KpFeu+yyMQ8WXW/b4Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5463
X-OriginatorOrg: citrix.com

On Tue, Apr 06, 2021 at 03:30:01PM +0100, Julien Grall wrote:
> Hi Roger,
> 
> On 06/04/2021 15:13, Roger Pau Monné wrote:
> > On Tue, Apr 06, 2021 at 12:39:11PM +0100, Rahul Singh wrote:
> > > MSI support is not implemented for ARM architecture but it is enabled
> > > for x86 architecture and referenced in common passthrough/pci.c code.
> > > 
> > > Therefore introducing the new flag to gate the MSI code for ARM in
> > > common code to avoid compilation error when HAS_PCI is enabled for ARM.
> > 
> > Is such option really interesting long term?
> > 
> > IIRC PCI Express mandates MSI support, at which point I don't see much
> > value in being able to compile out the MSI support.
> 
> I am pretty sure there are board out with PCI support but no MSI support.
> Anyway, even if the spec may mandate it...
> 
> > 
> > So while maybe helpful for Arm PCI efforts ATM, I'm not sure it
> > warrants a Kconfig option, I would rather see Arm introduce dummy
> > helpers for the missing functionality, even if unimplemented at the
> > moment.
> 
> ... from my understanding, most of (if not all) the MSI code is not very
> useful on Arm when using the GICv3 ITS.
> 
> The GICv3 ITS will do the isolation for you and therefore we should not need
> to keep track of the state at the vPCI level.

Right, but MSI has nothing to do with isolation, is just the
capability to setup interrupts from PCI devices. What about systems
without GICv3 ITS, is there an aim to support those also? (as from my
reading of your reply those would require more auditing of the MSI
accesses by the guests)

> So I think we want to be able to compile out the code if not used. That
> said, I think providing stub would be better to avoid multiple #ifdef in the
> same function.

I think providing stubs is the way to go, that should allow to remove
the unneeded code without having to explicitly drop MSI support. As
said before, I think it's fine to provide those unimplemented for Arm
ATM, can be filled later if there's more pressing PCI work to do
first.

Thanks, Roger.

