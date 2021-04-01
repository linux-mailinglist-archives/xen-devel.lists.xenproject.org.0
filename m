Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A72D3515A3
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 16:32:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104554.200104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRyMR-0005KL-Su; Thu, 01 Apr 2021 14:31:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104554.200104; Thu, 01 Apr 2021 14:31:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRyMR-0005Jw-PO; Thu, 01 Apr 2021 14:31:51 +0000
Received: by outflank-mailman (input) for mailman id 104554;
 Thu, 01 Apr 2021 14:31:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Onq8=I6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lRyMP-0005Jr-Ku
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 14:31:49 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2663b5a0-b1de-4a6a-b546-eb394d5d2eee;
 Thu, 01 Apr 2021 14:31:48 +0000 (UTC)
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
X-Inumbo-ID: 2663b5a0-b1de-4a6a-b546-eb394d5d2eee
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617287507;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=90w5jA4jbGiIkJMuDTVp0iNzjgY4wW+DiB2ka72dg18=;
  b=fzFuVhVnivcV0fmZV76AQQCB9xwImubEZDZkgUfDqGe8t/P+OdVEYTjM
   H/8L/lekTegA8nZWX2Fz6gFCYQtblve8iARXIBLaEkb98n/KcRPbV7QKz
   QkB7EvXs1CuCJ50FM7jeOZVcMwhi8awkvX4rHjj+PeIgUya+vOUQhj8zq
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: D2Qlt4VVMjKNS4+eJIO14HGPMG9+zWq6igtFUyICVMFCsYSNPC9Ewf/P3V68zhDoRx11Htna8i
 QnvXC+mqaTo98/nd0fH0QDisGZqq1tOf/tTtXpe9FcBMCmOUUVCES7Pj8iJBYw0CuV71ZVTwtN
 EPNHDb4LvTn6K1HmlX5SiUD55lQHnoFTTzvyUloArHAolVEPKIavQSkMe2pcVRx9+2DXapXy1d
 2LBFhI0pVKOdbIiqT+UNwPlZs/+OXt/zKXfC9KraQu5ToIL4eglpoMxBKeRWNnkit1qlMT2QRg
 970=
X-SBRS: 5.2
X-MesageID: 40706608
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:PjZ3dKvKpLCOqbtp0uTmAO/V7skC54Yji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOjLU5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Q26Y
 5JSII7MtH5CDFB5vrSyAOzH888hPyO9661jenTpk0dNT1CQadm8gt/F0K/Gkp5WAFJCfMCZe
 Ghz+BAoCetfmlSU9SjChA+LqP+jvDotLajWx4JABY79BKD5AnF1JfWGwWVty1uNw9n7qwl9Q
 H+8jDRxqLmiP2jzw+Z6mm71eUupPLE6v9uQPOBkdIULDKEsHfjWK1EV6eZtD445MGDgWxa9+
 XkmBsrM8Rt5365RAjcznXQ8jLt3zo053jpxUXwuwqEneXCWDk4B8Bd7LgpESfx1ks6sNlwlI
 JN0m6J3qAnaC/ooSXn69DEEyxtj0q/yEBS89I7sno3a+sjQY4UibZa0FJeEZ8GEi6/wpsgCv
 NSAMbV4+sTWU+GbljC11MfjOCEbzAWJFOrU0ICssua33x9h3Zi1XYVw8QZgzMp6I89cZ9Z/O
 7JW54Y241mf4szV+ZQFe0BScy4BijmWhTXKl+fJlzhCeUhN2/SrYX0pJE4/vujdpBN7JZaou
 WObHpo8UoJP27+A8yH25NGtjrXRn+mYDjrwsZCo5djvLnxQ6fqLD2DRFgin9DImYRePuTrH9
 KIfL5GCf7qKmXjXaxT2RflZpVUIX4CFM0Z0+xLGG6mk4buEMnHp+bbePHcKP7GCjA/QF7yBX
 MFQXz2LMVE5Ua7R2/gjHHqKjHQU3262ag1PLnR/uAVxoRIHJZLqBIphVOw4dzOLyZDvKwwdE
 53O6jmjau/uGmz8Q/zniRUEysYKnwQzKTrUntMqwNPGVjza6w/t9KWfn0XwGGKPQZlT8TdEB
 dWolN+/a7fFe3U+QkST/acdk6KhXoao3yHC6oGkqqY/MH/Z9cTFZA9QpF8Eg3NCj14kQtns3
 14dQcBX0PTfwmezZmNvdgxPqX/f8M5qBq3KcRUwEivz3m0lIUKfD8neBKAFeSQmh0jQjJIgE
 YZyd5jvJOw3RC1KWU+h+wkNkZrc2r/OsMKMC2MeJhUlrf3eAt5UGeNgniAhwsuf3fxnn9i+l
 DJPGmaf+rGDUFavW0d2qH28ElsfmHYZE5obGtm2LcNY1juqzJ20eWRYLC03HbUYlwewvsFOD
 WtW0pnHip+g9S23gWSgjCMCDEvwYgvJPXUCPAmf6vI0n2gbI2OmqduJY4iwL91cNTvuPQMS+
 SRZkucKy75Efog30iNvWk+URME20UMgLftwlno/WK41HkwDb7bJ0lnXagSJ5WZ43L/T/iF3Z
 1lhbsOzKKNG3S0bsTDxbDcbjZFJB+Wu2KwQu0yoZ1fvK45ttJIbuzmeCqN0GsC0AQ1Lc/ymk
 9bXb9y56rZPJRzO8MVYCBU8zMS5ZyyBVputhazBOAwfVsg1SCGe9yI5qfFsropDAmKohDqNV
 yW7i1a+LPEUkK4pM8nIrN1JX4Tbk42rGlm9qeFcYbbDQ2xbeFN/FagKBaGAc1gYbnAHa9Vtw
 pw5tGDgvSeeCX50h3BpDcTGNMxz0+3BcepRB+WEeFG89amKU2Bj6uj7sm0lir2Q1KAGjQlrJ
 wAc1cRYMRFgiQji4Ny0jHacN2Jnn4Y
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40706608"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPBM5Tc+T0dH8I+EGBmklATit0fKTH31R+ewPuNlWOHRYmBThTs4VlNtg1/tE0fjbqy1ZkX4aNcOMw0orRTE7QF/LYpmnIl/75YWCNVhARo5eZ0PKQncjk9Mfp+SzSPAPeaNR7c0/CFPRa97ht3Y5TOQ3Zv4GeRIpKr207VKpS5/DvppVu1yudmcc2nrnJnUYRLkx6D3uJpiSskyfXDcN6zC5r6mUTQxz9J2oMwZC74ZwuOFlkrSDCR/zc45N4KvJVf7QeHXd3VfRFYVUtFrjZ+vDh2zLixGYwLI4M2eKkqNzYv0pUvmpxRbPNZXfoGBjc/oXrlQw3cXAIC8GwXqqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udhhZcGEPQ7SLgOVIOZqqyiA5alT0Gfr+eK9vE2UNaM=;
 b=KSXejOBa0XbQQKU0Q4R/IpPjyUTR9Tzq4GuAYG498djAjnGYk3DHML+3hI23FAwvHiPJTM5jwsa7drtm55Tqi4LsYVuBFtZoz8mC7HECFIhkmnI83LOszwXdush7WWPMFAzcjBt8TRYIBSF0siaAmnWUSUdCfDtFihNk2YBLCFuEIGYd79ZDC68pKiMXlSDeWW8K8dAJazpsI3SJPQCsJP8CAeHAYPXI/L+ylBDTXT75v8Dh90KQMT1BJaK4r1Dc7N7Aq+v5rRPkL9abWlw75ChmQ8Y4yR6z8ItC4Ue1ID5HcXwtTTPLFv3Dw9+l6+rxxZBZ2pnnAEmlVy98xmdDIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udhhZcGEPQ7SLgOVIOZqqyiA5alT0Gfr+eK9vE2UNaM=;
 b=VAy61kT7OJriddVvmdS5ToGf4dhI7gIkehXRPILs3qBJWk2sHJjxMewWEI3orbDZKyMbdMWac+RvqvLRIgNCBp7hCFMMWBiZ+sgff8MxJOwwTHu9oqTl5EvUxKtNPoibkkwCv954qu896qrGK3n3CagrFblbcOd3UCV4F6lY+YM=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <46d83c92-0b06-fc09-4832-7a7d7935d5c2@suse.com>
 <d417d3f9-3278-ed08-1ff6-45a13b5e3757@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/5] x86: don't build unused entry code when !PV32
Message-ID: <eea7162f-bbf8-bce9-b989-2a44fe10fa99@citrix.com>
Date: Thu, 1 Apr 2021 15:31:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <d417d3f9-3278-ed08-1ff6-45a13b5e3757@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0146.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::7) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6782c09e-7f39-4750-d70a-08d8f51adf53
X-MS-TrafficTypeDiagnostic: BN9PR03MB6028:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR03MB6028BDD8C12FBFC90F3D07D5BA7B9@BN9PR03MB6028.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S3+8g7kzoaJ07koB5UR2YlUJyntasq+eyz+Jfrsgx8ZrCAjP+i7vzs1pRPJBmPyMikBm68dt1nXyGfi4tE8d4KKhfqnJWW/gxF9+mJeFqBhGxlJ+lhZT4NF5SDbqt7upYtGyUonbc4ride88t1CG8gu/3KD10fV8tGec02+Vv6jXuHZifTej58cKOMpRAwX2PjXjUHodKdJvQe2vGCC7hdw2dn4f0EMjmdnkh1stZoAuZGRi53HwAxnc8laE38CjCMNP/yf2ooG86o7m2+/0zlibLbMfkl9Mp1Ue+cyInXKN4mcFUe7CurS2cHkplyaSCivLzXn2NhQV13Gtq6PP2E4kyxLQAYI4axW3IhEYuA8JOx0GvA3ooHrGGgr6rl0jNUY/3ELic0HRuyqQC5rjVoxECg7W9qiEefXxm3Xw3eYNf0Q9UIkJ/LMYeIs9tpIuvodU5AdvXXJohhN2WkDDevDayBdMQn3000BbIkDfheMjdZXEDBAW0GPvDTHJBJv4MGJHgQwSNz1DEnDV6ZszU+fkt51oJtqxrDHSbBMSQRQ+Q+9IITUyiNumNdSk+x1U5oJnV/7401JF2o8Bznh8mSJRKSqyH5772VPxaDtNJI/DivOBkyrTl7zYxF4jc2amwlbjM49GxdQwi1QLi8znZEPGLFAhrxj/FoiroWtpUdX2NmUwMHMIDNOCEEYp//DZzg+N2N/rvM3MK030tRbPJPysptcUPG1zwm68HC0DOic=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(31696002)(6666004)(38100700001)(54906003)(110136005)(16576012)(86362001)(316002)(16526019)(186003)(36756003)(5660300002)(66476007)(53546011)(66946007)(26005)(66556008)(4326008)(8676002)(8936002)(31686004)(107886003)(2906002)(956004)(2616005)(478600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b29nODBFdDNwa1pONDlxeTdTOS81MXRGcExxd2dhUzRHbUVIajQwQXJldTQz?=
 =?utf-8?B?VGJrUHFWMkIyY3VLM0M2QS9wZStrdUVOaEY5TFdJYWZXY3NJOEF6U0ZQWUxY?=
 =?utf-8?B?MTVXWHZVUzVlQ3AyaUphL3l1QVR3VkJWdXlHbTZ6a0NaUEZXUWszRENpbG54?=
 =?utf-8?B?WVJnUngzYUpTbmdmbFZrajFvQnBNNXQwYjZ0aWsydHZwd2pSdDY4R1VvWEpH?=
 =?utf-8?B?R1BuS0I4SitsMzNhc1RRUlZOZFYwUXJEQlhmUGNER1JrZ2hRU3V1VHhyR2xl?=
 =?utf-8?B?N3NjcUZoZmJzYVh2QU5vcGczUVJvanBHTmtTSUl4Yk1JRm5QRzBlUElzWlE1?=
 =?utf-8?B?eWl4WDlydVJEVHBOM1I3RUc0ZVcvK0dMekRXQ0o1Q0kxd1BJdGljaCtJZ2ZP?=
 =?utf-8?B?TDE0TWFFTFZUVVFtWDlOdWw3ZndNdzQzZnVzbEltOVR6YWZlcVZXSGUyeW5R?=
 =?utf-8?B?TjM1VHZXOWZwQVBDSVdjK2FVVDBtU2dtT0s1bnRXMHRrTC9PbGxiRVdDMmJL?=
 =?utf-8?B?cFNGSVBMc2FONUJ1N1VPZTVEYm5sZThPTi83RktPMXVvSy9OSjNscEJsRTVW?=
 =?utf-8?B?c3REOXJQcEZ3U3NBb3BvSXVtbUZHRGdKaVdMMjQ1RTc4aUpaWkM4R0YrZWtx?=
 =?utf-8?B?ZUlWN3hnZjR5KzZ4ZGtsc0FVVFJvVGFzSWwzZjEwdllObGJSUVVaL2JIcGRo?=
 =?utf-8?B?bXI2S2dtdTNranhzUUxwSWNoQ0RTN0YydWdJeGo2NVNvQ1h1Q0hqcDR5cUY5?=
 =?utf-8?B?dGtpcDUxSkpQVW9IWlEwa0dDam53L2NFYTJSKzlIdnorUU9kUHJVSFVRZVF0?=
 =?utf-8?B?VGttVGRpVy8wQm1mREd4aTRGTTJHK05hWXRWSWtLdGdGM1p5OGE4ajZRalF0?=
 =?utf-8?B?REp3ZTk3M0NSZFBtRmNaSFM0NmJVYzBpYkZSczB3Q1dkT2Y4dVk5TEZmOVEv?=
 =?utf-8?B?Y3c0eEc5S1ZISFplT3lkSjM4US9nNXdFeTRJTE15dlpXcXY4SXhOSWp6WjRa?=
 =?utf-8?B?aGN3REpxVXZYM0RYR25vbmVoUE5qNkNpaG54RVgzQ2R0bUtkS2pJZ0JZM3Bu?=
 =?utf-8?B?MFlSa2d2bkpvUEZtd0VYV0t2M0dDaXhiQWZGNmxzczByaUh1Y3N1ZXBKUU9m?=
 =?utf-8?B?TjF1d2NnSU01ZlZiS1g0SkUrcml4UU9manB3UmNVbW1DRmk1V2RQeXZoSlE1?=
 =?utf-8?B?VFhoNlZVcER1emJES0s5Um92ZUgzMlVMejR2MWd3RmNMSHNiN1ZxM255NGJz?=
 =?utf-8?B?NHhrelF5ME1sRVZxZHY4Z0FWRlhST0tUSmlyQVJhNFJVTGRUVUpGS29uRGs2?=
 =?utf-8?B?MU1sQ1o4QW9ZL1FEZDhUdWlZUjVSOTlqOHRJMnB6WmQ4aGZmVVdhYmluWmQy?=
 =?utf-8?B?ZEtBclRHcjlGNUNidmEvcmpWUHIrbUdNMUhKUFdYOHd4b09Kb0tCUDV5YWk5?=
 =?utf-8?B?MXVlcVgvc0g5bHU0V1FHYzRZS1BzU1FoendoR1dNRGRTNHBQczFINFY3RVRJ?=
 =?utf-8?B?NC9JZThTanJpNXVaV1FsWlMzK2pnTDNPOWI0VG54eUJqWUhqN0RVcXhidmF0?=
 =?utf-8?B?aUcwQWVDbHRLYW1TQnpkMldncVdsMHJCSE5yWklGVFlPdEVLOE1jZEZDNUVi?=
 =?utf-8?B?YXUzcGdNZ1pIQ21Qd1o1V0hGbDg0dlQ4cEwvWkdKNnNsVTVINDJ0TWZVUmRK?=
 =?utf-8?B?SVlKbEZReDV4ejNGOHFxNnN4eXVET2Yvc2VhNjFLdkh6Vnc0S0drTTNWVm8z?=
 =?utf-8?Q?3e2t2Jt3/I1QWc5256afKE/5h4znDSyHzNtPL5c?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6782c09e-7f39-4750-d70a-08d8f51adf53
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 14:31:43.9052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MlFm3YKNS0TxFTRcjkM6dZlzCF2z/veoUOzf0EcamD53ZzNrNTZxvpdwtC3Vm1JOt73wWghzyCbUOMkSVeKJ1w5H9BCZ5WjeBSsAQKUN50Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6028
X-OriginatorOrg: citrix.com

On 25/11/2020 08:51, Jan Beulich wrote:
> Except for the initial part of cstar_enter compat/entry.S is all dead
> code in this case. Further, along the lines of the PV conditionals we
> already have in entry.S, make code PV32-conditional there too (to a
> fair part because this code actually references compat/entry.S).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> TBD: I'm on the fence of whether (in a separate patch) to also make
>      conditional struct pv_domain's is_32bit field.
>
> --- a/xen/arch/x86/x86_64/asm-offsets.c
> +++ b/xen/arch/x86/x86_64/asm-offsets.c
> @@ -9,7 +9,7 @@
>  #include <xen/perfc.h>
>  #endif
>  #include <xen/sched.h>
> -#ifdef CONFIG_PV
> +#ifdef CONFIG_PV32
>  #include <compat/xen.h>
>  #endif
>  #include <asm/hardirq.h>
> @@ -102,19 +102,21 @@ void __dummy__(void)
>      BLANK();
>  #endif
> =20
> -#ifdef CONFIG_PV
> +#ifdef CONFIG_PV32
>      OFFSET(DOMAIN_is_32bit_pv, struct domain, arch.pv.is_32bit);

Even if PV32 is compiled out, the is_32bit field still exists, and is
still necessary for crash analysis.=C2=A0 XCA parses this offset informatio=
n
as part of dissecting /proc/vmcore.

It's one single bool in a fixed size allocation which we've got plenty
of room in.=C2=A0 It can and should stay to avoid impacting the existing
diagnostic tools.

~Andrew


