Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A0F3EB453
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 12:59:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166744.304352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEUtz-0002EZ-2T; Fri, 13 Aug 2021 10:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166744.304352; Fri, 13 Aug 2021 10:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEUty-0002Ci-U0; Fri, 13 Aug 2021 10:59:02 +0000
Received: by outflank-mailman (input) for mailman id 166744;
 Fri, 13 Aug 2021 10:59:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8rK1=NE=citrix.com=Jane.Malalane@srs-us1.protection.inumbo.net>)
 id 1mEUtw-0002Cc-Or
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 10:59:00 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5dcd8d3e-c4ce-4b15-abae-6de0f5b90726;
 Fri, 13 Aug 2021 10:58:59 +0000 (UTC)
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
X-Inumbo-ID: 5dcd8d3e-c4ce-4b15-abae-6de0f5b90726
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1628852339;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:mime-version;
  bh=7zSjsGVLyKBQ5gcI2A6x9booPcmlTWdsE0DJB76BrCk=;
  b=KgDpbNgd6XtnczxQ6suEoUR2BwEFIZ5PKK11ATPfdmIIceHTq2rS6hJO
   kzysSld1drscvdDkVZn2I+lWRft7kkzfKJEdvO9hHQ2UUrL+W8AtwluX/
   0U6hlWO0ArXZ021oKHUQwK6L/DlUJuM6Hk33DIn4TGgr+ClrBtGcHTF15
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Z/+fQLko007yjPPp0M89r8lnUwI7X3s84aDFGj8eGGgX8FcPLnvi6N7T9lTZns53pKvP4SMQfb
 t2Us9jwiHuOXvzGNFAwnxzmWOX5+1LGxto/nGM5LNOhsWl4CDZPtxzNYKlcwBNM6v1ocCLYk6/
 W7hnRFFG7lij+tkBHLO3AANQUqpfh9h19LaNLHgMKEwxADsxFNWhepN+qkJvhL7hVcuJ3Q7Zhe
 BpUFjDULNQPs8iVlAxjkllkYA6nI3N/hGtc4V/Hig5v5EKyiLWiy2+p1ELLA141qXcgt7E9bTL
 1OUSAHnKuhsKq7l17KBJgpG/
X-SBRS: 5.1
X-MesageID: 50393087
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:bJMQ56M2hYBaIMBcT0n155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/exoS5PwPU80lKQFnLX5WI3NYOCIghrREGgP1/qF/9SkIVyFygc/79
 YQT0EdMqyIMbESt6+Ti2PZYrVQs+VvsprY4ts2p00dMz2CAJsQjTuRZDzrd3GeCDM2fqbQQ/
 Gnl7V6TnebCDgqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPkf2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0a6SwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7SvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WfAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 lT5fnnlbNrmG6hHjTkVjEF+q3qYp1zJGbGfqE6gL3W79AM90oJiXfxrack7wc9HJFUcegN2w
 2LCNUwqFniJvVmGp6VP91xNPdfPFa9CC4kAFjiU2gPK5t3T04li6SHqondt9vaNaDh8vMJ6e
 L8uRVjxDYPR34=
X-IronPort-AV: E=Sophos;i="5.84,318,1620705600"; 
   d="scan'208,217";a="50393087"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYxpUKstZzPSxGe1Jr+GfZslR1HXQLLrtAKyiz7CuR7s/fnQftpbL0cW/oe8Dtc/xdGP6OQkpVgVua7u235kU83a4+RfWWam5OgeI8ebqdP4XSRVTlR72Bq8Cc4egoTEkgViRAtH9pDGPhDypf7fgqayFbVsjz96qJPG/7Upgr08dVs85kBY9pDnb+4CZCU638wYTBCWspOVzy35rBIOq+8iC35IS/HxuKcwU0Vl1lw83OU573o11CqdJ+fcuk7mB0ndMk3F2r6p9LtxNnM4ruU8W+Or5OHsVG6n8ublXigOYXufuxHlucNzq+ub6+XnTCQUhiNTrtzMk745DrdBtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3/e8AjzcKfOner9xW4sxlg0J3YyNW6VYaWT9/AaHwc=;
 b=mto8jzP7SRu1NRxGTlV49yk/7Nh8zO+3lpIzK+U5EPZVkAku+L1t2sTg0bNbr+IdhGcZ3fcd7Ud3OjFzffQcb4T+A94xIQW66+503Sdhj23gyLDCiwcFREKxnmQETAGSxuLEvIurR+pgnH/MHlCcG3hpbgGQSxhpJOtRpQAbDCFMBhUjb9qAWhX14Wf/R0Gd4+uInWfe39swVWd9BENEawsiJX5KC5245h1xurC8rCj5WiIt6duJr0OL2HP84SrcGoxmnDkGUTZzgrC15cG1reSZGt5VFsgCTUJ0BrPWxqXEZ4LUoILc9MxDecVPYAAX+bMNriOHrHdUkaq9NOHAyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3/e8AjzcKfOner9xW4sxlg0J3YyNW6VYaWT9/AaHwc=;
 b=esQTwfSwdWA24ZLZZf73lkRI+AMibhmD1W0KRfzhVR0p5jAE5BodaWLEIVqb0USysBWHzCotm2OT2E/0B3zsnN/HUcoCOu50f0nsW4T1/gnV+8/1VXSxRQjq9HolWqtlaf758Yy64Y+EyZ5m6gzHgXvED+10DxunS5aKI3TQXFw=
Subject: Re: [PATCH 1/2] x86/pv: Provide more helpful error when CONFIG_PV32
 is absent
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20210813104025.2063-1-jane.malalane@citrix.com>
From: Jane Malalane <jane.malalane@citrix.com>
Message-ID: <4dbea9b7-0388-942b-bcf8-88edf6fe7ffb@citrix.com>
Date: Fri, 13 Aug 2021 11:58:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210813104025.2063-1-jane.malalane@citrix.com>
Content-Type: multipart/alternative;
 boundary="------------9CE85B8894A1EA4DAEC1A850"
Content-Language: en-GB
X-ClientProxiedBy: PR2P264CA0026.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::14) To MW4PR03MB6330.namprd03.prod.outlook.com
 (2603:10b6:303:11d::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5976a8ba-daa0-40d0-dcfe-08d95e4957a8
X-MS-TrafficTypeDiagnostic: MWHPR03MB3310:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR03MB3310875A1E2AD715F0C8254B81FA9@MWHPR03MB3310.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mGRAuxDcpBfj/KB9h16tZU0VzxPBA44sCXw1Awfdfxh+AOK+2h7G9UOg43blX8uGj3tvamgj3lFEQXNuImz5QTvOgu+db3EKuxPQyqHVzl5yQlW5ZXOYUA9O5k1C51WMGtuDZIqn27NwIymupZ14JJNDDMbygFqZ/EGv00oPv/lU9jGARoJoPUO4pSuVY9rcixPewS4+lrF36cNx1R/veapLP0MpxAL/cWhx9wqwLUxUyeG2QrvUmtjFtKgydClqnk+ddSxNoVj/e9hvlpet/Uvn96tj5N8VyeH+belfuAffoMY/djfBeswLhPgW3UECnVvUI8t3T/U/TLA3LzbOGWqjpfUllkkCSTB195sD+RCo10+PTO4NeMOGk7YM0LhMi1usx0cjjq1bsXq9CNmXg4dmvct5WWyuHeROB3pp5/64mN3DzD7hG3bRqLgCBRt3JX2HJIzzLTXshb3/y0fziPQlWkfQdDpkCUlX0MwYXKSnCa1gGNCCzxpWfLFqN03pl4jE73Nk3IXbrJPZBuhJRJSk2IjwEraVtIy+zlhSYgSItvz6eSsirAV+DYQIB5V89w223DIpYgf2ZIhXKa4pxK71YvP+EGViSkD5lXx2hjehDcX1r0ZrfOp3V6YH7V2lK4rKdbOYN5wybagqJhG3RAbzGlncgTjWmlYms5HU8KuY+waB4ZAma1+kixLPg3jiGV7adTvN4EGwo8VO0ZwMZuJfMFuB5DcjmoCwj0tFfkqgdaYcV1EJxfS1C8MpcBd7rj9BZor2Hgm94dWyWzw0UQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6330.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(8936002)(66476007)(6666004)(478600001)(66946007)(66556008)(54906003)(36756003)(31696002)(6916009)(83380400001)(86362001)(6486002)(16576012)(316002)(4326008)(2616005)(5660300002)(53546011)(38100700002)(38350700002)(956004)(186003)(8676002)(33964004)(26005)(52116002)(2906002)(31686004)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXJIeTlaaEJpbmIyTTNhTkFYMkVNUmhjSVA0NDUxb3lwZFVJZ01KeTJvTlBC?=
 =?utf-8?B?dnN0aUdKSUxLNkR2NitnelhGSG0zZGNkc2hVTWdyaTU1TmFtY3pRZkg5OHdo?=
 =?utf-8?B?UFZXTlRtNjA2Smo5RmRQa0Ftd2Fac1BtSk5DSHEvSzJFNHhtVFovdXE3L2Ex?=
 =?utf-8?B?dDZVd0QxZjg2NnZWUHVpNzF4ZFB3eGprTlhodU0zQ0FiVjAwY2dIRUc0MXpW?=
 =?utf-8?B?N3FNUHJReTFFYW5sUHk2VXBJSVlkM2pKRmQrVUN3NkNSM2FhbGJFRGxyQkw0?=
 =?utf-8?B?eCs2S1lva1QwZ0NRRkNJSSttQWlmZDFXeU50b1E4NFVPWHBYbmsrOEFiSnYr?=
 =?utf-8?B?WHYvWHBMNjNySHl4am1YU1NyekFrMW1tMnY2NnAySTA5WDlnN0pueFQyYnBB?=
 =?utf-8?B?enVMNnVoVUZvb1MyWmVGazhiWUREYXh4MEozbUVmM3VYNWRyZmoxQkxVUDFF?=
 =?utf-8?B?cjJZUkhaNC9Uanc2Y0daeFU4TGZWS2Z3VEh5S1JlS2VMMFhnOWw3R01KZE90?=
 =?utf-8?B?ZTB1eTRoSVFFOEY2YzBMVERTQ29ESFJzNGdZcUJrRE8vY0dzWnlDcDVBNkQx?=
 =?utf-8?B?dUFyNGNERXkyamtKbTArcldQOStkNVY2ZTRmOXpoWFhxcVRtNURxaVpaS1Z0?=
 =?utf-8?B?NGhDWjk0SXdxRys1UzVEeG5wZnk3K1RLaW5ZUElVdi9iOTRkTmMwaTFkeDA1?=
 =?utf-8?B?azBEZUhRVDhkeEsvMk9ZZ2JFQ0dpanp5SmVVMW5veHUxSVZXUC9HZ2libmg3?=
 =?utf-8?B?dmJJcDlBVG5tajRraU1aNFpWVjRpczN3alRwU0tKOFBRQzVBelNqbDRXNGgy?=
 =?utf-8?B?RW1OQk9vMG1qZDEyRnFXSmZWRGc0QStFZjdmcVhqSVVuZEkwanB6bEZBWmZx?=
 =?utf-8?B?MVg0VXZ2U2xqUlpDTmlzZ0pJODZiSlR1V3pRcStpeXJkNnYrUW5URWVHaW9H?=
 =?utf-8?B?VVNxNHF0WEJma3dyR3dpeXBpMlpKL1BkSDlXaUhad3NjaURFeStOeHYvMWpB?=
 =?utf-8?B?Y2swZGdpQkdaMzdvVC9rYkFiOVRTUXB4c21lK2lYYzNaSmJJTHo3U1JybXpV?=
 =?utf-8?B?L1RWWVZMaG9vdUxtK1hzQnQ0MmcxelU5cEc2REZ2MnpkcUZaSlhDNkRSRTRW?=
 =?utf-8?B?N3ZBVVM3Z3FraVp3dytkZkhSTVB3QkpUMnNNQWcrWGs2aU9GV2Z1T2VTd2cw?=
 =?utf-8?B?MVhVZDhWaS96T09FU25wc3dhWk9iTE11dVg4VVZGR2JHcHpNenFzV2pSNUIr?=
 =?utf-8?B?OXdzSmhnei9QOURzby9SUm1pOWtDNXRjZy8wNzRlN2hPKzlYVEZkNWw4WGN2?=
 =?utf-8?B?ZmRCT0tHcjY3SGdra1hCNTFudEJPSVN1b2YzY01sUjhub0swVURsOHY1ekhB?=
 =?utf-8?B?UUtVb1oyV3QxMkhXRE14anE3SkVHaFpKcEZXZldmc2dmY2lnMmpRMm5xWVg4?=
 =?utf-8?B?Wm0wYno4blI2WXRWbjNwK0VJcGNOQ1krQ3dENHl6ZHRIRXNOZVF6ZnJyQjVS?=
 =?utf-8?B?VjlSdkk2cnc1ajF2Vk5ZMlN5Vk04emtiS0JXazAzdk1tWGFkWGludXI4ME1W?=
 =?utf-8?B?WEVxNDREdzlCd3Fob211QjNVL0g3RHNyZmZDVlNycG8wWXdFb1F2U2JVMFBF?=
 =?utf-8?B?Sm1JK0x5TGZ0eENISTV5SFJDRWRpUmJIMkt3VmFzZDFjWXk2NXBPaTdRWkVz?=
 =?utf-8?B?SXc1enJwRUdLYXN1SVR1ZkxVNkdVajBzWU16SFlNSHFuUnNoQ0NxWktsSGhP?=
 =?utf-8?Q?AtDOIbw/GVCB2DaM6y/nmAnyTczFjiYmUW9iALc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5976a8ba-daa0-40d0-dcfe-08d95e4957a8
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6330.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 10:58:54.7417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZUaOhbHYenHBEdE2Hcc5+8p8zm6zEsPuNuZLFx+FG5odsgPe6zk0tdYhgxYmPnHSqnp9A2hUBLdtm7nt+C0TXws/Z3YZsaP3YTvIzUbjBDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3310
X-OriginatorOrg: citrix.com

--------------9CE85B8894A1EA4DAEC1A850
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2021 11:40, Jane Malalane wrote:
> Currently, when booting a 32bit dom0 kernel, the message isn't very
> helpful:
>
>    (XEN)  Xen  kernel: 64-bit, lsb
>    (XEN)  Dom0 kernel: 32-bit, PAE, lsb, paddr 0x100000 -> 0x112000
>    (XEN) Mismatch between Xen and DOM0 kernel
>    (XEN)
>    (XEN) ****************************************
>    (XEN) Panic on CPU 0:
>    (XEN) Could not construct domain 0
>    (XEN) ****************************************
>
> With this adjustment, it now looks like this:
>
>    (XEN)  Xen  kernel: 64-bit, lsb
>    (XEN) Found 32-bit PV kernel, but CONFIG_PV32 missing
>    (XEN)
>    (XEN) ****************************************
>    (XEN) Panic on CPU 0:
>    (XEN) Could not construct domain 0
>    (XEN) ****************************************
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
>
Sorry, sent in error - please ignore.


--------------9CE85B8894A1EA4DAEC1A850
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 13/08/2021 11:40, Jane Malalane
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210813104025.2063-1-jane.malalane@citrix.com">
      <pre class="moz-quote-pre" wrap="">Currently, when booting a 32bit dom0 kernel, the message isn't very
helpful:

  (XEN)  Xen  kernel: 64-bit, lsb
  (XEN)  Dom0 kernel: 32-bit, PAE, lsb, paddr 0x100000 -&gt; 0x112000
  (XEN) Mismatch between Xen and DOM0 kernel
  (XEN)
  (XEN) ****************************************
  (XEN) Panic on CPU 0:
  (XEN) Could not construct domain 0
  (XEN) ****************************************

With this adjustment, it now looks like this:

  (XEN)  Xen  kernel: 64-bit, lsb
  (XEN) Found 32-bit PV kernel, but CONFIG_PV32 missing
  (XEN)
  (XEN) ****************************************
  (XEN) Panic on CPU 0:
  (XEN) Could not construct domain 0
  (XEN) ****************************************

Suggested-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
Signed-off-by: Jane Malalane <a class="moz-txt-link-rfc2396E" href="mailto:jane.malalane@citrix.com">&lt;jane.malalane@citrix.com&gt;</a>

</pre>
    </blockquote>
    <pre>Sorry, sent in error - please ignore.</pre>
  </body>
</html>

--------------9CE85B8894A1EA4DAEC1A850--

