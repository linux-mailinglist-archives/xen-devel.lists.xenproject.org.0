Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 459714544FF
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 11:29:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226723.391891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnIC2-00038g-9P; Wed, 17 Nov 2021 10:29:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226723.391891; Wed, 17 Nov 2021 10:29:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnIC2-00036s-63; Wed, 17 Nov 2021 10:29:30 +0000
Received: by outflank-mailman (input) for mailman id 226723;
 Wed, 17 Nov 2021 10:29:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=74+5=QE=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mnIC0-00036m-6x
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 10:29:28 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bb8093a-4791-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 11:29:26 +0100 (CET)
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
X-Inumbo-ID: 3bb8093a-4791-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637144966;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=OzN2ANRw0Bx1B/Cw1PBWIhM0wENT9s73Pj2IaNDPCxM=;
  b=ERH8i1AwqVsxrvnJatZFGKhzi4WDtaF/9R7UvnpTpRi4O3zEhAtHUG+W
   ofNZnof1PuObTl/QRBcdgCIv08B/NT/HaH7tYhEhemiYyJiGR5UVeI8dQ
   BzePBP7gYqgzLoWZF2YVO2UMQvj2BId1NVp5iuHirEr15YmqSl0sY0lFS
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 9ugRz5hHfwXeOlG4lSxeb9F7TGMiKnPcnd1QkhcaemSr2D0zT0xXxY5y+BOReHKQeqPQ1hgxyG
 KJ3nFZuo0awKHIYKf9T2dSlCRTORf+WhhfG/s4qb4wPCFbRR8hLaPP2tTgEzryfdyTZ6VZc5+h
 q3yQGI6rXDlyDdTsLeR6HiufPo8dy002V1aUw0gS5Pt2CdSZjaxqUr6v7tRk2Rc6fysqQF8/ez
 xCRRkfzALZtCqsiPs/xnyqYTckXj08BqBm3IMnOlHeo1l5X/3vK22qHOu/z5Bsab6d0Z7vV6Wz
 zuq2CIegWeyXTBULvPfvD6Ei
X-SBRS: 5.1
X-MesageID: 58016358
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:pmFnuqifYybzqR5WCl37/yUXX1614RcKZh0ujC45NGQN5FlHY01je
 htvXzvXO6ncamTzf9BybI/ioUxXsMSEz9U1HQZp/yw3RiMb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cx3oDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1Ts5uzawEPY5fdmcImXUZ1VDxzHIx/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t1pgXQ62DN
 6L1bxJoVkvdShpva2weN7w6jMmSgV3uYTNx/Qf9Sa0fvDGIkV0ZPKLWGNHSf9mXQ8RJjwCdr
 2TP8GnjKgEXMsSFzjiI+W7qgfXA9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03A
 04e9zcqrKMy3Fe2VdS7VBq9yFaFoRw0S9dWC/c96gyG1uzT+QnxO4QfZmcfMpp87pZwHGF0k
 A/S9z/0OdBxmKOTTnG/8JHJlyKzHxMbckJFeCIlbDJQtrEPv7oPph7IS99iFou8gdv0BSz8z
 li2kcQuu1kApZVVjvvmpDgrlxrp/8GUFVBtum07S0r8tlshDLNJcbBE/rQyARxoCI+CBmeMs
 3Ef8yR1xLBfVMrd/MBhrQhkIV1I2xpnGGGM6bKMN8N4n9hIx5JFVdoIiN2ZDB03WvvogRezP
 CfuVfp5vfe/xkeCY65teJ6WAM8316XmHtmNfqmKNYUWMsctK1PdrXwGiausM4bFyhNEfUYXY
 8nzTCpRJSxCVfQPIMSeGY/xLoPHNghhnDiOFPgXPjys0KaEZW79dFv2GADmUwzN14vd+F+92
 48Gb6OikkwDOMWjMni/2dNCdjgicClkba0aXuQKL4Zv1CI9Qzp/YxIQqJt8E7FYc1N9yr2Vo
 yrjAxAAkzISRxTvcG23V5yqU5u2Nb5XpnMnJy08e1Gu3nkoe4G066kDMZAweNEaGCZLlJaYl
 tEJJJeNBOphUDPC92hPZJXxttU6Jh+qmRiPL2yuZz1mJ8xsQAnA+9nFeArz9XZRUnrr5JVm+
 7DwhBnGRZcjRhh5CJqEYvyY0F7s72MWn/h/XhWUL4ALKlns6oVjNwf4kuQzf5MXMRzGyzbDj
 1SWDB4UqPPjuYgw9NWV16mIo53wS7l1H1ZAHnmd5rGzbHGI8m2myI5GceCJYTGCCz+kpPT8P
 b1YlqiuPucGkVBGt5tHP4xqla9utcHyo7J6zxh/GCmZZVqcFb49cGKN2tNCt/MRy+YB6xe2Q
 E+G5vJTJa6NZJH+CFcUKQcoMraD2PUTlmWA5Pg5Ohyntip+/b7BWkROJRiczidaKeItYo8ix
 O4gvu8Q6hC+1UV2YorX0HgM+jTeNGEEXoUmqooeUd3ihQccw11fZYDRV33t65aVZtQQakQnL
 1d4XkYZa2iwEqYaT0cOKA==
IronPort-HdrOrdr: A9a23:vKVTP6xLbzPJuH/6cwFRKrPwEL1zdoMgy1knxilNoHtuA6ilfq
 GV7ZEmPHDP+VUssR0b+OxoW5PvfZq/z+8T3WB5B97LNmTbUQOTXedfBODZsl/d8kPFltK1/J
 0QCpSXV7bLZmSS9/yU3OATKadZ/DD9ysyVuds=
X-IronPort-AV: E=Sophos;i="5.87,241,1631592000"; 
   d="scan'208";a="58016358"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBJVwxcJUXnVUijqq1Bldd7aImwKMzxzlhosumJRlsndLEVHozLQ5e/WqgjsKPMaIXZkhuWVDcs/6H8JwW34TKi2Lumv3Y1wZuOFRydDHaopr7Zx67tmpLX7GS35YN0ILOXkp3/X7XSS1/A9mQwPtOiakW9H8FH5DaQ6AvZC6sPbSRQl7QZO35BB9xlxMDVn87eE+1L96hNmSMx5GkjATemNt0t4sd+4261uX21w4nYKT4sCdUO1DcgbgzAYwsL9ycYxXtZiWhkKQjPV3+hnNEtar/ao9jCKFlWMh/DwIWJqFH5CJoGmnPDXR/yOAlA8rw4qCS817nCgG/vd7fue9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6zGlFseuIs70eUpOKiqS0UQx1XrROLLCTaY9AWaHo4=;
 b=W6aOl/L1G61MitA9RS8QVBX6WgHy/PfAC9F+V5q47s8IbSsLPTmdWVV6wKRji6SSao7qd77PbrTkcTaHWF78UdAYhKQbt1w4eXWe1qGMDnVUMfE2zRXECH46y2LJ/i9bLkYY7TeCGIFwYdyTG2hRjAEOF3p1nerH/EBQIZlZav9XDEMzzBlrA4vf8d+Yt7vOnZI7OLFUYi7/DUCO128aE+owJ9wuSFEIPHHY7PISt/VIPpFSuFY7K1BkwZXF1Yii9f/A7g2V+9FMmp5ez8zjywEFcD+Z1m8RsHu3+FlcIRBmvkPUMwHW9Slo6R90Oiz7Nht8Zyt6Ys1M+cK0zVK2xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6zGlFseuIs70eUpOKiqS0UQx1XrROLLCTaY9AWaHo4=;
 b=IvzL5X/pvIk13+rab+3klA0nMVLDijQrH1IovsE6QLaCsLKKB7DRVFd69326vsboBeEkPxd7b0WmQl8cFsIYYOWONTWD0U3ab/EwIF7VJNVC2dS0fsxmKv4N3gmUJ7ct2GbZAHbVP+McwTvn0/Um8YLWYHtg9YBW69zJteoXnwI=
Date: Wed, 17 Nov 2021 11:29:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Community Manager
	<community.manager@xenproject.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.16 1/2] CHANGELOG: set Xen 4.15 release date
Message-ID: <YZTZdSfVYFwqR1I4@Air-de-Roger>
References: <20211117095338.14947-1-roger.pau@citrix.com>
 <20211117095338.14947-2-roger.pau@citrix.com>
 <0994aad7-0e2b-a78c-5b23-422c93dea353@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0994aad7-0e2b-a78c-5b23-422c93dea353@suse.com>
X-ClientProxiedBy: PR3PR09CA0029.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8852da3-9699-4620-20c3-08d9a9b51b08
X-MS-TrafficTypeDiagnostic: DM5PR03MB3148:
X-Microsoft-Antispam-PRVS: <DM5PR03MB3148170D5FA121D6CA27A62A8F9A9@DM5PR03MB3148.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:439;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /NhP2Quq8EoXlgWSdVR5VXxGnf/txdRbtMvvTkog5EEg5pTecmp9Mi4GCpE696Ge2ehCDMN/AYWk81r/S9EIdw6H0CatbeFsgF1vPK5ckarpfkjlXQI8TbGa5NrsIRpELKi4jo5e8bUsO67lRvUYevQOUXL2Nmq0Fuxsl9zhikbQox9AnlXuldHJSS0BL/ssnb3p7ecvQeatI/L/MHgvba5sFC3TaVIbGmT/Ji2I6z8G12juYx+NOMWz5gc09VBRF++CwxornKkCcUk02ODiE6OGQESGd4d+F0zb38tKsdjIEGJaYtKM8G1vrWU1Pgtk6tR3osayggp3WvNBjRJt9TF4s2M4vuYF5VWCmMOOY3gadu2wsUZQqwMThDXHXR+XQI6k/+7+qpdUTR3bCO+p8JXsYmteM/vVzzBmb3Wxhi/39DYyJXyB1voSB80gbTuWQWHg4eUQjUYk7QcghnlwCPoZhBmCUvGmb/uk26DCoNhXOlUfNPEibcrlC1AaGHAYE5VgWD5VGgvWhOlO2sRFu8/l10i0azOGJFnuUZ5zWS0zo/ey9eLq85tKQsn+QsLVaJQ5HRCjnDnzCBX25Ugpo0kUDe74GAdxmgEpEzO9UITbDmx97F/8J8MDNepe2SgzcDsSdWtwK1dxFYWV4e+nD/HHeyY7POxvuP58ZJmez8UYNHLGs1Rum/M0rFll62HttgPgleQUsjMTi8Y1nmqU9PkniXIj2ZGCTnmVS6rQppLGPgcwUoALBdxnMWcT1j4XK8jiz5ODJUaBWDVBsbSwdRZs93eHjjkruX9eAQYIqKr2uGxVoqvScFEZ8LlErbE29YRjOhAS8x9POeXQ0+R6GJblw3MsqNV7nZWRcD5wadPSbVCtw740J6SHxGNFB1qt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(66556008)(316002)(6486002)(82960400001)(6666004)(66946007)(83380400001)(4326008)(38100700002)(8676002)(508600001)(85182001)(5660300002)(186003)(66476007)(9686003)(6496006)(966005)(26005)(8936002)(86362001)(2906002)(53546011)(33716001)(54906003)(6916009)(956004)(59356011)(219803003)(207903002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1pmY2xtMUNyZjVlQ0NyNEx6VWh5UWc4blM0ZzJrRERxSExPaS94elJMRHJj?=
 =?utf-8?B?ZVVSdGZSRzJmNWFFY1FaalFQTGplTlJJRHd0eUptdFhnRVBrN0pNd09qZ1Q2?=
 =?utf-8?B?MlNwK240eE1GeFA1SjRYUUM0eFkvNkZzNFpMbENkcnhGdVkxZnJpaTVEYkI5?=
 =?utf-8?B?Z2hDNENHSXU5a2NtaWRnMzV4emlFdFlZWHFheE5sSGpENFNMQTV2bGtKbng2?=
 =?utf-8?B?TVl5RHV2V043a0R6aTl1Mm5NSmo0MFhrTTBLVkRYZ0FQQkNKS0dHcVhoMG5Q?=
 =?utf-8?B?cnlJc0hjam9zdWZVR0twYVA3WDFOUUR4TFBaZnBTTmFrQWZjcFVFdEJYQ2Zy?=
 =?utf-8?B?d0kyS05qM29QZkdkYlpJVk1FUDJLSC9Wc1NnWHc3bFlIQjVzM3lzUE5zWXZQ?=
 =?utf-8?B?cVA2dGdDTmhpTUZnamhFdVpWbExsNnl5czZKc012VnpDK3orc0RGcC82S3Bx?=
 =?utf-8?B?aVh3QndFSVRlRElCZU9PbWFpVmxkZ3hBYTIwQzlVQ0syekRUUFVtcVVuampJ?=
 =?utf-8?B?M05TaXFPSXBhVHg0MFZITTQrOUhxemZ5aTMvNERsZG9mSXRVTkFFQ3hERGMz?=
 =?utf-8?B?TExQMitGeWVkQ2MrL21UeVZPR1djVmxSb3p1SVhJamRseXFmTXhTekVXaWJP?=
 =?utf-8?B?YUxocUR3WGNRUVFNNnA4Z1VKdGNRL1pRNlpyZUQzNnFoV25PdTRnN1BaUitw?=
 =?utf-8?B?emxCWjFHaXd3QnYzWEhUQUNMenkxOHBOc0t1eThlUVhVM0xtQzFJb012UzMx?=
 =?utf-8?B?bng2V1JIcW5jNmlUOFdTdi80TkR2VXI1akxlWFBvY2xIam9DTFJhbmtlNld2?=
 =?utf-8?B?dEg4NCtTRXZhM08wNklTaG9WUFROSjdrcW9mZm5tdXZLeTNyTzlKVW1VSSsz?=
 =?utf-8?B?NkRpa2hoZ0hvSUUyaDAycSt3VlZ5UXg5MytpK2Y1RlNmcE5lZEphZVk0V2Vt?=
 =?utf-8?B?VjdDYllmL1crSG5qdGtaK1ZCam9uZkpTc3pkYWZqbWlOa2luaXR4L2lnVnlW?=
 =?utf-8?B?N0g5VE1lOGQ0ZjhkQ2pRZEJmMUNjUi8wbG1WT21UaElWR3pjYmpUWEhueDZw?=
 =?utf-8?B?NThuYVRaUlpkSXVwNXV4bmdUMU04bFFqakF5cGU2blZ1K3E4MU5oMy9iUXI2?=
 =?utf-8?B?RERlNTFvWjM3eERDOG9uOHNoU3R0OVJ1Qk5VVWRETW1xVExWZ00wZ21qSTJC?=
 =?utf-8?B?NkhqVzRrWlNudmRGWk5zYXJVNHgycGFJTDZDL0p1SlluTUowMmhIem1WNUJn?=
 =?utf-8?B?T3REQVljQ3E3c3l0aUFYL2lmMUNvcnJLVzE5Q1FHRFh6UlVHYyt5L21qVWhK?=
 =?utf-8?B?cTVubXF3cTJSdUVqZ0hvMHdaTmx4NWlwUFVDaXNzRVRzUzRXNU1MSkZUbzBF?=
 =?utf-8?B?My9EcnlTVFJUdjAzc3RGNEJ6MjdZdGlBWEdZUEhZM29XV3JkbGw1cFdnN1VZ?=
 =?utf-8?B?T3Jza2RZeEhwZlZqZkdFMkRZQ1ovdlNDUENRb1lhVWphMTQ5U3hML2xRa2Fv?=
 =?utf-8?B?bUpNLzJSUS9UeHhjZE4wREM2TnNPWXQwYWp3cmNXcjVsVUpvcURRTXFjT0tq?=
 =?utf-8?B?VHAxVkpyMWZGZjFIT0d6dmpCd1dhYUlTQ1JtSTB4QzNwaEJiN0U5YjVPRWNQ?=
 =?utf-8?B?dFBpQ2YzMDBZRStJdXBQSEVLT3ZmblhBT1BIdFdjck5OQVJjTCtWTktXNHBj?=
 =?utf-8?B?bytvZEFjNnRtcGVxbWxJT2lDZUVCdWo0SFdncE4vZ2ZLU25yeVYrRElDaVdu?=
 =?utf-8?B?SkxLRWpVbk9RdzFNRVI0TmdtTFVnVW5EODgwS09LMVFaSHRjbURWcHovQlZJ?=
 =?utf-8?B?Y1Z4SFZ3UFc0aVVOeXRCMHlBckhxTldiakZYZHpnRFcrK0NMaW44Sm1hRFky?=
 =?utf-8?B?cjJBYWkvcHJkYmh3R2x5MjFZWkgxUy9BbFBsRHhoWndRQjFtVUFvZzZQSlVy?=
 =?utf-8?B?dnN2T3FsRFZkSUlNUklzdHBFRXpCNWpnK0s4VTZpUEhlV1N4MGhlQzZPeFg4?=
 =?utf-8?B?VmJ3RTAxYmhHc3JXK3VjTnZ6MDdLT1Z3YWJoVjVnUEhHU2MxdlB0cUpKYVk1?=
 =?utf-8?B?Y09hVUtHdlNWTHRtMVVCcGNpN0IzTXFBNXJxMGN1dElqTUoyaGVCdjE1VFVO?=
 =?utf-8?B?Zm9ZcmF0bllLZlVtR2trVGVpS0RqdWtVbnFhazlnTUsvVDNXVEFZanNPeDVF?=
 =?utf-8?Q?8dJE5HuvLjk8SHAOwbTT9Yo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8852da3-9699-4620-20c3-08d9a9b51b08
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 10:29:15.9209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vH+Fu6H0Y/hetfGQlzBiClXZF21s593LbHzPadtFUySGYWRkhdOyUrPFWLg/Utw5UjWDNnkhBKkfv4/VaTiYmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3148
X-OriginatorOrg: citrix.com

On Wed, Nov 17, 2021 at 11:21:34AM +0100, Jan Beulich wrote:
> On 17.11.2021 10:53, Roger Pau Monne wrote:
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> I'm puzzled how we managed to have missed that.
> 
> > --- a/CHANGELOG.md
> > +++ b/CHANGELOG.md
> > @@ -22,7 +22,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
> >     no longer be built per default. In order to be able to use those, configure needs to
> >     be called with "--enable-qemu-traditional" as parameter.
> >  
> > -## [4.15.0 UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - TBD
> > +## [4.15.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - 2021-04-08
> 
> One day off is not really a problem, but I wonder how you ended up with the
> 8th. The tag was made on the 7th, and the commit that was tagged had been
> made on the 6th.

Both the announcement and the blog post where on the 8th, so I think
that's the official release date, not really when the tag was made.

https://lists.xenproject.org/archives/html/xen-announce/2021-04/msg00001.html
https://xenproject.org/2021/04/08/xen-project-hypervisor-4-15/

Thanks, Roger.

