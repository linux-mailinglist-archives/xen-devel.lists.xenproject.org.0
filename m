Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BC5302BDE
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 20:45:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74450.133832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47nb-0006bJ-6L; Mon, 25 Jan 2021 19:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74450.133832; Mon, 25 Jan 2021 19:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l47nb-0006as-2l; Mon, 25 Jan 2021 19:45:19 +0000
Received: by outflank-mailman (input) for mailman id 74450;
 Mon, 25 Jan 2021 19:45:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F5Bc=G4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l47nZ-0006an-R9
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 19:45:17 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a19c048-7c54-4ab9-b3f7-7a5e40a9da55;
 Mon, 25 Jan 2021 19:45:17 +0000 (UTC)
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
X-Inumbo-ID: 5a19c048-7c54-4ab9-b3f7-7a5e40a9da55
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611603916;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jWPshECdbyXXT2LqTY+CuGTZP2mwFcy+vDrC5rmuNoo=;
  b=ZkA0qHWkOEFPm4aB9ARn3bQglG2XXdgVIM3+ii085M8DhQY+mzdiHhuJ
   m+PPOyIm14HePdEGSKSOE0/Fzvr9Rto13OXYlmqEGNp4rik+yFCPcI+lM
   ytNKltXkE6QTiIjz4JWPB8XBWDG5Um84Kfiz9QPU77RjtX83vhkZo6jEI
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: L6FL25oAcSFZdEjpxCK/7smyapBIGeZZPHb08uU+QG2xKt9Zk2sdS637xs19YPfC3tWLB9kmOs
 amdjb0tKF9PAMHf3M83MKjQkmxsbxl9e3oToaKACkkRxQut3FJHrcXoWd2QrSAlFnwjA3HG7on
 aLyhuOSengsvpw+CpStMUiAJ554ahsAoawoyxhPag2Fxzq07coAsr9vHWncCkAfXCVH3VOlcQn
 mNa3PQ2JOoqjXS/VQezauSjQE8plXXLMnZVwojafVfLYoxSuUZt8/CnBt7AhaciNnsuPFNYcuW
 di0=
X-SBRS: 5.2
X-MesageID: 35813690
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,374,1602561600"; 
   d="scan'208";a="35813690"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OuV+b5qC95t/t90fNWq2yeChJZgDg7KljZQ1WI5wboF57/5x7xbbSD5L4aW+Us6SRilLMU1vm8b7IfrgI+M7m23v+Rk4j3HowbN6PIIlwLSSrzNnMwK+bjjI3YDo37eDMNyBlUh7fB5SAaRTUz7RBgVEFgi/wofM9Hz/KRB2q65I256KrMbCEdSdirxAAWaj75s2Fz+xFQ9xhDNqifz/aBC7/ZBYX/ZLPgMBQWL16TTWDCspBUhyzAPRYe9Ut3jDJHO0ZwbNoHy5394gE/53PYtImJDQtfjPRHgRhrcs1DTk/6jsz/nFDICI6gp2inp2N2lQMlJ8WXu9BITYLzkhrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCTjIaxacfx/6JCWgPUdYkhz664yYipVmAr6IPsjJNk=;
 b=BglcwVk5aUamA+oV6jWKctiCwDBGKmcVz69NTaXLTnb+TWs7x34kOiWpc93mBEVyxkq5I2ei1TFsPY+kDI7tj4zdRjNOSmJtMtz6g9FR35HP5wEfi00MEgz0eY7MpA9CWYGSeOr7nPX2eclq7RBp0+m4vVJofX2ZkY3lsH/N7hJbFygOoEYOPzZTezOWnqQup6PScgqfpYwd877AW2W1WWk9JZ36rZSnuxn62ugWAnPczGJugA+LC+99ZXM9cw09mDvbRYk1gWjBNndlSuwwY2qxAqsTwQfyGF5DtZjMpfePbzq6MkwJosdcuEg1EANXY7pMP7JBob+0qc0mL4WV7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCTjIaxacfx/6JCWgPUdYkhz664yYipVmAr6IPsjJNk=;
 b=iqIhgEG6ITCNgOL2HFcrDFKIcbGzyTysT5ZblgtW5wxMtSfWCCpBqOVzfVHW4t9XLii34qLpl4FLUmJpgNSwHerc1jFlidN1hJYPr+/WtuKLa46Qw5WpBAwZrGp3r6uq/JDd0MpjxVfFAiBiIe2D4DPKP2dmRuZsXqBcR+9SJDk=
Subject: Re: [PATCH v10 09/11] tools/python: modify libxc.py to verify v4
 stream
To: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>,
	=?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
References: <20201008185735.29875-1-paul@xen.org>
 <20201008185735.29875-10-paul@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c3060a29-80a5-b3d6-e75a-4a309d146040@citrix.com>
Date: Mon, 25 Jan 2021 19:45:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20201008185735.29875-10-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0515.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::22) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce9804ae-13de-4abd-6bdd-08d8c169bb54
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5501:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5501D6579B5F10727AF48BF9BABD9@SJ0PR03MB5501.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2WEGI/KZp1Snd1zu9s23X3RkntIzCKBLM3uTwIj9aIu6XOnRkZ8KB51BXVFWINNXjob/GvPP08FINlxpZXTysTl1fZqo5Y07MZvM/zoqRB4+hD6zo+N4nnN8Hm0ARkBFlxReWJhscNar7flZV2eCBvIugGwOHgnTvn6muca4vR9fs257pcdwDH0s0wQWnhw7BbgbuSq9PkXFbx6mccSpvYxq4DnIepje/j2KTS6SBFTuiAjGxUvI+QDSurevi0xTc8DgCKq2Rwff37oYmPHbRDO0vSvvSf1I6F0RO2Byk1PnF4NRIHJEOcaqm+Edy9eH5BjyHsQFsdfhs3V4GfKUaRZUvVGOiSXj+nDY0wEk4wSCUQZRiDfVLPOFdIjqFiJEAhDqKtHoEWX76NoHJY+nF41T+KQ7ZFMwRdQPtNUcau8kTAPbIwQ4NYj+7wY1Y9KVyIVERQ77LiA1CY58RAdVYmOSKL7T5OFkLvbFxBCcrlo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(396003)(39860400002)(376002)(136003)(2906002)(956004)(4326008)(83380400001)(16576012)(6486002)(6666004)(53546011)(8676002)(8936002)(31696002)(86362001)(54906003)(5660300002)(2616005)(66476007)(478600001)(16526019)(66556008)(31686004)(26005)(66946007)(316002)(15650500001)(186003)(36756003)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?enJyTklxMDl3SmxEOU4zOGoxdFhUc2Vrblljdm5EYXRZWktMOFk2S2hvamFw?=
 =?utf-8?B?dEhmUGJsL3VxbTFUM2FNM1Z5RUF2K0RZU1dyMEFUbnUxTGE1OWZGWE93L0Y3?=
 =?utf-8?B?VnZoTHdtenZOYlVGLzJVRmZCamJ1ajI5TndrQy83cEwwOURXQTRqYjd3WHJw?=
 =?utf-8?B?R1VsRTlWei9uYzVjSmd6aVFJdVpldVhwdEVCYzZHb21HRlJqdG1TWVpzdUkr?=
 =?utf-8?B?U1M0dnpidTgwOTB4aEJuYk16Wk5pQnZhNk91Q2h0TWpmZ1ByQ1hsSjllVGJx?=
 =?utf-8?B?SkdEQmQyUHJvUlhsSzlCWkxPK0d6MHRvWHVPbTVURlh6K2hGV05SVUZuSVdS?=
 =?utf-8?B?U3p1ZmljQ2IzbHRpeGlFejdtUmtWaTgxejMwZ2FaNURTcXZsOTI1RWlBc1E1?=
 =?utf-8?B?L05Ld0Yzc2lrd2RaditXWnVueklTRlZNeStjR3p6OVowSXA4Smx6RFYvRldh?=
 =?utf-8?B?YU0rekJGRURvc0VQSWxuSTR5Nm05bG5haEVCUkhwM2llY2tCaEhycmFJNE96?=
 =?utf-8?B?Tm9lbzNham1uLzlEK3Urdy9JTFpjS1lDMHNBZ0lPNVhGTks5VkN4VVhpOFFG?=
 =?utf-8?B?REV0aE94ZmF1MWxQT2UvZzh6QUtvdGUrZkxZUlEzR2VpNDVYcGpSS0UvZThZ?=
 =?utf-8?B?SjJLMm1PUlZvc1pMRkZDZXcwU0pNZ2Y0bnk1S1FPV29rNHRicGhtUWlISmhj?=
 =?utf-8?B?UDBjR2VIZ0s2eDRSdmdYSlF0bmhNVVl1aktldmRBS25UZ2NkeklMaVB5dzM4?=
 =?utf-8?B?T2J4SnFmWHdkN0R5dmtoVFBGZkpqQTd3UXBnejNIRXFyV01TbDAyeWxtdkdt?=
 =?utf-8?B?aUp3QUFxNHdYNkROQzRQV3B0djZrUEUwd2VmNUQwWmRicVl0WWlRSnF0MkJC?=
 =?utf-8?B?WHZUV2RyNDJ1dHpGWVlFUDI1d3V6RU41L3VQUVRnL1cvVXljWER1M2trNVp2?=
 =?utf-8?B?K3kyN2RaeDBLdElWaUYzZUR2MkZ5TWlFZGUxVFBoYTVjQzhCbllKWWVWOVIv?=
 =?utf-8?B?ZlAxZGdta0V3ZVlNdFBmcE1ZczgzaVFuSFJyZmRDejN6MDlta2s0Z0Q2TjJV?=
 =?utf-8?B?SjNDY3llaDQzWnZEUnRBSllId3M2UDJocWpkL2tDWTJ4Sjh2VkNoZTkwQ1ht?=
 =?utf-8?B?UkJ0djVGSnlVTnJlZEZvSzJMdVoxb0w1WmVLNjlMOW9vNXIzSFJRL1cydVdl?=
 =?utf-8?B?ZEZvODlBMUhuK2p6Q0pPUlB0SjFERk9TcEloUlVhSTB0WDJpSk5qOVVPRVFI?=
 =?utf-8?B?QjBER2NtWEt5VzJSSkk3VC90bVNPTmJPYlhLZE5aOWk3aDVxa0FnTWRobC9S?=
 =?utf-8?B?NlZwVmVhbVpmOHl2dk15ZjlzN0dtb2szYkJVZEE5NjRvS2FjSUNlc3JPNHBN?=
 =?utf-8?B?WGlaM29ORGQwKzNuaTgvTUJUZTVUTU5EUmd0MnBuNUJ2aC9BSUdtVVhoR0tT?=
 =?utf-8?Q?FAdzB/TP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9804ae-13de-4abd-6bdd-08d8c169bb54
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 19:45:13.4772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+g3f7p0UBgTW/+HlzJWKLJzUyCTekBSagvc81XsWwrS5AMuvVVYDKPLKdSjps9J95sl74s0dvt84fiV97o6yMRpNk8Vd00Zurjgvze7YWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5501
X-OriginatorOrg: citrix.com

On 08/10/2020 19:57, Paul Durrant wrote:
> @@ -476,6 +484,14 @@ class VerifyLibxc(VerifyBase):
>              raise RecordError("Record length %u, expected multiple of %u" %
>                                (contentsz, sz))
>  
> +    def verify_record_domain_context(self, content):
> +        """ domain context record """
> +
> +        if self.version < 4:
> +            raise RecordError("Domain context record found in v3 stream")
> +
> +        if len(content) == 0:
> +            raise RecordError("Zero length domain context")

This needs a recursive dissector to validate the domain context format,
as it is not a private ABI within Xen.

~Andrew

